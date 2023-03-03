typedef unsigned long size_t;
typedef __builtin_va_list __gnuc_va_list;
typedef unsigned char __u_char;
typedef unsigned short __u_short;
typedef unsigned int __u_int;
typedef unsigned long __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef short __int16_t;
typedef unsigned short __uint16_t;
typedef int __int32_t;
typedef unsigned int __uint32_t;
typedef long __int64_t;
typedef unsigned long __uint64_t;
typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;
typedef long __quad_t;
typedef unsigned long __u_quad_t;
typedef long __intmax_t;
typedef unsigned long __uintmax_t;
typedef unsigned long __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long __ino_t;
typedef unsigned long __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long __nlink_t;
typedef long __off_t;
typedef long __off64_t;
typedef int __pid_t;
struct __anonstruct___fsid_t_109580352 {
   int __val[2] ;
};
typedef struct __anonstruct___fsid_t_109580352 __fsid_t;
typedef long __clock_t;
typedef unsigned long __rlim_t;
typedef unsigned long __rlim64_t;
typedef unsigned int __id_t;
typedef long __time_t;
typedef unsigned int __useconds_t;
typedef long __suseconds_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void *__timer_t;
typedef long __blksize_t;
typedef long __blkcnt_t;
typedef long __blkcnt64_t;
typedef unsigned long __fsblkcnt_t;
typedef unsigned long __fsblkcnt64_t;
typedef unsigned long __fsfilcnt_t;
typedef unsigned long __fsfilcnt64_t;
typedef long __fsword_t;
typedef long __ssize_t;
typedef long __syscall_slong_t;
typedef unsigned long __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef char *__caddr_t;
typedef long __intptr_t;
typedef unsigned int __socklen_t;
typedef int __sig_atomic_t;
union __anonunion___value_771759453 {
   unsigned int __wch ;
   char __wchb[4] ;
};
struct __anonstruct___mbstate_t_23548940 {
   int __count ;
   union __anonunion___value_771759453 __value ;
};
typedef struct __anonstruct___mbstate_t_23548940 __mbstate_t;
struct _G_fpos_t {
   __off_t __pos ;
   __mbstate_t __state ;
};
typedef struct _G_fpos_t __fpos_t;
struct _G_fpos64_t {
   __off64_t __pos ;
   __mbstate_t __state ;
};
typedef struct _G_fpos64_t __fpos64_t;
struct _IO_FILE ;
typedef struct _IO_FILE __FILE;
typedef struct _IO_FILE FILE;
struct _IO_marker ;
struct _IO_codecvt ;
struct _IO_wide_data ;
typedef void _IO_lock_t;
struct _IO_FILE {
   int _flags ;
   char *_IO_read_ptr ;
   char *_IO_read_end ;
   char *_IO_read_base ;
   char *_IO_write_base ;
   char *_IO_write_ptr ;
   char *_IO_write_end ;
   char *_IO_buf_base ;
   char *_IO_buf_end ;
   char *_IO_save_base ;
   char *_IO_backup_base ;
   char *_IO_save_end ;
   struct _IO_marker *_markers ;
   struct _IO_FILE *_chain ;
   int _fileno ;
   int _flags2 ;
   __off_t _old_offset ;
   unsigned short _cur_column ;
   signed char _vtable_offset ;
   char _shortbuf[1] ;
   _IO_lock_t *_lock ;
   __off64_t _offset ;
   struct _IO_codecvt *_codecvt ;
   struct _IO_wide_data *_wide_data ;
   struct _IO_FILE *_freeres_list ;
   void *_freeres_buf ;
   size_t __pad5 ;
   int _mode ;
   char _unused2[(15UL * sizeof(int ) - 4UL * sizeof(void *)) - sizeof(size_t )] ;
};
typedef __gnuc_va_list va_list;
typedef __off_t off_t;
typedef __ssize_t ssize_t;
typedef __fpos_t fpos_t;
typedef int wchar_t;
enum __anonenum_idtype_t_558242672 {
    P_ALL = 0,
    P_PID = 1,
    P_PGID = 2
} ;
typedef enum __anonenum_idtype_t_558242672 idtype_t;
struct __anonstruct_div_t_773697287 {
   int quot ;
   int rem ;
};
typedef struct __anonstruct_div_t_773697287 div_t;
struct __anonstruct_ldiv_t_790849867 {
   long quot ;
   long rem ;
};
typedef struct __anonstruct_ldiv_t_790849867 ldiv_t;
struct __anonstruct_lldiv_t_103911545 {
   long long quot ;
   long long rem ;
};
typedef struct __anonstruct_lldiv_t_103911545 lldiv_t;
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __clockid_t clockid_t;
typedef __time_t time_t;
typedef __timer_t timer_t;
typedef unsigned long ulong;
typedef unsigned short ushort;
typedef unsigned int uint;
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;
typedef int register_t;
struct __anonstruct___sigset_t_973126068 {
   unsigned long __val[1024UL / (8UL * sizeof(unsigned long ))] ;
};
typedef struct __anonstruct___sigset_t_973126068 __sigset_t;
typedef __sigset_t sigset_t;
struct timeval {
   __time_t tv_sec ;
   __suseconds_t tv_usec ;
};
struct timespec {
   __time_t tv_sec ;
   __syscall_slong_t tv_nsec ;
};
typedef __suseconds_t suseconds_t;
typedef long __fd_mask;
struct __anonstruct_fd_set_356711149 {
   __fd_mask __fds_bits[1024 / (8 * (int )sizeof(__fd_mask ))] ;
};
typedef struct __anonstruct_fd_set_356711149 fd_set;
typedef __fd_mask fd_mask;
typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
struct __pthread_internal_list {
   struct __pthread_internal_list *__prev ;
   struct __pthread_internal_list *__next ;
};
typedef struct __pthread_internal_list __pthread_list_t;
struct __pthread_internal_slist {
   struct __pthread_internal_slist *__next ;
};
typedef struct __pthread_internal_slist __pthread_slist_t;
struct __pthread_mutex_s {
   int __lock ;
   unsigned int __count ;
   int __owner ;
   unsigned int __nusers ;
   int __kind ;
   short __spins ;
   short __elision ;
   __pthread_list_t __list ;
};
struct __pthread_rwlock_arch_t {
   unsigned int __readers ;
   unsigned int __writers ;
   unsigned int __wrphase_futex ;
   unsigned int __writers_futex ;
   unsigned int __pad3 ;
   unsigned int __pad4 ;
   int __cur_writer ;
   int __shared ;
   signed char __rwelision ;
   unsigned char __pad1[7] ;
   unsigned long __pad2 ;
   unsigned int __flags ;
};
struct __anonstruct___wseq32_961093918 {
   unsigned int __low ;
   unsigned int __high ;
};
union __anonunion____missing_field_name_915289930 {
   unsigned long long __wseq ;
   struct __anonstruct___wseq32_961093918 __wseq32 ;
};
struct __anonstruct___g1_start32_961093919 {
   unsigned int __low ;
   unsigned int __high ;
};
union __anonunion____missing_field_name_276365665 {
   unsigned long long __g1_start ;
   struct __anonstruct___g1_start32_961093919 __g1_start32 ;
};
struct __pthread_cond_s {
   union __anonunion____missing_field_name_915289930 __annonCompField1 ;
   union __anonunion____missing_field_name_276365665 __annonCompField2 ;
   unsigned int __g_refs[2] ;
   unsigned int __g_size[2] ;
   unsigned int __g1_orig_size ;
   unsigned int __wrefs ;
   unsigned int __g_signals[2] ;
};
typedef unsigned long pthread_t;
union __anonunion_pthread_mutexattr_t_488594144 {
   char __size[4] ;
   int __align ;
};
typedef union __anonunion_pthread_mutexattr_t_488594144 pthread_mutexattr_t;
union __anonunion_pthread_condattr_t_488594145 {
   char __size[4] ;
   int __align ;
};
typedef union __anonunion_pthread_condattr_t_488594145 pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
union pthread_attr_t {
   char __size[56] ;
   long __align ;
};
typedef union pthread_attr_t pthread_attr_t;
union __anonunion_pthread_mutex_t_335460617 {
   struct __pthread_mutex_s __data ;
   char __size[40] ;
   long __align ;
};
typedef union __anonunion_pthread_mutex_t_335460617 pthread_mutex_t;
union __anonunion_pthread_cond_t_951761805 {
   struct __pthread_cond_s __data ;
   char __size[48] ;
   long long __align ;
};
typedef union __anonunion_pthread_cond_t_951761805 pthread_cond_t;
union __anonunion_pthread_rwlock_t_656928968 {
   struct __pthread_rwlock_arch_t __data ;
   char __size[56] ;
   long __align ;
};
typedef union __anonunion_pthread_rwlock_t_656928968 pthread_rwlock_t;
union __anonunion_pthread_rwlockattr_t_145707745 {
   char __size[8] ;
   long __align ;
};
typedef union __anonunion_pthread_rwlockattr_t_145707745 pthread_rwlockattr_t;
typedef int volatile   pthread_spinlock_t;
union __anonunion_pthread_barrier_t_145707746 {
   char __size[32] ;
   long __align ;
};
typedef union __anonunion_pthread_barrier_t_145707746 pthread_barrier_t;
union __anonunion_pthread_barrierattr_t_951761806 {
   char __size[4] ;
   int __align ;
};
typedef union __anonunion_pthread_barrierattr_t_951761806 pthread_barrierattr_t;
struct random_data {
   int32_t *fptr ;
   int32_t *rptr ;
   int32_t *state ;
   int rand_type ;
   int rand_deg ;
   int rand_sep ;
   int32_t *end_ptr ;
};
struct drand48_data {
   unsigned short __x[3] ;
   unsigned short __old_x[3] ;
   unsigned short __c ;
   unsigned short __init ;
   unsigned long long __a ;
};
typedef int (*__compar_fn_t)(void const   * , void const   * );
struct __locale_data ;
struct __locale_struct {
   struct __locale_data *__locales[13] ;
   unsigned short const   *__ctype_b ;
   int const   *__ctype_tolower ;
   int const   *__ctype_toupper ;
   char const   *__names[13] ;
};
typedef struct __locale_struct *__locale_t;
typedef __locale_t locale_t;
extern FILE *stdin ;
extern FILE *stdout ;
extern FILE *stderr ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) remove)(char const   *__filename ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rename)(char const   *__old ,
                                                                             char const   *__new ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) renameat)(int __oldfd ,
                                                                               char const   *__old ,
                                                                               int __newfd ,
                                                                               char const   *__new ) ;
extern FILE *tmpfile(void) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) tmpnam)(char *__s ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) tmpnam_r)(char *__s ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) tempnam)(char const   *__dir ,
                                                                                char const   *__pfx )  __attribute__((__malloc__)) ;
extern int fclose(FILE *__stream ) ;
extern int fflush(FILE *__stream ) ;
extern int fflush_unlocked(FILE *__stream ) ;
extern FILE *fopen(char const   * __restrict  __filename ,
                   char const   * __restrict  __modes ) ;
extern FILE *freopen(char const   * __restrict  __filename ,
                     char const   * __restrict  __modes ,
                     FILE * __restrict  __stream ) ;
extern  __attribute__((__nothrow__)) FILE *( __attribute__((__leaf__)) fdopen)(int __fd ,
                                                                               char const   *__modes ) ;
extern  __attribute__((__nothrow__)) FILE *( __attribute__((__leaf__)) fmemopen)(void *__s ,
                                                                                 size_t __len ,
                                                                                 char const   *__modes ) ;
extern  __attribute__((__nothrow__)) FILE *( __attribute__((__leaf__)) open_memstream)(char **__bufloc ,
                                                                                       size_t *__sizeloc ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) setbuf)(FILE * __restrict  __stream ,
                                                                              char * __restrict  __buf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) setvbuf)(FILE * __restrict  __stream ,
                                                                              char * __restrict  __buf ,
                                                                              int __modes ,
                                                                              size_t __n ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) setbuffer)(FILE * __restrict  __stream ,
                                                                                 char * __restrict  __buf ,
                                                                                 size_t __size ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) setlinebuf)(FILE *__stream ) ;
extern int fprintf(FILE * __restrict  __stream ,
                   char const   * __restrict  __format  , ...) ;
extern int printf(char const   * __restrict  __format  , ...) ;
extern  __attribute__((__nothrow__)) int sprintf(char * __restrict  __s ,
                                                 char const   * __restrict  __format 
                                                 , ...) ;
extern int vfprintf(FILE * __restrict  __s ,
                    char const   * __restrict  __format , __gnuc_va_list __arg ) ;
extern int vprintf(char const   * __restrict  __format , __gnuc_va_list __arg ) ;
extern  __attribute__((__nothrow__)) int vsprintf(char * __restrict  __s ,
                                                  char const   * __restrict  __format ,
                                                  __gnuc_va_list __arg ) ;
extern  __attribute__((__nothrow__)) int ( /* format attribute */  snprintf)(char * __restrict  __s ,
                                                                             size_t __maxlen ,
                                                                             char const   * __restrict  __format 
                                                                             , ...) ;
extern  __attribute__((__nothrow__)) int ( /* format attribute */  vsnprintf)(char * __restrict  __s ,
                                                                              size_t __maxlen ,
                                                                              char const   * __restrict  __format ,
                                                                              __gnuc_va_list __arg ) ;
extern int ( /* format attribute */  vdprintf)(int __fd ,
                                               char const   * __restrict  __fmt ,
                                               __gnuc_va_list __arg ) ;
extern int ( /* format attribute */  dprintf)(int __fd ,
                                              char const   * __restrict  __fmt 
                                              , ...) ;
extern int fscanf(FILE * __restrict  __stream ,
                  char const   * __restrict  __format  , ...)  __asm__("__isoc99_fscanf")  ;
extern int scanf(char const   * __restrict  __format  , ...)  __asm__("__isoc99_scanf")  ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) sscanf)(char const   * __restrict  __s ,
                                                                             char const   * __restrict  __format 
                                                                             , ...)  __asm__("__isoc99_sscanf")  ;
extern int ( /* format attribute */  vfscanf)(FILE * __restrict  __s ,
                                              char const   * __restrict  __format ,
                                              __gnuc_va_list __arg )  __asm__("__isoc99_vfscanf")  ;
extern int ( /* format attribute */  vscanf)(char const   * __restrict  __format ,
                                             __gnuc_va_list __arg )  __asm__("__isoc99_vscanf")  ;
extern  __attribute__((__nothrow__)) int ( /* format attribute */ __attribute__((__leaf__)) vsscanf)(char const   * __restrict  __s ,
                                                                                                     char const   * __restrict  __format ,
                                                                                                     __gnuc_va_list __arg )  __asm__("__isoc99_vsscanf")  ;
extern int fgetc(FILE *__stream ) ;
extern int getc(FILE *__stream ) ;
extern int getchar(void) ;
extern int getc_unlocked(FILE *__stream ) ;
extern int getchar_unlocked(void) ;
extern int fgetc_unlocked(FILE *__stream ) ;
extern int fputc(int __c , FILE *__stream ) ;
extern int putc(int __c , FILE *__stream ) ;
extern int putchar(int __c ) ;
extern int fputc_unlocked(int __c , FILE *__stream ) ;
extern int putc_unlocked(int __c , FILE *__stream ) ;
extern int putchar_unlocked(int __c ) ;
extern int getw(FILE *__stream ) ;
extern int putw(int __w , FILE *__stream ) ;
extern char *fgets(char * __restrict  __s , int __n ,
                   FILE * __restrict  __stream ) ;
extern __ssize_t __getdelim(char ** __restrict  __lineptr ,
                            size_t * __restrict  __n , int __delimiter ,
                            FILE * __restrict  __stream ) ;
extern __ssize_t getdelim(char ** __restrict  __lineptr ,
                          size_t * __restrict  __n , int __delimiter ,
                          FILE * __restrict  __stream ) ;
extern __ssize_t getline(char ** __restrict  __lineptr ,
                         size_t * __restrict  __n , FILE * __restrict  __stream ) ;
extern int fputs(char const   * __restrict  __s , FILE * __restrict  __stream ) ;
extern int puts(char const   *__s ) ;
extern int ungetc(int __c , FILE *__stream ) ;
extern size_t fread(void * __restrict  __ptr , size_t __size , size_t __n ,
                    FILE * __restrict  __stream ) ;
extern size_t fwrite(void const   * __restrict  __ptr , size_t __size ,
                     size_t __n , FILE * __restrict  __s ) ;
extern size_t fread_unlocked(void * __restrict  __ptr , size_t __size ,
                             size_t __n , FILE * __restrict  __stream ) ;
extern size_t fwrite_unlocked(void const   * __restrict  __ptr , size_t __size ,
                              size_t __n , FILE * __restrict  __stream ) ;
extern int fseek(FILE *__stream , long __off , int __whence ) ;
extern long ftell(FILE *__stream ) ;
extern void rewind(FILE *__stream ) ;
extern int fseeko(FILE *__stream , __off_t __off , int __whence ) ;
extern __off_t ftello(FILE *__stream ) ;
extern int fgetpos(FILE * __restrict  __stream , fpos_t * __restrict  __pos ) ;
extern int fsetpos(FILE *__stream , fpos_t const   *__pos ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) clearerr)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) feof)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ferror)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) clearerr_unlocked)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) feof_unlocked)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ferror_unlocked)(FILE *__stream ) ;
extern void perror(char const   *__s ) ;
extern int sys_nerr ;
extern char const   * const  sys_errlist[] ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) fileno)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) fileno_unlocked)(FILE *__stream ) ;
extern FILE *popen(char const   *__command , char const   *__modes ) ;
extern int pclose(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) ctermid)(char *__s ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) flockfile)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ftrylockfile)(FILE *__stream ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) funlockfile)(FILE *__stream ) ;
extern int __uflow(FILE * ) ;
extern int __overflow(FILE * , int  ) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__leaf__)) __ctype_get_mb_cur_max)(void) ;
extern  __attribute__((__nothrow__)) double ( __attribute__((__nonnull__(1),
__leaf__)) atof)(char const   *__nptr )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) atoi)(char const   *__nptr )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__nonnull__(1),
__leaf__)) atol)(char const   *__nptr )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) long long ( __attribute__((__nonnull__(1),
__leaf__)) atoll)(char const   *__nptr )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) double ( __attribute__((__nonnull__(1),
__leaf__)) strtod)(char const   * __restrict  __nptr ,
                   char ** __restrict  __endptr ) ;
extern  __attribute__((__nothrow__)) float ( __attribute__((__nonnull__(1),
__leaf__)) strtof)(char const   * __restrict  __nptr ,
                   char ** __restrict  __endptr ) ;
extern  __attribute__((__nothrow__)) long double ( __attribute__((__nonnull__(1),
__leaf__)) strtold)(char const   * __restrict  __nptr ,
                    char ** __restrict  __endptr ) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__nonnull__(1),
__leaf__)) strtol)(char const   * __restrict  __nptr ,
                   char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) unsigned long ( __attribute__((__nonnull__(1),
__leaf__)) strtoul)(char const   * __restrict  __nptr ,
                    char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) long long ( __attribute__((__nonnull__(1),
__leaf__)) strtoq)(char const   * __restrict  __nptr ,
                   char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) unsigned long long ( __attribute__((__nonnull__(1),
__leaf__)) strtouq)(char const   * __restrict  __nptr ,
                    char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) long long ( __attribute__((__nonnull__(1),
__leaf__)) strtoll)(char const   * __restrict  __nptr ,
                    char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) unsigned long long ( __attribute__((__nonnull__(1),
__leaf__)) strtoull)(char const   * __restrict  __nptr ,
                     char ** __restrict  __endptr , int __base ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) l64a)(long __n ) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__nonnull__(1),
__leaf__)) a64l)(char const   *__s )  __attribute__((__pure__)) ;
__inline static __uint16_t __bswap_16(__uint16_t __bsx ) 
{ 
  short tmp ;

  {
  tmp = __builtin_bswap16((short )__bsx);
  return ((__uint16_t )tmp);
}
}
__inline static __uint32_t __bswap_32(__uint32_t __bsx ) 
{ 
  int tmp ;

  {
  tmp = __builtin_bswap32((int )__bsx);
  return ((__uint32_t )tmp);
}
}
__inline static __uint64_t __bswap_64(__uint64_t __bsx ) 
{ 
  long tmp ;

  {
  tmp = __builtin_bswap64((long )__bsx);
  return ((__uint64_t )tmp);
}
}
__inline static __uint16_t __uint16_identity(__uint16_t __x ) 
{ 


  {
  return (__x);
}
}
__inline static __uint32_t __uint32_identity(__uint32_t __x ) 
{ 


  {
  return (__x);
}
}
__inline static __uint64_t __uint64_identity(__uint64_t __x ) 
{ 


  {
  return (__x);
}
}
extern int select(int __nfds , fd_set * __restrict  __readfds ,
                  fd_set * __restrict  __writefds ,
                  fd_set * __restrict  __exceptfds ,
                  struct timeval * __restrict  __timeout ) ;
extern int pselect(int __nfds , fd_set * __restrict  __readfds ,
                   fd_set * __restrict  __writefds ,
                   fd_set * __restrict  __exceptfds ,
                   struct timespec  const  * __restrict  __timeout ,
                   __sigset_t const   * __restrict  __sigmask ) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__leaf__)) random)(void) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) srandom)(unsigned int __seed ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(2),
__leaf__)) initstate)(unsigned int __seed , char *__statebuf ,
                      size_t __statelen ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) setstate)(char *__statebuf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) random_r)(struct random_data * __restrict  __buf ,
                     int32_t * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(2),
__leaf__)) srandom_r)(unsigned int __seed , struct random_data *__buf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(2,4),
__leaf__)) initstate_r)(unsigned int __seed , char * __restrict  __statebuf ,
                        size_t __statelen ,
                        struct random_data * __restrict  __buf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) setstate_r)(char * __restrict  __statebuf ,
                       struct random_data * __restrict  __buf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand)(void) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) srand)(unsigned int __seed ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) rand_r)(unsigned int *__seed ) ;
extern  __attribute__((__nothrow__)) double ( __attribute__((__leaf__)) drand48)(void) ;
extern  __attribute__((__nothrow__)) double ( __attribute__((__nonnull__(1),
__leaf__)) erand48)(unsigned short *__xsubi ) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__leaf__)) lrand48)(void) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__nonnull__(1),
__leaf__)) nrand48)(unsigned short *__xsubi ) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__leaf__)) mrand48)(void) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__nonnull__(1),
__leaf__)) jrand48)(unsigned short *__xsubi ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) srand48)(long __seedval ) ;
extern  __attribute__((__nothrow__)) unsigned short *( __attribute__((__nonnull__(1),
__leaf__)) seed48)(unsigned short *__seed16v ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__nonnull__(1),
__leaf__)) lcong48)(unsigned short *__param ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) drand48_r)(struct drand48_data * __restrict  __buffer ,
                      double * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) erand48_r)(unsigned short *__xsubi ,
                      struct drand48_data * __restrict  __buffer ,
                      double * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) lrand48_r)(struct drand48_data * __restrict  __buffer ,
                      long * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) nrand48_r)(unsigned short *__xsubi ,
                      struct drand48_data * __restrict  __buffer ,
                      long * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) mrand48_r)(struct drand48_data * __restrict  __buffer ,
                      long * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) jrand48_r)(unsigned short *__xsubi ,
                      struct drand48_data * __restrict  __buffer ,
                      long * __restrict  __result ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(2),
__leaf__)) srand48_r)(long __seedval , struct drand48_data *__buffer ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) seed48_r)(unsigned short *__seed16v , struct drand48_data *__buffer ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) lcong48_r)(unsigned short *__param , struct drand48_data *__buffer ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) malloc)(size_t __size )  __attribute__((__malloc__,
__alloc_size__(1))) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) calloc)(size_t __nmemb ,
                                                                               size_t __size )  __attribute__((__malloc__,
__alloc_size__(1,2))) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__warn_unused_result__,
__leaf__)) realloc)(void *__ptr , size_t __size )  __attribute__((__alloc_size__(2))) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__warn_unused_result__,
__leaf__)) reallocarray)(void *__ptr , size_t __nmemb , size_t __size )  __attribute__((__alloc_size__(2,3))) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__leaf__)) free)(void *__ptr ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) alloca)(size_t __size ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) valloc)(size_t __size )  __attribute__((__malloc__,
__alloc_size__(1))) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) posix_memalign)(void **__memptr , size_t __alignment , size_t __size ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__leaf__)) aligned_alloc)(size_t __alignment ,
                                                                                      size_t __size )  __attribute__((__malloc__,
__alloc_size__(2))) ;
extern  __attribute__((__nothrow__,
__noreturn__)) void ( __attribute__((__leaf__)) abort)(void) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) atexit)(void (*__func)(void) ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) at_quick_exit)(void (*__func)(void) ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) on_exit)(void (*__func)(int __status , void *__arg ) , void *__arg ) ;
extern  __attribute__((__nothrow__,
__noreturn__)) void ( __attribute__((__leaf__)) exit)(int __status ) ;
extern  __attribute__((__nothrow__,
__noreturn__)) void ( __attribute__((__leaf__)) quick_exit)(int __status ) ;
extern  __attribute__((__nothrow__,
__noreturn__)) void ( __attribute__((__leaf__)) _Exit)(int __status ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) getenv)(char const   *__name ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) putenv)(char *__string ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(2),
__leaf__)) setenv)(char const   *__name , char const   *__value , int __replace ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) unsetenv)(char const   *__name ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) clearenv)(void) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) mktemp)(char *__template ) ;
extern int ( __attribute__((__nonnull__(1))) mkstemp)(char *__template ) ;
extern int ( __attribute__((__nonnull__(1))) mkstemps)(char *__template ,
                                                       int __suffixlen ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) mkdtemp)(char *__template ) ;
extern int system(char const   *__command ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) realpath)(char const   * __restrict  __name ,
                                                                                 char * __restrict  __resolved ) ;
extern void *( __attribute__((__nonnull__(1,2,5))) bsearch)(void const   *__key ,
                                                            void const   *__base ,
                                                            size_t __nmemb ,
                                                            size_t __size ,
                                                            int (*__compar)(void const   * ,
                                                                            void const   * ) ) ;
extern void ( __attribute__((__nonnull__(1,4))) qsort)(void *__base ,
                                                       size_t __nmemb ,
                                                       size_t __size ,
                                                       int (*__compar)(void const   * ,
                                                                       void const   * ) ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) abs)(int __x )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) long ( __attribute__((__leaf__)) labs)(long __x )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) long long ( __attribute__((__leaf__)) llabs)(long long __x )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) div_t ( __attribute__((__leaf__)) div)(int __numer ,
                                                                            int __denom )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) ldiv_t ( __attribute__((__leaf__)) ldiv)(long __numer ,
                                                                              long __denom )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) lldiv_t ( __attribute__((__leaf__)) lldiv)(long long __numer ,
                                                                                long long __denom )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3,4),
__leaf__)) ecvt)(double __value , int __ndigit , int * __restrict  __decpt ,
                 int * __restrict  __sign ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3,4),
__leaf__)) fcvt)(double __value , int __ndigit , int * __restrict  __decpt ,
                 int * __restrict  __sign ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3),
__leaf__)) gcvt)(double __value , int __ndigit , char *__buf ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3,4),
__leaf__)) qecvt)(long double __value , int __ndigit ,
                  int * __restrict  __decpt , int * __restrict  __sign ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3,4),
__leaf__)) qfcvt)(long double __value , int __ndigit ,
                  int * __restrict  __decpt , int * __restrict  __sign ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(3),
__leaf__)) qgcvt)(long double __value , int __ndigit , char *__buf ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(3,4,5),
__leaf__)) ecvt_r)(double __value , int __ndigit , int * __restrict  __decpt ,
                   int * __restrict  __sign , char * __restrict  __buf ,
                   size_t __len ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(3,4,5),
__leaf__)) fcvt_r)(double __value , int __ndigit , int * __restrict  __decpt ,
                   int * __restrict  __sign , char * __restrict  __buf ,
                   size_t __len ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(3,4,5),
__leaf__)) qecvt_r)(long double __value , int __ndigit ,
                    int * __restrict  __decpt , int * __restrict  __sign ,
                    char * __restrict  __buf , size_t __len ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(3,4,5),
__leaf__)) qfcvt_r)(long double __value , int __ndigit ,
                    int * __restrict  __decpt , int * __restrict  __sign ,
                    char * __restrict  __buf , size_t __len ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) mblen)(char const   *__s ,
                                                                            size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) mbtowc)(wchar_t * __restrict  __pwc ,
                                                                             char const   * __restrict  __s ,
                                                                             size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) wctomb)(char *__s ,
                                                                             wchar_t __wchar ) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__leaf__)) mbstowcs)(wchar_t * __restrict  __pwcs ,
                                                                                  char const   * __restrict  __s ,
                                                                                  size_t __n ) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__leaf__)) wcstombs)(char * __restrict  __s ,
                                                                                  wchar_t const   * __restrict  __pwcs ,
                                                                                  size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) rpmatch)(char const   *__response ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2,3),
__leaf__)) getsubopt)(char ** __restrict  __optionp ,
                      char * const  * __restrict  __tokens ,
                      char ** __restrict  __valuep ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1),
__leaf__)) getloadavg)(double *__loadavg , int __nelem ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1,2),
__leaf__)) memcpy)(void * __restrict  __dest ,
                   void const   * __restrict  __src , size_t __n ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1,2),
__leaf__)) memmove)(void *__dest , void const   *__src , size_t __n ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1,2),
__leaf__)) memccpy)(void * __restrict  __dest ,
                    void const   * __restrict  __src , int __c , size_t __n ) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1),
__leaf__)) memset)(void *__s , int __c , size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) memcmp)(void const   *__s1 , void const   *__s2 , size_t __n )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) void *( __attribute__((__nonnull__(1),
__leaf__)) memchr)(void const   *__s , int __c , size_t __n )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strcpy)(char * __restrict  __dest , char const   * __restrict  __src ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strncpy)(char * __restrict  __dest ,
                    char const   * __restrict  __src , size_t __n ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strcat)(char * __restrict  __dest , char const   * __restrict  __src ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strncat)(char * __restrict  __dest ,
                    char const   * __restrict  __src , size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) strcmp)(char const   *__s1 , char const   *__s2 )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) strncmp)(char const   *__s1 , char const   *__s2 , size_t __n )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) strcoll)(char const   *__s1 , char const   *__s2 )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(2),
__leaf__)) strxfrm)(char * __restrict  __dest ,
                    char const   * __restrict  __src , size_t __n ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2,3),
__leaf__)) strcoll_l)(char const   *__s1 , char const   *__s2 , locale_t __l )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(2,4),
__leaf__)) strxfrm_l)(char *__dest , char const   *__src , size_t __n ,
                      locale_t __l ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) strdup)(char const   *__s )  __attribute__((__malloc__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) strndup)(char const   *__string , size_t __n )  __attribute__((__malloc__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) strchr)(char const   *__s , int __c )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) strrchr)(char const   *__s , int __c )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1,2),
__leaf__)) strcspn)(char const   *__s , char const   *__reject )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1,2),
__leaf__)) strspn)(char const   *__s , char const   *__accept )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strpbrk)(char const   *__s , char const   *__accept )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strstr)(char const   *__haystack , char const   *__needle )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(2),
__leaf__)) strtok)(char * __restrict  __s , char const   * __restrict  __delim ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(2,3),
__leaf__)) __strtok_r)(char * __restrict  __s ,
                       char const   * __restrict  __delim ,
                       char ** __restrict  __save_ptr ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(2,3),
__leaf__)) strtok_r)(char * __restrict  __s ,
                     char const   * __restrict  __delim ,
                     char ** __restrict  __save_ptr ) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1),
__leaf__)) strlen)(char const   *__s )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) size_t ( __attribute__((__nonnull__(1),
__leaf__)) strnlen)(char const   *__string , size_t __maxlen )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) strerror)(int __errnum ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(2),
__leaf__)) strerror_r)(int __errnum , char *__buf , size_t __buflen )  __asm__("__xpg_strerror_r")  ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) strerror_l)(int __errnum ,
                                                                                   locale_t __l ) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) bcmp)(void const   *__s1 , void const   *__s2 , size_t __n )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__nonnull__(1,2),
__leaf__)) bcopy)(void const   *__src , void *__dest , size_t __n ) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__nonnull__(1),
__leaf__)) bzero)(void *__s , size_t __n ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) index)(char const   *__s , int __c )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1),
__leaf__)) rindex)(char const   *__s , int __c )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ffs)(int __i )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ffsl)(long __l )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__leaf__)) ffsll)(long long __ll )  __attribute__((__const__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) strcasecmp)(char const   *__s1 , char const   *__s2 )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2),
__leaf__)) strncasecmp)(char const   *__s1 , char const   *__s2 , size_t __n )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2,3),
__leaf__)) strcasecmp_l)(char const   *__s1 , char const   *__s2 ,
                         locale_t __loc )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) int ( __attribute__((__nonnull__(1,2,4),
__leaf__)) strncasecmp_l)(char const   *__s1 , char const   *__s2 , size_t __n ,
                          locale_t __loc )  __attribute__((__pure__)) ;
extern  __attribute__((__nothrow__)) void ( __attribute__((__nonnull__(1),
__leaf__)) explicit_bzero)(void *__s , size_t __n ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) strsep)(char ** __restrict  __stringp ,
                   char const   * __restrict  __delim ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__leaf__)) strsignal)(int __sig ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) __stpcpy)(char * __restrict  __dest ,
                     char const   * __restrict  __src ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) stpcpy)(char * __restrict  __dest , char const   * __restrict  __src ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) __stpncpy)(char * __restrict  __dest ,
                      char const   * __restrict  __src , size_t __n ) ;
extern  __attribute__((__nothrow__)) char *( __attribute__((__nonnull__(1,2),
__leaf__)) stpncpy)(char * __restrict  __dest ,
                    char const   * __restrict  __src , size_t __n ) ;
char const   target[10]  = 
  {      (char const   )'E',      (char const   )'x',      (char const   )'t',      (char const   )'e', 
        (char const   )'n',      (char const   )'d',      (char const   )'i',      (char const   )'n', 
        (char const   )'g',      (char const   )'\000'};
int targetLen  =    9;
char full_source[1024000000]  ;
static char source[1024000000]  ;
static int idx  =    0;
int my_getchar(void) 
{ 


  {
  return ((int )full_source[idx]);
}
}
int soft_hang(void) 
{ 
  int found ;
  char first ;
  int max ;
  int i ;
  int j ;
  int end ;
  int k ;
  int tmp ;
  int tmp___0 ;

  {
  __repair_swap2_11__1: /* CIL Label */ 
  i = 0;
  while (found < 0) {
    first = (char )target[0];
    max = idx - targetLen;
    __repair_swap1_18__0: /* CIL Label */ 
    found = -1;
    while (i <= max) {
      if ((int )source[i] != (int )first) {
        while (1) {
          i ++;
          if (i <= max) {
            if ((int )source[i] != (int )first) {

            } else {
              break;
            }
          } else {
            break;
          }
        }
      } else {

      }
      if (i <= max) {
        j = i + 1;
        end = (j + targetLen) - 1;
        k = 1;
        while (1) {
          if (j < end) {
            if ((int )source[j] == (int )target[k]) {

            } else {
              break;
            }
          } else {
            break;
          }
          j ++;
          k ++;
        }
        if (j == end) {
          found = i;
          break;
        } else {

        }
      } else {

      }
      i ++;
    }
    tmp = idx;
    idx ++;
    tmp___0 = my_getchar();
    source[tmp] = (char )tmp___0;
  }
  return (found);
}
}
void appendString(char *array , char const   *string ) 
{ 
  int length ;
  size_t tmp ;
  int start ;
  size_t tmp___0 ;
  int end ;
  size_t tmp___1 ;
  int i ;

  {
  tmp = strlen(string);
  length = (int )tmp;
  tmp___0 = strlen((char const   *)(full_source));
  start = (int )tmp___0;
  tmp___1 = strlen((char const   *)(full_source));
  end = (int )(tmp___1 + (size_t )length);
  i = 0;
  while (1) {
    if (i < length) {
      if (start + i <= end) {

      } else {
        break;
      }
    } else {
      break;
    }
    *(array + (start + i)) = (char )*(string + i);
    i ++;
  }
  return;
}
}
int main(int argc , char **argv ) 
{ 
  unsigned int length ;
  int tmp ;
  unsigned int i ;
  char *strategy ;
  int tmp___0 ;
  size_t tmp___1 ;
  int tmp___2 ;
  size_t tmp___3 ;
  int tmp___4 ;
  int start_index ;
  int tmp___5 ;

  {
  tmp = atoi((char const   *)*(argv + 1));
  length = (unsigned int )tmp;
  i = 0U;
  strategy = *(argv + 2);
  tmp___0 = strcmp((char const   *)strategy, "beginning");
  if (tmp___0) {

  } else {
    appendString(full_source, target);
  }
  i = 0U;
  while (i < length / 2U) {
    tmp___1 = strlen((char const   *)(full_source));
    full_source[tmp___1] = (char )'a';
    i ++;
  }
  tmp___2 = strcmp((char const   *)strategy, "middle");
  if (tmp___2) {

  } else {
    appendString(full_source, target);
  }
  i = 0U;
  while (i < length / 2U) {
    tmp___3 = strlen((char const   *)(full_source));
    full_source[tmp___3] = (char )'a';
    i ++;
  }
  tmp___4 = strcmp((char const   *)strategy, "end");
  if (tmp___4) {

  } else {
    appendString(full_source, target);
  }
  tmp___5 = soft_hang();
  start_index = tmp___5;
  printf((char const   */* __restrict  */)"%d", start_index);
  exit(0);
}
}
