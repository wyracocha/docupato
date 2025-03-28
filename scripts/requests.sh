#!/bin/bash
INPUT=$(tr -d '\n' <  $PWD/flows/case02.md)
TXT="crea un diagrama de secuencia usando lenguaje mermaid.Para ello usa el siguiente texto: ${INPUT}. La respuesta debe estar en formato mermaid pero sin comentarios adicionales"

#echo $TXT

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
