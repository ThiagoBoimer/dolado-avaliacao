# Avaliação Dolado - Questão 4 e 5

## Questão 4

**Enunciado:**

Implemente um script Python que extrai os resultados para uma determinada busca no endpoint da API pública do Mercado Livre. Com base nos resultados da busca, execute uma análise exploratória sobre esses dados utilizando uma ferramenta de visualização.

**Endpoint:**

https://api.mercadolibre.com/sites/MLB/search?q=cofre

**Requisitos:**

I. Caso mude a busca, exemplo de cofre para câmera de segurança, as visualizações devem se adequar aos novos resultados.

II. Considerações sobre os dados.

**Como executar?**

1. Instalar os requisitos

```sh
pip install -f requirements.txt
```

2. Executar 

Executar o arquivo `questao4.ipynb` num aplicativo que suporte notebooks python.

## Questão 5

**Enunciado:**

Escreva uma query SQL que retorna a lista de vendedores que tem recebido até 1024 reais em até três transferências. Em outras palavras, o nome do vendedor vai ser listado se existir três ou menos comissões de modo que a soma dos valores recebidos não seja inferior a 1024 reais. Observe que pode haver mais de três comissões para mesmo o vendedor, desde que três ou menos comissões totalizem 1024 reais. O resultado por pode ser observado por nome do vendedor (ordem ascendente).

As colunas comprador e vendedor contém nomes dos correspondentes envolvidos nas comissões. A coluna data contém a data do pagamento da comissão e a coluna valor contém o valor recebido em reais. Você pode assumir que o comprador é diferente do vendedor em cada linha.

A tabela Comissões tem a seguinte estrutura:

```sql
CREATE TABLE comissoes (
  comprador VARCHAR NOT NULL,
  vendedor VARCHAR NOT NULL,
  dataPgto DATE NOT NULL,
  valor FLOAT NOT NULL
);
```

Por exemplo nesses dados:

| Comprador                                                                         | Vendedor | Data        | Valor |
|------------------------------------------------------------------------------------|----------|--------------|-------|
| Leonardo                                                                          | Bruno     | 01/01/2000  | 200,00 |
| Leonardo                                                                          | Matheus   | 27/09/2003  | 1024,00 |
| Leonardo                                                                          | Lucas     | 26/06/2006  | 512,00 |
| Marcos                                                                            | Lucas     | 17/12/2020  | 100,00 |
| Marcos                                                                            | Lucas     | 22/03/2002  | 10,00 |
| Cinthia                                                                           | Lucas     | 20/03/2021  | 500,00 |
| Mateus                                                                            | Bruno     | 02/06/2007  | 400,00 |
| Mateus                                                                            | Bruno     | 26/06/2006  | 400,00 |
| Mateus                                                                            | Bruno     | 26/06/2015  | 200,00 |

A sua consulta dever retornar:

| nome_vendedor |
| -------------- |
| Lucas         |
| Matheus        |

O vendedor Lucas foi listado porque ele recebeu R$ 1.112 em até três vendas: 512 + 100 + 500 = 1112. O vendedor Matheus foi listado porque recebeu R$ 1.024 em uma única transferência. O vendedor Bruno recebeu R$ 1.200 em quatro vendas, porém não foi listado porque em três vendas o total não chegou até R$ 1.024. O nome da coluna no retorno não importa.
