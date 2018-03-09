
#ifndef _REWRITER_typedef_GodObj
#define _REWRITER_typedef_GodObj
typedef struct objc_object GodObj;
typedef struct {} _objc_exc_GodObj;
#endif

extern "C" unsigned long OBJC_IVAR_$_GodObj$_block;
extern "C" unsigned long OBJC_IVAR_$_GodObj$_tem;
struct GodObj_IMPL {
	struct NSObject_IMPL NSObject_IVARS;
	dispatch_block_t _block;
	NSInteger _tem;
};

// @property (nonatomic, copy) dispatch_block_t block;
// @property (nonatomic, assign) NSInteger tem;


/* @end */


// @implementation GodObj

struct __GodObj__test_block_impl_0 {
  struct __block_impl impl;
  struct __GodObj__test_block_desc_0* Desc;
  GodObj *self;
  __GodObj__test_block_impl_0(void *fp, struct __GodObj__test_block_desc_0 *desc, GodObj *_self, int flags=0) : self(_self) {
    impl.isa = &_NSConcreteStackBlock;
    impl.Flags = flags;
    impl.FuncPtr = fp;
    Desc = desc;
  }
};
static void __GodObj__test_block_func_0(struct __GodObj__test_block_impl_0 *__cself) {
  GodObj *self = __cself->self; // bound by copy

        ((void (*)(id, SEL, NSInteger))(void *)objc_msgSend)((id)self, sel_registerName("setTem:"), (NSInteger)1);
        ((void (*)(id, SEL, NSInteger))(void *)objc_msgSend)((id)self, sel_registerName("setTem:"), (NSInteger)22);
    }


//有引用比并且持有，将会发生循环引用
static void __GodObj__test_block_copy_0(struct __GodObj__test_block_impl_0*dst, struct __GodObj__test_block_impl_0*src) {_Block_object_assign((void*)&dst->self, (void*)src->self, 3/*BLOCK_FIELD_IS_OBJECT*/);}



static void __GodObj__test_block_dispose_0(struct __GodObj__test_block_impl_0*src) {_Block_object_dispose((void*)src->self, 3/*BLOCK_FIELD_IS_OBJECT*/);}

static struct __GodObj__test_block_desc_0 {
  size_t reserved;
  size_t Block_size;
  void (*copy)(struct __GodObj__test_block_impl_0*, struct __GodObj__test_block_impl_0*);
  void (*dispose)(struct __GodObj__test_block_impl_0*);
} __GodObj__test_block_desc_0_DATA = { 0, sizeof(struct __GodObj__test_block_impl_0), __GodObj__test_block_copy_0, __GodObj__test_block_dispose_0};

static void _I_GodObj_test(GodObj * self, SEL _cmd) {



    (*(dispatch_block_t *)((char *)self + OBJC_IVAR_$_GodObj$_block)) = ((void (*)())&__GodObj__test_block_impl_0((void *)__GodObj__test_block_func_0, &__GodObj__test_block_desc_0_DATA, self, 570425344));
}

static void(* _I_GodObj_block(GodObj * self, SEL _cmd) )(){ return (*(dispatch_block_t *)((char *)self + OBJC_IVAR_$_GodObj$_block)); }
extern "C" __declspec(dllimport) void objc_setProperty (id, SEL, long, id, bool, bool);

static void _I_GodObj_setBlock_(GodObj * self, SEL _cmd, dispatch_block_t block) { objc_setProperty (self, _cmd, __OFFSETOFIVAR__(struct GodObj, _block), (id)block, 0, 1); }

static NSInteger _I_GodObj_tem(GodObj * self, SEL _cmd) { return (*(NSInteger *)((char *)self + OBJC_IVAR_$_GodObj$_tem)); }
static void _I_GodObj_setTem_(GodObj * self, SEL _cmd, NSInteger tem) { (*(NSInteger *)((char *)self + OBJC_IVAR_$_GodObj$_tem)) = tem; }
// @end

