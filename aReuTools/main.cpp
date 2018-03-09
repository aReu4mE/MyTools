
NSString *str1 = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_0;


struct __main_block_impl_0 {
  struct __block_impl impl;
  struct __main_block_desc_0* Desc;
  NSString **str;
  __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, NSString **_str, int flags=0) : str(_str) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static int __main_block_func_0(struct __main_block_impl_0 *__cself, int num) {
  NSString **str = __cself->str; // bound by copy



            (*str) = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_3;
            str1 = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_4;

            NSLog((NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_5,(*str),str1);
            return 1000000 * num;
        }
static void __main_block_copy_0(struct __main_block_impl_0*dst, struct __main_block_impl_0*src) {_Block_object_assign((void*)&dst->str, (void*)src->str, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static void __main_block_dispose_0(struct __main_block_impl_0*src) {_Block_object_dispose((void*)src->str, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static struct __main_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
  void (*dispose)(struct __main_block_impl_0*);
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0), __main_block_copy_0, __main_block_dispose_0};
int main(int argc, char * argv[]) {
    /* @autoreleasepool */ { __AtAutoreleasePool __autoreleasepool; 

        //全局变量
        NSString *str1 = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_0;
        
        static NSString *str = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_1;
        NSString *testStr = (NSString *)&__NSConstantStringImpl__var_folders_xb_76wfy3ws7kz4jx8vnwhzjvgm0000gn_T_main_706057_mi_2;


        int aa =10;

        int(*testBlock)(int) = ((int (*)(int))&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA, &str, 570425344));


        int num = ((int (*)(__block_impl *, int))((__block_impl *)testBlock)->FuncPtr)((__block_impl *)testBlock, 2);
        return 0;
    }
}
static struct IMAGE_INFO { unsigned version; unsigned flag; } _OBJC_IMAGE_INFO = { 0, 2 };
