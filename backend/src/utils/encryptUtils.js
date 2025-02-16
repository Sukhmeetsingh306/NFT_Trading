const crypto = require("crypto");

const ENCRYPTION_KEY = process.env.ENCRYPTION_KEY; // Must be 32 bytes
const IV_LENGTH = 16; // AES block size for CBC mode

// ✅ Encrypt Function
const encrypt = (text) => {
  const iv = crypto.randomBytes(IV_LENGTH); // Generate IV
  const cipher = crypto.createCipheriv(
    "aes-256-cbc",
    Buffer.from(ENCRYPTION_KEY, "hex"),
    iv
  );
  let encrypted = cipher.update(text, "utf8", "hex");
  encrypted += cipher.final("hex");
  return iv.toString("hex") + encrypted; // Combine IV + encrypted text
};

// ✅ Decrypt Function
const decrypt = (encryptedText) => {
  const iv = Buffer.from(encryptedText.slice(0, IV_LENGTH * 2), "hex");
  const encrypted = encryptedText.slice(IV_LENGTH * 2);
  const decipher = crypto.createDecipheriv(
    "aes-256-cbc",
    Buffer.from(ENCRYPTION_KEY, "hex"),
    iv
  );
  let decrypted = decipher.update(encrypted, "hex", "utf8");
  decrypted += decipher.final("utf8");
  return decrypted;
};

module.exports = { encrypt, decrypt };
