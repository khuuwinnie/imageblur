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


  def blur
    new_image = transform
      @image.each_with_index do |row, row_id|
        row.each_with_index do |pixel, col_id|
          new_image.each do |found_row_id, found_col_id|

            if row_id == found_row_id && col_id == found_col_id
              @image[row_id -1][col_id] = 1 unless row_id <= 0
              @image[row_id +1][col_id] = 1 unless row_id >= @image[row_id].length - 1
              @image[row_id][col_id -1] = 1 unless col_id <= 0 
              @image[row_id][col_id +1] = 1 unless col_id >= @image[row_id].length - 1 
            end
          end
        end
      end
  end

  def output_image
    @image.each do |image| 
      print image.join 
      print "\n"
    end
  end  
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#original image
image.output_image 

#transformed image
puts 
image.blur
image.output_image

