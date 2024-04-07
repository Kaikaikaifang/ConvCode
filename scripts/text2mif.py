# python
# -*- coding: UTF-8 -*-
"""
@IDE            : VsCode
@Time           : 2024/04/05
@Project        : ConvCode
@Author         : Kaikai
@Introduction   : 将文本转换为 mif 文件
"""
import os


def text2mif(
    text_path: str,
    mif_path: str,
    depth: int = 256,
    width: int = 1,
    data_radix: str = "BIN",
):
    """文本文件转换为 mif 文件

    Args:
        text_path (str): 输入文本文件地址
        mif_path (str): 输出 mif 文件地址
        depth (int, optional): 深度(多少个数据). Defaults to 256.
        width (int, optional): 数据位宽. Defaults to 1.
        data_radix (str, optional): 数据进制. Enum: ['BIN', 'HEX', 'DEC'], Defaults to 'BIN'.
    Description:
        1. 默认输出的 mif 文件为 1 位宽的二进制数据
    """
    text = open(text_path, "r").read()
    mif = open(mif_path, "w")
    mif.write(
        f"""DEPTH = {depth};
WIDTH = {width};
ADDRESS_RADIX = DEC;
DATA_RADIX = {data_radix};

CONTENT BEGIN
"""
    )
    chunks = [text[i * width : (i + 1) * width] for i in range(depth)]
    for i, chunk in enumerate(chunks):
        mif.write(f"{i}: {chunk};\n")
    mif.write("END;")


if __name__ == "__main__":
    text_path = os.path.join(os.path.dirname(__file__), "../assets/bianma_result.txt")
    mif_path = os.path.join(os.path.dirname(__file__), "../assets/bianma_result.mif")
    text2mif(text_path, mif_path, depth=166, width=1, data_radix="BIN")
    print(f"文本文件转换为 mif 文件成功: {mif_path}")
