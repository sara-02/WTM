# using style 0
image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/workshop/magenta/multistyle-pastiche-generator-varied.ckpt \
      --input_image=/workshop/sample-images/mini-basset.jpg \
      --which_styles="[0]" \
      --output_dir=/workshop/shared/ \
      --output_basename="basset"

# blending styles 0 and 1
image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/workshop/magenta/multistyle-pastiche-generator-varied.ckpt \
      --input_image=/workshop/sample-images/mini-basset.jpg \
      --which_styles="[0,1]" \
      --output_dir=/workshop/shared/ \
      --output_basename="basset"

# Weighted combination of styles 6 and 7
# with more weight on 6
image_stylization_transform \
      --num_styles=32 \
      --checkpoint=/workshop/magenta/multistyle-pastiche-generator-varied.ckpt \
      --input_image=/workshop/sample-images/mini-basset.jpg \
      --which_styles="{6:0.7, 7:0.3}" \
      --output_dir=/workshop/shared/ \
      --output_basename="basset"