using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text;
using System.IO;


/// <summary>
/// Summary description for Encryption
/// </summary>
public class Encryptor
{
    static byte[] bytes = ASCIIEncoding.ASCII.GetBytes("ZeroCool");
    public string Encrypt(string Newword)
    {
        if (String.IsNullOrEmpty(Newword))
        {
            throw new ArgumentNullException("The string which needs to be encrypted can not be null.");
        }

        DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
        MemoryStream memoryStream = new MemoryStream();
        CryptoStream cryptoStream = new CryptoStream(memoryStream, cryptoProvider.CreateEncryptor(bytes, bytes), CryptoStreamMode.Write);

        StreamWriter writer = new StreamWriter(cryptoStream);
        writer.Write(Newword);
        writer.Flush();
        cryptoStream.FlushFinalBlock();
        writer.Flush();

        return Convert.ToBase64String(memoryStream.GetBuffer(), 0, (int)memoryStream.Length);
        
    }

    public string Decrypt(string oldword)   //by me
    {
        if (String.IsNullOrEmpty(oldword))
        {
            throw new ArgumentNullException("The string which needs to be decrypted can not be null.");
        }

        DESCryptoServiceProvider cryptoProvider = new DESCryptoServiceProvider();
        MemoryStream memoryStream = new MemoryStream(Convert.FromBase64String(oldword));
        CryptoStream cryptoStream = new CryptoStream(memoryStream, cryptoProvider.CreateDecryptor(bytes, bytes), CryptoStreamMode.Read);
        StreamReader reader = new StreamReader(cryptoStream);
        return reader.ReadToEnd();
    }

}
