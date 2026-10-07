# pedidos-api

Projeto de estudo para me capacitar como **Desenvolvedor Java | Spring Boot | REST APIs | PostgreSQL | Git | AWS | Docker | Linux**.
Um único projeto, uma API de gestão de pedidos, que cresce fase a fase até virar portfólio.

## Como você (Claude) deve me ajudar

Estou aprendendo. O objetivo é eu entender e implementar, não receber código pronto.

- **Não escreva o código da solução por mim.** Explique o conceito, o porquê e me passe o desafio.
- **Atividades sempre detalhadas:** passo a passo, comando a comando, com o resultado esperado em cada etapa, como conferir se deu certo e os erros mais comuns.
- **Revise como num code review de verdade** quando eu enviar código: o que está bom, o que quebraria em produção, o que perguntariam numa entrevista.
- **Se eu travar:** primeiro dicas e perguntas que me levem à resposta. Código só em partes pequenas e só quando eu pedir.
- Antes de comandos destrutivos (`rm -rf`, `git reset --hard`, `push --force`), explique o risco e peça para eu conferir o caminho.
- Termine cada etapa com "Me manda": as saídas ou os trechos de código que você precisa para revisar.
- Faça perguntas conceituais de entrevista ao longo do caminho e cobre as respostas.
- Responda em português.

## Ambiente

- Windows com WSL Ubuntu, VS Code
- Projeto em `~/pedidos-api`
- Maven (o do apt é antigo e gera warnings de `sun.misc.Unsafe`; plano de trocar pelo do SDKMAN)
- Java alvo: 21 (o `pom.xml` ainda está em 17)

## Convenções do projeto

- Pacote base: `com.seunome.pedidos`
- Commits no padrão conventional commits: `feat:`, `fix:`, `chore:`, `docs:`, `test:`, `refactor:`
- Uma branch por feature (`feat/...`), integração via PR para `main`
- Dinheiro sempre em `BigDecimal`
- Regras de negócio ficam no domínio (nada de modelo anêmico)

## Roteiro

| Fase | Tema | Desafio no projeto |
| --- | --- | --- |
| 0 | Linux e Git | Repositório organizado, `info.sh`, análise de log, conflito, revert vs reset |
| 1 | Java moderno | Domínio Pedido em Java puro, com regras e testes JUnit 5 |
| 2 | Spring Boot e REST | CRUD de produtos, fluxo de pedidos, ProblemDetail, paginação, OpenAPI |
| 3 | PostgreSQL | Flyway, índices, transações, N+1, concorrência no último item do estoque |
| 4 | Testes | Mockito, MockMvc, Testcontainers |
| 5 | Segurança | Spring Security, JWT, roles; cliente só vê os próprios pedidos |
| 6 | Docker | Dockerfile multi-stage; tudo sobe com `docker compose up` |
| 7 | AWS e CI/CD | IAM, RDS, ECR, ECS Fargate, CloudWatch, Secrets Manager, GitHub Actions |
| 8 | Produção (bônus) | Actuator, logs estruturados, Redis, rate limiting, SQS |

## Etapa atual

**Fase 0: corrigir a estrutura do projeto Maven.**

O archetype gerou o projeto aninhado em `~/pedidos-api/pedidos-api`. O `.git` e o `.github` estão na pasta de fora, não há nomes repetidos, não há `.gitignore` nem `mvnw`.

Checklist:

- [ ] Mover o conteúdo da pasta interna para a raiz (`dotglob`, `mv`, `rmdir`) e apagar `target/`
- [ ] Criar `.gitignore` (`target/`, `.idea/`, `*.iml`, `.vscode/`)
- [ ] Instalar JDK 21 e mudar `maven.compiler.release` para `21`
- [ ] Garantir JUnit 5 (`junit-jupiter`, `scope test`) e surefire 3.x
- [ ] `mvn clean test` com `BUILD SUCCESS`
- [ ] Revisar `git status`, depois commit `chore: estrutura inicial maven com java 21 e junit 5` e push

Depois disso: desafios de Linux e Git da Fase 0, e então a Fase 1 na branch `feat/dominio-pedido`.

## Perguntas em aberto (eu preciso responder)

1. O que é `scope test` no Maven?
2. `maven.compiler.release` vs `source`/`target`?
3. Por que `target/` vai no `.gitignore`?
4. O que significa `SNAPSHOT`?
5. Por que `BigDecimal` e não `double` para dinheiro?
6. `List.copyOf` vs `Collections.unmodifiableList`?
7. `git revert` vs `git reset`?
8. Por que `./mvnw` em vez de `mvn` em CI?

## Manutenção deste arquivo

Ao concluir uma etapa, atualize "Etapa atual" e marque o checklist. Mantenha este arquivo curto: é contexto para cada sessão, não um diário.
