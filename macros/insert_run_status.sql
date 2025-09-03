{% macro insert_run_status(results) %}
  {% set insert_sql = [] %}

  {% for result in results %}
    {% set model_name = result.node.name %}
    {% set resource_type = result.node.resource_type %}
    {% set status = result.status %}
    {% set error_msg = result.message if status != 'success' else None %}

    {% set row_insert %}
      INSERT INTO MOVIELENS.DEV.dbt_object_run_log
      (model_name, resource_type, status, error_msg)
      VALUES (
        '{{ model_name }}',
        '{{ resource_type }}',
        '{{ status }}',
        {% if error_msg %}'{{ error_msg }}'{% else %}NULL{% endif %}
      );
    {% endset %}

    {% do insert_sql.append(row_insert) %}
  {% endfor %}

  {{ return('\n'.join(insert_sql)) }}
{% endmacro %}
