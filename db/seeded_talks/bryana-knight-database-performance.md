Bryana Knight
---
https://www.youtube.com/watch?v=SOMEWEHRE
---
RailsConf 2017
---
The Secret Life of SQ: How to Optimize Database Performance
---
# The Secret Life of SQ: How to Optimize Database Performance

- When to index?
  - You can add a double index when you need to do something like `SELECT name from repositories where owner_id > 500`. Create an index over `owner_id` and `name`.
  - Common rules of indexing, querying, and data modeling.
    - Any columns involved in queries should be indexed, unless there is already a covering index.
      - Problems with redundant index: it takes up precious space, and adding an index slows down updates/inserts/deletes because those operations also have to edit the index.
    - Index prefix vs index.
      - If you're indexing over a long data type, you can use this.
      - If it's things like "query usernames starting with 'a'".
      - How long? Long enough to differentiate values within the field, and base it off of real data if possible.
    - Use an ~~OR~~ (UNION) to satisfy.
      - `EXPLAIN` shows what indexes were use and how many rows were scanned.
      - The `OR` operator is limited because MySQL can only use one index per table during a query, so it chooses to use neither.
      - You can use a UNION if there's no index that covers both conditionals at the same time.
    - If there's an index, you're all set.
      - You can use a `FORCE INDEX` or `USE INDEX` or `IGNORE INDEX` if MySQL is not choosing a performant index.
    - Avoid redundant data across tables.
      - Unless additional reads/JOINS are causing a large amount of performance overhead.
      - Unless if there is a high ratio of reads to writes.
      - Cost: Database changes (migrations) and data quality (since no longer normalized).
