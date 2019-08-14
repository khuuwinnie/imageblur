class Image
  
  def initialize (image)
    @image = image 
  end


  def transform
    new_image = [] 
    @image.each_with_index do |row, row_id|
      row.each_with_index do |pixel, col_id|
        if pixel == 1
          new_image << [row_id, col_id]
        end
      end
    end
    new_image
  end


  def blur(distance)
    new_image = transform
      @image.each_with_index do |row, row_id|
        row.each_with_index do |pixel, col_id|
          new_image.each do |found_row_id, found_col_id|

            if manhattan_distance(row_id, col_id, found_row_id, found_col_id) <= distance
              @image[row_id][col_id] = 1
            end
          end
        end
      end
  end

  def manhattan_distance (x1, y1, x2, y2)
    horizontal_distance = (x2 - x1).abs   #return absolute value
    vertical_distance = (y2 - y1).abs
    horizontal_distance + vertical_distance
  end

  def output_image
    @image.each do |image| 
      print image.join 
      print "\n"
    end
  end  
end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1]
])

#original image
image.output_image 

#transformed image
puts 
image.blur(2)
image.output_image
