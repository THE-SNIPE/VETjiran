const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

// Mock database of valid Medical ID codes for vets
const validMedicalIds = new Set([
  'MED123456',
  'MED654321',
  'MED111222',
  // Add more valid IDs as needed
]);

// Simulate integration with official vet board API (mock)
async function verifyWithOfficialVetBoard(medicalId) {
  // TODO: Replace with real API call
  const officialValidIds = ['MED123456', 'MED654321', 'MED111222'];
  return officialValidIds.includes(medicalId);
}

exports.verifyVetMedicalId = functions.https.onCall(async (data, context) => {
  const medicalId = data.medicalId;
  if (!medicalId) {
    throw new functions.https.HttpsError('invalid-argument', 'Medical ID is required.');
  }

  const isValid = await verifyWithOfficialVetBoard(medicalId);

  if (isValid) {
    return { valid: true };
  } else {
    return { valid: false };
  }
});
