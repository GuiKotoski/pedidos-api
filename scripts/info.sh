#!/usr/bin/env bash
set -euo pipefail

echo "=== pedidos-api: informações do ambiente ==="

# Exemplo completo: guarda a saída de um comando numa variável e imprime
GIT_VERSION="$(git --version | awk '{print $3}')"
echo "Git:         $GIT_VERSION"

#data (comando date, formato com +)
DATE="$(date +'%Y-%m-%d %H:%M:%S')"
echo "Data:        $DATE"

#usuário
CURRENT_USER="$(whoami)"
echo "Usuário:     $CURRENT_USER"

#diretório atual
CURRENT_DIR="$(pwd)"
echo "Diretório:   $CURRENT_DIR"

#Java (lembre do 2>&1)
JAVA_VERSION="$(java -version 2>&1 | awk 'NR==1{print $3}')"
echo "Java:        $JAVA_VERSION"

#Maven
MAVEN_VERSION="$(mvn -version -B | awk 'NR==1{print $3}')"
echo "Maven:       $MAVEN_VERSION"

#branch atual
CURRENT_BRANCH="$(git branch --show-current)"
echo "Branch:      $CURRENT_BRANCH"

#último commit
LAST_COMMIT="$(git log --oneline -1)"
echo "Último commit: $LAST_COMMIT"

#quantidade de arquivos modificados
MODIFIED_FILES_COUNT="$(git status --porcelain | wc -l)"
echo "Arquivos modificados: $MODIFIED_FILES_COUNT"
