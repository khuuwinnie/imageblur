class Image
  attr_accessor :image
  
  def initialize (image)
    @image = image 
  end
  
   
  def transform(number)
    n = number.to_i
    
    n.times do
        b = Marshal.load ( Marshal.dump(@image) ) #creates new unique copy each time
        @image.each_with_index do |row, row_id|
            row.each_with_index do |pixel, col_id|
        if b[row_id][col_id] == 1
            @image[row_id + 1][col_id] = 1 unless [row_id] == @image.length - 1 #1 row down
            @image[row_id - 1][col_id] = 1 unless [row_id] == 0 #1 row up
            @image[row_id][col_id + 1] = 1 unless [col_id] == @image[row_id].length - 1 #1 column right
            @image[row_id][col_id - 1] = 1 unless [col_id] == 0 #1 column left
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
image.transform(2)
image.output_image
