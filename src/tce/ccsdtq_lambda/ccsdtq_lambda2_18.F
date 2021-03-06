      SUBROUTINE ccsdtq_lambda2_18(d_a,k_a_offset,d_b,k_b_offset,d_c,k_c
     &_offset)
C     $Id$
C     This is a Fortran77 program generated by Tensor Contraction Engine v.1.0
C     Copyright (c) Battelle & Pacific Northwest National Laboratory (2002)
C     i0 ( h3 h4 p1 p2 )_ytv + = -1 * P( 2 ) * Sum ( h9 h11 p12 ) * i1 ( h3 h4 h9 h11 p1 p12 )_yt * v ( h11 p12 h9 p2 )_v
      IMPLICIT NONE
#include "global.fh"
#include "mafdecls.fh"
#include "sym.fh"
#include "errquit.fh"
#include "tce.fh"
      INTEGER d_a
      INTEGER k_a_offset
      INTEGER d_b
      INTEGER k_b_offset
      INTEGER d_c
      INTEGER k_c_offset
      INTEGER NXTASK
      INTEGER next
      INTEGER nprocs
      INTEGER count
      INTEGER h3b
      INTEGER h4b
      INTEGER p1b
      INTEGER p2b
      INTEGER dimc
      INTEGER l_c_sort
      INTEGER k_c_sort
      INTEGER h9b
      INTEGER h11b
      INTEGER p12b
      INTEGER h3b_1
      INTEGER h4b_1
      INTEGER h9b_1
      INTEGER p1b_1
      INTEGER h11b_1
      INTEGER p12b_1
      INTEGER h11b_2
      INTEGER p12b_2
      INTEGER p2b_2
      INTEGER h9b_2
      INTEGER dim_common
      INTEGER dima_sort
      INTEGER dima
      INTEGER dimb_sort
      INTEGER dimb
      INTEGER l_a_sort
      INTEGER k_a_sort
      INTEGER l_a
      INTEGER k_a
      INTEGER l_b_sort
      INTEGER k_b_sort
      INTEGER l_b
      INTEGER k_b
      INTEGER l_c
      INTEGER k_c
      EXTERNAL NXTASK
      nprocs = GA_NNODES()
      count = 0
      next = NXTASK(nprocs,1)
      DO h3b = 1,noab
      DO h4b = h3b,noab
      DO p1b = noab+1,noab+nvab
      DO p2b = noab+1,noab+nvab
      IF (next.eq.count) THEN
      IF ((.not.restricted).or.(int_mb(k_spin+h3b-1)+int_mb(k_spin+h4b-1
     &)+int_mb(k_spin+p1b-1)+int_mb(k_spin+p2b-1).ne.8)) THEN
      IF (int_mb(k_spin+h3b-1)+int_mb(k_spin+h4b-1) .eq. int_mb(k_spin+p
     &1b-1)+int_mb(k_spin+p2b-1)) THEN
      IF (ieor(int_mb(k_sym+h3b-1),ieor(int_mb(k_sym+h4b-1),ieor(int_mb(
     &k_sym+p1b-1),int_mb(k_sym+p2b-1)))) .eq. ieor(irrep_y,ieor(irrep_t
     &,irrep_v))) THEN
      dimc = int_mb(k_range+h3b-1) * int_mb(k_range+h4b-1) * int_mb(k_ra
     &nge+p1b-1) * int_mb(k_range+p2b-1)
      IF (.not.MA_PUSH_GET(mt_dbl,dimc,'noname',l_c_sort,k_c_sort)) CALL
     & ERRQUIT('ccsdtq_lambda2_18',0,MA_ERR)
      CALL DFILL(dimc,0.0d0,dbl_mb(k_c_sort),1)
      DO h9b = 1,noab
      DO h11b = 1,noab
      DO p12b = noab+1,noab+nvab
      IF (int_mb(k_spin+h3b-1)+int_mb(k_spin+h4b-1)+int_mb(k_spin+h9b-1)
     & .eq. int_mb(k_spin+p1b-1)+int_mb(k_spin+h11b-1)+int_mb(k_spin+p12
     &b-1)) THEN
      IF (ieor(int_mb(k_sym+h3b-1),ieor(int_mb(k_sym+h4b-1),ieor(int_mb(
     &k_sym+h9b-1),ieor(int_mb(k_sym+p1b-1),ieor(int_mb(k_sym+h11b-1),in
     &t_mb(k_sym+p12b-1)))))) .eq. ieor(irrep_y,irrep_t)) THEN
      CALL TCE_RESTRICTED_6(h3b,h4b,h9b,p1b,h11b,p12b,h3b_1,h4b_1,h9b_1,
     &p1b_1,h11b_1,p12b_1)
      CALL TCE_RESTRICTED_4(h11b,p12b,p2b,h9b,h11b_2,p12b_2,p2b_2,h9b_2)
      dim_common = int_mb(k_range+h9b-1) * int_mb(k_range+h11b-1) * int_
     &mb(k_range+p12b-1)
      dima_sort = int_mb(k_range+h3b-1) * int_mb(k_range+h4b-1) * int_mb
     &(k_range+p1b-1)
      dima = dim_common * dima_sort
      dimb_sort = int_mb(k_range+p2b-1)
      dimb = dim_common * dimb_sort
      IF ((dima .gt. 0) .and. (dimb .gt. 0)) THEN
      IF (.not.MA_PUSH_GET(mt_dbl,dima,'noname',l_a_sort,k_a_sort)) CALL
     & ERRQUIT('ccsdtq_lambda2_18',1,MA_ERR)
      IF (.not.MA_PUSH_GET(mt_dbl,dima,'noname',l_a,k_a)) CALL ERRQUIT('
     &ccsdtq_lambda2_18',2,MA_ERR)
      CALL GET_HASH_BLOCK(d_a,dbl_mb(k_a),dima,int_mb(k_a_offset),(p12b_
     &1 - noab - 1 + nvab * (h11b_1 - 1 + noab * (p1b_1 - noab - 1 + nva
     &b * (h9b_1 - 1 + noab * (h4b_1 - 1 + noab * (h3b_1 - 1)))))))
      CALL TCE_SORT_6(dbl_mb(k_a),dbl_mb(k_a_sort),int_mb(k_range+h3b-1)
     &,int_mb(k_range+h4b-1),int_mb(k_range+h9b-1),int_mb(k_range+p1b-1)
     &,int_mb(k_range+h11b-1),int_mb(k_range+p12b-1),4,2,1,6,5,3,1.0d0)
      IF (.not.MA_POP_STACK(l_a)) CALL ERRQUIT('ccsdtq_lambda2_18',3,MA_
     &ERR)
      IF (.not.MA_PUSH_GET(mt_dbl,dimb,'noname',l_b_sort,k_b_sort)) CALL
     & ERRQUIT('ccsdtq_lambda2_18',4,MA_ERR)
      IF (.not.MA_PUSH_GET(mt_dbl,dimb,'noname',l_b,k_b)) CALL ERRQUIT('
     &ccsdtq_lambda2_18',5,MA_ERR)
      IF ((h9b .le. p2b)) THEN
      CALL GET_HASH_BLOCK(d_b,dbl_mb(k_b),dimb,int_mb(k_b_offset),(p2b_2
     & - 1 + (noab+nvab) * (h9b_2 - 1 + (noab+nvab) * (p12b_2 - 1 + (noa
     &b+nvab) * (h11b_2 - 1)))))
      CALL TCE_SORT_4(dbl_mb(k_b),dbl_mb(k_b_sort),int_mb(k_range+h11b-1
     &),int_mb(k_range+p12b-1),int_mb(k_range+h9b-1),int_mb(k_range+p2b-
     &1),4,2,1,3,1.0d0)
      END IF
      IF (.not.MA_POP_STACK(l_b)) CALL ERRQUIT('ccsdtq_lambda2_18',6,MA_
     &ERR)
      CALL DGEMM('T','N',dima_sort,dimb_sort,dim_common,1.0d0,dbl_mb(k_a
     &_sort),dim_common,dbl_mb(k_b_sort),dim_common,1.0d0,dbl_mb(k_c_sor
     &t),dima_sort)
      IF (.not.MA_POP_STACK(l_b_sort)) CALL ERRQUIT('ccsdtq_lambda2_18',
     &7,MA_ERR)
      IF (.not.MA_POP_STACK(l_a_sort)) CALL ERRQUIT('ccsdtq_lambda2_18',
     &8,MA_ERR)
      END IF
      END IF
      END IF
      END DO
      END DO
      END DO
      IF (.not.MA_PUSH_GET(mt_dbl,dimc,'noname',l_c,k_c)) CALL ERRQUIT('
     &ccsdtq_lambda2_18',9,MA_ERR)
      IF ((p1b .le. p2b)) THEN
      CALL TCE_SORT_4(dbl_mb(k_c_sort),dbl_mb(k_c),int_mb(k_range+p2b-1)
     &,int_mb(k_range+p1b-1),int_mb(k_range+h4b-1),int_mb(k_range+h3b-1)
     &,4,3,2,1,-1.0d0)
      CALL ADD_HASH_BLOCK(d_c,dbl_mb(k_c),dimc,int_mb(k_c_offset),(p2b -
     & noab - 1 + nvab * (p1b - noab - 1 + nvab * (h4b - 1 + noab * (h3b
     & - 1)))))
      END IF
      IF ((p2b .le. p1b)) THEN
      CALL TCE_SORT_4(dbl_mb(k_c_sort),dbl_mb(k_c),int_mb(k_range+p2b-1)
     &,int_mb(k_range+p1b-1),int_mb(k_range+h4b-1),int_mb(k_range+h3b-1)
     &,4,3,1,2,1.0d0)
      CALL ADD_HASH_BLOCK(d_c,dbl_mb(k_c),dimc,int_mb(k_c_offset),(p1b -
     & noab - 1 + nvab * (p2b - noab - 1 + nvab * (h4b - 1 + noab * (h3b
     & - 1)))))
      END IF
      IF (.not.MA_POP_STACK(l_c)) CALL ERRQUIT('ccsdtq_lambda2_18',10,MA
     &_ERR)
      IF (.not.MA_POP_STACK(l_c_sort)) CALL ERRQUIT('ccsdtq_lambda2_18',
     &11,MA_ERR)
      END IF
      END IF
      END IF
      next = NXTASK(nprocs,1)
      END IF
      count = count + 1
      END DO
      END DO
      END DO
      END DO
      next = NXTASK(-nprocs,1)
      call GA_SYNC()
      RETURN
      END
