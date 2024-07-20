package moe.scarlet.library.util

import java.security.MessageDigest
import java.util.*
import javax.crypto.Cipher
import javax.crypto.spec.SecretKeySpec

object Crypto {

    private val KEY = "nekomikoreimu".generateKey()

    private fun String.generateKey(): SecretKeySpec {
        val keyBytes = this.toByteArray(Charsets.UTF_8)
        val sha = MessageDigest.getInstance("SHA-256")
        val key = sha.digest(keyBytes) // 256
        return SecretKeySpec(key.copyOf(32), "AES")
    }

    fun String.encrypt(): String {
        val cipher = Cipher.getInstance("AES/ECB/PKCS5Padding")
        cipher.init(Cipher.ENCRYPT_MODE, KEY)
        val encryptedBytes = cipher.doFinal(this.toByteArray(Charsets.UTF_8))
        return Base64.getEncoder().encodeToString(encryptedBytes)
    }

    fun String.decrypt(): String {
        val cipher = Cipher.getInstance("AES/ECB/PKCS5Padding")
        cipher.init(Cipher.DECRYPT_MODE, KEY)
        val decryptedBytes = Base64.getDecoder().decode(this)
        return String(cipher.doFinal(decryptedBytes), Charsets.UTF_8)
    }

}