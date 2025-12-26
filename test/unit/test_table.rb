# frozen_string_literal: true

require_relative "test_helper"

class TestTable < JSONLT::UnitTest
  def test_new_raises_not_implemented_error
    assert_raises(NotImplementedError) do
      JSONLT::Table.new("test.jsonlt")
    end
  end

  def test_jsonlt_version_is_defined
    refute_nil JSONLT::VERSION
    assert_kind_of String, JSONLT::VERSION
  end

  def test_jsonlt_error_is_defined
    assert_kind_of Class, JSONLT::Error
    assert_operator JSONLT::Error, :<, StandardError
  end
end
