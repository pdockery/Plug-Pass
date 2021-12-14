#include "Arduino.h"
#include <EEPROM.h>

#define PAIRED_KEY_BYTE_1_ADDRESS (6)
#define PAIRED_KEY_BYTE_2_ADDRESS (7)
#define PAIRED_KEY_BYTE_3_ADDRESS (8)
#define PAIRED_KEY_BYTE_4_ADDRESS (9)

uint32_t ConvertUint8toUint32(uint8_t int1, uint8_t int2, uint8_t int3, uint8_t int4);

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
	const uint32_t AuthKey = 0x23593232;
	const uint32_t AdminKey = 0x12583236;
	const uint32_t ResetKey = 0x34849372;
	const uint32_t CommuterInitKey = 0x64382396;

public:
	KeyDatabase();
	uint32_t GetAuthKey() { return AuthKey; }
	uint32_t GetAdminKey() { return AdminKey; }
	uint32_t GetResetKey() { return ResetKey; }
	uint32_t GetCommuterInitKey() { return CommuterInitKey; }
	uint32_t GetCommuterPairedKey();
	void CreateNewCommuterPairedKey();
	void ResetCommuterPairedKey();
	bool IsPaired();

};