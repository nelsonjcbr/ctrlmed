class MultiTableController < Ruport::Controller
  stage :multi_table_report

  class PDF < Ruport::Formatter::PDF
    renders :pdf, :for => MultiTableController

    build :multi_table_report do
      data.each { |table| pad(10) { draw_table(table)}}
      render_pdf
    end

  end
end

t1 = Table(%w[a b c]) << [1, 2, 3] << [4, 5, 6]
t2 = Table(%w[a b c]) << [7,8,9] << [10,11,12 ]
