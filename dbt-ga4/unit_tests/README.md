# Unit Testing

dbt-ga4 traktuje każdy model i makro jako "jednostkę" kodu. Jeśli ustalimy wejście do każdej jednostki, możemy przetestować, czy otrzymujemy oczekiwane wyjście. Aby to zrobić, korzystamy z frameworku pytest, jak opisano tutaj:

- https://docs.getdbt.com/docs/contributing/testing-a-new-adapter
- https://github.com/dbt-labs/dbt-core/discussions/4455#discussioncomment-2766503

Aby przeprowadzić testy, będziesz musiał zainstalować pytest, pytest-dotenv oraz utworzyć plik .env zawierający klucz BIGQUERY_PROJECT z nazwą Twojego projektu BigQuery. Zakłada się użycie metody połączenia 'oauth' do lokalnego rozwoju.

Dla BIGQUERY_PROJECT:
- Utwórz nowy plik w katalogu głównym Twojego projektu DBT w VSC.
- Nazwij ten plik .env.
- W pliku .env dodaj następującą linię: BIGQUERY_PROJECT="nazwa_projektu_gcp"

Aby zainstalować pytest & pytest-dotenv, możesz skorzystać z pliku requirements.txt. Przejdź do folderu unit_tests i uruchom polecenie:

```
pip install -r requirements.txt
```

Aby uruchomić zestaw testów z folderu, przejdź do folderu unit_tests w wierszu poleceń i uruchom:

```
python -m pytest .
```

Aby uruchomić określony test:

```
python -m pytest path/to/test.py
```
