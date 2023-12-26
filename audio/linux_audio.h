#include "miniaudio.h"

void *linux_audioplay();
void data_callback(ma_device* pDevice, void* pOutput, const void* pInput, ma_uint32 frameCount);