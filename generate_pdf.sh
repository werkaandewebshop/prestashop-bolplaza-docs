mkdocs build
mkdocs2pandoc > bolplaza.pd
pandoc --toc -f markdown+grid_tables+table_captions -o bolplaza.pdf bolplaza.pd
