#include "Arduino.h"
#include <String.h>

class KeyDatabase
{
	// My understanding of cryptography is likely not sufficient for production. Here is my understanding:
	// a 32 bit key can be expressed as a hexadecimal string 8 characters long
	// at 32 bits the number of possible keys is 2^32
	// In a brute force attack if we allow 1 key attempt per second the maximum amount of time required to find a single key is about 136 years (2^32/(60*60*24*365.25)).
	// The average would take about half that time (68 years)
	// For every key we add the average brute force time then becomes 68 years/n.
	// We then can have 68 random keys and expect that it will take about a year for any one of them to be guessed in a brute force.
	// This should be sufficient for our purposes as this is a temporary solution and the means of attack for this product
	// would likely be social engineering or theft to get a valid code or opening the box to splice wiring.
	private:
		int numKeys = 2;
		String validKeys[2] = {
			"A9873D79", // Company A
			"B9873D79", // Company B
		};
	
	public:
		KeyDatabase();
		~KeyDatabase();
		bool Contains(String key);
		int GetNumberOfKeys();
		String GeneratePsuedoRandomKey();
};