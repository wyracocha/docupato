#!/bin/bash
INPUT=$(tr -d '\n' <  $PWD/flows/case02.md)
TXT="crea un diagrama de secuencia usando lenguaje mermaid. Recuerda que como salida espero solo recibir el codigo generado, no necesito ninguna explicacion sobre la respuesta. Para ello usa el siguiente texto: ${INPUT}"

echo $TXT

curl https://api.openai.com/v1/responses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
  "model": "gpt-4o",
  "input": [
    {
      "role": "system",
      "content": [
        {
          "type": "input_text",
          "text": "'"$TXT"'"
        }
      ]
    }
  ],
  "text": {
    "format": {
      "type": "text"
    }
  },
  "reasoning": {},
  "tools": [],
  "temperature": 1,
  "max_output_tokens": 2048,
  "top_p": 1,
  "store": true
}'
