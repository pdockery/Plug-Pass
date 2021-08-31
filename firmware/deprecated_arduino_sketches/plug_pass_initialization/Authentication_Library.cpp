#include "Arduino.h"
#include "Authentication_Library.h"

KeyDatabase::KeyDatabase()
{
}

KeyDatabase::~KeyDatabase()
{
}

bool KeyDatabase::Contains(String key)
{
	// Yes, we are brute forcing this despite the fact that we should sort the array if it's all predefined
	//and despite that scene in silicon valley where Richard was mocked mercilessly for brute forcing a sorted list in his early days at hooli.
	for (int i = 0; i < numKeys; i++)
	{
		if (validKeys[i] == key)
		{
			return true;
		}
	}
	return false;
}

int KeyDatabase::GetNumberOfKeys()
{
	return numKeys;
}

String KeyDatabase::GeneratePsuedoRandomKey()
{
	
	//randomSeed(analogRead(A0)); Bad method of generating random seed...
	switch(random(0,6))
	{
		case 0:randomSeed(analogRead(A0));
		break;
		case 1:randomSeed(analogRead(A1));
		break;
		case 2:randomSeed(analogRead(A2));
		break;
		case 3:randomSeed(analogRead(A3));
		break;
		case 4:randomSeed(analogRead(A6));
		break;
		default:randomSeed(analogRead(A7));
		break;
	}
	
	String randomKey = "";
	for (int i = 0; i < 8; i++)
	{
		int rand = random(0, 16);
		switch(rand)
		{
			case 10:
			randomKey += "A";
			break;
			case 11:
			randomKey += "B";
			break;
			case 12:
			randomKey += "C";
			break;
			case 13:
			randomKey += "D";
			break;
			case 14:
			randomKey += "E";
			break;
			case 15:
			randomKey += "F";
			break;
			
			default:
			randomKey += rand;
			break;
		}
	}
	return randomKey;
}