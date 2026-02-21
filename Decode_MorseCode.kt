package morsecode

fun decodeMorse(code: String): String {
  // val letter = MorseCode[morse]
    return code.trim()
        .split("   ")
        .joinToString(" ") { word ->
            word.split(" ")
                .filter { it.isNotEmpty()}
                .map { MorseCode[it] ?: ""}
                .joinToString("")
        }
  
}
