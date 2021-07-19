@reexport module LibP4est
  using CBinding
  import P4est_jll
  
  let
    p4est_library = P4est_jll.libp4est_path
    p4est_include = joinpath(dirname(dirname(P4est_jll.libp4est_path)), "include")
    p4est_library_dir = joinpath(dirname(dirname(P4est_jll.libp4est_path)), "lib")
    c`-I$p4est_include -L$p4est_library_dir -lp4est`
  end
  
  const c"int8_t" = Int8
  const c"int16_t" = Int16
  const c"int32_t" = Int32
  const c"int64_t" = Int64
  const c"uint8_t" = UInt8
  const c"uint16_t" = UInt16
  const c"uint32_t" = UInt32
  const c"uint64_t" = UInt64
  const c"size_t" = Csize_t
  const c"ssize_t" = Cssize_t
  
  # define them as Cvoid since they are usually used as opaque
  const c"FILE"    = Cvoid
  const c"va_list" = Cvoid
  
  c"""
    #include <stdio.h>
    #include <stdarg.h>
  """s
  
  c"""
    #include "p4est.h"
    #include "p4est_extended.h"
    #include "p6est.h"
    #include "p6est_extended.h"
    #include "p8est.h"
    #include "p8est_extended.h"
  """ji
end
