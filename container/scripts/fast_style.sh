#!/bin/bash
cd /workshop/fast-style-transfer
python evaluate.py --checkpoint models/udnie.ckpt --in-path /workshop/sample-images/basset.jpg --out-path /workshop/shared/basset_udnie.jpg