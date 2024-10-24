
# PriceService - Cálculo de Preços com Descontos

## Descrição

Este projeto implementa uma classe `PriceService` que calcula o preço final de um produto levando em consideração impostos e dois tipos de descontos:
1. **Desconto por categoria**: Um desconto de 5% é aplicado se o produto pertencer às categorias `food` ou `beverages`.
2. **Desconto de aniversário**: Um desconto de 10% é aplicado se o mês atual for o mês de aniversário do usuário.

O objetivo do projeto foi corrigir e ajustar o código para garantir que todos os testes passem corretamente e implementar os dois tipos de descontos adicionais.

## Requisitos

- **Ruby**: Certifique-se de ter o Ruby instalado. Este projeto foi desenvolvido e testado com a versão Ruby >= 2.6.
- **RSpec**: O framework de testes RSpec é utilizado para validar o comportamento da aplicação.

## Instalação

1. Clone este repositório:
   ```bash
   git clone git@github.com:luizr35/soutag_teste.git
   ```

2. Instale as dependências:
   ```bash
   bundle install
   ```

## Estrutura do Projeto

### 1. `price_service.rb`
Este arquivo contém a classe `PriceService`, que realiza os seguintes cálculos:

- **Cálculo do preço base**: O preço base do produto, definido por `product[:base_price]`.
- **Cálculo dos impostos**: Aplica os impostos com base em `product[:tax_percentage]`.
- **Aplicação dos descontos**:
  - Um desconto de 5% é aplicado se o produto for das categorias `food` ou `beverages`.
  - Um desconto de 10% é aplicado se o mês atual for o mês de aniversário do usuário.

#### Métodos principais:

- **`call`**: Método principal que retorna o preço final após impostos e descontos.
- **`apply_category_discount`**: Aplica o desconto de 5% se o produto for das categorias elegíveis.
- **`apply_birthday_discount`**: Aplica o desconto de 10% se for o mês de aniversário do usuário.

### 2. `price_service_spec.rb`
Este arquivo contém os testes RSpec que validam o comportamento da classe `PriceService`.

#### Testes cobertos:

- **Cálculo do preço total sem impostos ou descontos**.
- **Cálculo do preço com impostos**.
- **Aplicação do desconto de 5% para produtos das categorias `food` ou `beverages`**.
- **Aplicação do desconto de 10% no mês de aniversário do usuário**.
- **Aplicação combinada de ambos os descontos (categoria + aniversário)**.

## Uso

### Classe `PriceService`

Para utilizar a classe `PriceService`, você deve fornecer um `product` e um `user`, onde:

- **`product`** é um hash contendo:
  - `id`: O identificador do produto.
  - `base_price`: O preço base do produto.
  - `tax_percentage`: A porcentagem de imposto aplicada ao produto.
  - `category`: A categoria do produto (ex.: `food`, `beverages`).

- **`user`** é um hash contendo:
  - `id`: O identificador do usuário.
  - `birthday_month`: O mês de aniversário do usuário (um número entre 1 e 12).

Exemplo de uso:

```ruby
product = { id: 1, base_price: 100, tax_percentage: 10, category: 'food' }
user = { id: 1, birthday_month: Time.now.month }

service = PriceService.new(product: product, user: user)
final_price = service.call
puts "Preço final: #{final_price}"
```

### Executando os testes

Para rodar os testes e verificar se tudo está funcionando corretamente, utilize o seguinte comando:

```bash
rspec
```

Os testes irão validar os seguintes cenários:
- Cálculo de preço sem descontos ou impostos.
- Cálculo com impostos.
- Aplicação correta do desconto de categoria.
- Aplicação correta do desconto de aniversário.
- Aplicação combinada dos dois descontos.

## Exemplo de Saída

Aqui está um exemplo de saída do cálculo quando ambos os descontos são aplicados (5% para a categoria e 10% para o mês de aniversário):

```bash
Preço final: 85.5
```

Este valor é calculado aplicando primeiro o desconto de 5% sobre o preço base de 100, resultando em 95. Em seguida, é aplicado o desconto de 10%, resultando em 85.5.

## Licença

Este projeto está licenciado sob a MIT License.

## Contribuição

Sinta-se à vontade para abrir issues ou fazer pull requests se encontrar algum problema ou tiver sugestões de melhorias.
