using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace lab4_20120335
{
    internal class AES
    {
        public static byte[] Encrypt(string plainText, string password)
        {
            byte[] iv = new byte[16];
            byte[] key = new Rfc2898DeriveBytes(password, iv, 1000).GetBytes(32);

            byte[] encrypted;

            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                aes.IV = iv;
                aes.Padding = PaddingMode.Zeros;
                aes.Mode = CipherMode.CBC;
                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                try
                {
                    byte[] plainBytes = Encoding.UTF8.GetBytes(plainText);
                    encrypted = encryptor.TransformFinalBlock(plainBytes, 0, plainBytes.Length);
                }
                catch (CryptographicException ex)
                {
                    throw new CryptographicException("Error encrypting data.", ex);
                }
            }

            return encrypted;
        }

        public static string Decrypt(byte[] cipherBytes, string password)
        {
            byte[] iv = new byte[16];
            byte[] key = new Rfc2898DeriveBytes(password, iv, 1000).GetBytes(32);

            string plainText = null;

            using (Aes aes = Aes.Create())
            {
                aes.Key = key;
                aes.IV = iv;
                aes.Padding = PaddingMode.Zeros;
                aes.Mode = CipherMode.CBC;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                try
                {
                    byte[] plainBytes = decryptor.TransformFinalBlock(cipherBytes, 0, cipherBytes.Length);
                    plainText = Encoding.UTF8.GetString(plainBytes);
                }
                catch (CryptographicException ex)
                {
                    throw new CryptographicException("Error decrypting data.", ex);
                }
            }

            return plainText;
        }
    }
}
