MODEL
MODEL_VERSION "v1998.8";
DESIGN "mioc_top";

/* port names and type */
INPUT S:PIN22 = BD3;
INPUT S:PIN99 = N_CVRST;
INPUT S:PIN7 = PBRST_N;
INPUT S:PIN29 = BA6;
INPUT S:PIN71 = BA7;
INPUT S:PIN91 = IORQ_N;
INPUT S:PIN89 = N_BWR;
INPUT S:PIN12 = BD2;
INPUT S:PIN39 = BD0;
INPUT S:PIN9 = BD1;
INPUT S:PIN77 = B_PHI;
INPUT S:PIN43 = BM1_N;
INPUT S:PIN40 = WAIT_N;
INPUT S:PIN42 = DMA_N;
INPUT S:PIN25 = BA15;
INPUT S:PIN8 = BA14;
INPUT S:PIN66 = BA13;
INPUT S:PIN92 = BUSAK_N;
INPUT S:PIN28 = BRFSH_N;
OUTPUT S:PIN41 = RST_N;
OUTPUT S:PIN30 = RAS_N;
OUTPUT S:PIN52 = AUXDECODE1_N;
OUTPUT S:PIN56 = ADDRBUFEN_N;
OUTPUT S:PIN11 = AUXROMCS_N;
OUTPUT S:PIN17 = BUSRQ_N;
OUTPUT S:PIN6 = CPRST_N;
OUTPUT S:PIN14 = EN245_N;
OUTPUT S:PIN80 = IS3_N;
OUTPUT S:PIN74 = MUX;
OUTPUT S:PIN24 = RA7;
OUTPUT S:PIN63 = SPINDIS_N;
OUTPUT S:PIN35 = BOOTROMCS_N;
OUTPUT S:PIN68 = CAS1_N;
OUTPUT S:PIN87 = CAS2_N;
OUTPUT S:PIN93 = NETRST_N;

/* timing arc definitions */
BUSAK_N_ADDRBUFEN_N_delay: DELAY BUSAK_N ADDRBUFEN_N;
BA15_ADDRBUFEN_N_delay: DELAY BA15 ADDRBUFEN_N;
DMA_N_ADDRBUFEN_N_delay: DELAY DMA_N ADDRBUFEN_N;
BA15_AUXDECODE1_N_delay: DELAY BA15 AUXDECODE1_N;
BA14_AUXDECODE1_N_delay: DELAY BA14 AUXDECODE1_N;
BA13_AUXDECODE1_N_delay: DELAY BA13 AUXDECODE1_N;
BUSAK_N_AUXDECODE1_N_delay: DELAY BUSAK_N AUXDECODE1_N;
DMA_N_AUXDECODE1_N_delay: DELAY DMA_N AUXDECODE1_N;
DMA_N_AUXROMCS_N_delay: DELAY DMA_N AUXROMCS_N;
BUSAK_N_AUXROMCS_N_delay: DELAY BUSAK_N AUXROMCS_N;
DMA_N_BUSRQ_N_delay: DELAY DMA_N BUSRQ_N;
PBRST_N_CPRST_N_delay: DELAY PBRST_N CPRST_N;
BUSAK_N_EN245_N_delay: DELAY BUSAK_N EN245_N;
DMA_N_EN245_N_delay: DELAY DMA_N EN245_N;
BUSAK_N_IS3_N_delay: DELAY BUSAK_N IS3_N;
DMA_N_IS3_N_delay: DELAY DMA_N IS3_N;
BA7_RA7_delay: DELAY BA7 RA7;
PBRST_N_RST_N_delay: DELAY PBRST_N RST_N;
N_CVRST_RST_N_delay: DELAY N_CVRST RST_N;
B_PHI_RAS_N_delay: DELAY B_PHI RAS_N;
B_PHI_AUXDECODE1_N_delay: DELAY B_PHI AUXDECODE1_N;
B_PHI_ADDRBUFEN_N_delay: DELAY B_PHI ADDRBUFEN_N;
B_PHI_AUXROMCS_N_delay: DELAY B_PHI AUXROMCS_N;
B_PHI_EN245_N_delay: DELAY B_PHI EN245_N;
B_PHI_IS3_N_delay: DELAY B_PHI IS3_N;
B_PHI_MUX_delay: DELAY B_PHI MUX;
B_PHI_RA7_delay: DELAY B_PHI RA7;
N_BWR_AUXDECODE1_N_delay: DELAY N_BWR AUXDECODE1_N;
N_BWR_ADDRBUFEN_N_delay: DELAY N_BWR ADDRBUFEN_N;
N_BWR_SPINDIS_N_delay: DELAY N_BWR SPINDIS_N;
IORQ_N_AUXDECODE1_N_delay: DELAY IORQ_N AUXDECODE1_N;
IORQ_N_ADDRBUFEN_N_delay: DELAY IORQ_N ADDRBUFEN_N;
IORQ_N_SPINDIS_N_delay: DELAY IORQ_N SPINDIS_N;
BA7_AUXDECODE1_N_delay: DELAY BA7 AUXDECODE1_N;
BA7_ADDRBUFEN_N_delay: DELAY BA7 ADDRBUFEN_N;
BA7_SPINDIS_N_delay: DELAY BA7 SPINDIS_N;
BA6_AUXDECODE1_N_delay: DELAY BA6 AUXDECODE1_N;
BA6_ADDRBUFEN_N_delay: DELAY BA6 ADDRBUFEN_N;
BA6_SPINDIS_N_delay: DELAY BA6 SPINDIS_N;

/* timing check arc definitions */
BM1_N_B_PHI_setup: SETUP(POSEDGE) BM1_N B_PHI;
IORQ_N_B_PHI_setup: SETUP(POSEDGE) IORQ_N B_PHI;
WAIT_N_B_PHI_setup: SETUP(POSEDGE) WAIT_N B_PHI;
BM1_N_B_PHI_hold: HOLD(POSEDGE) BM1_N B_PHI;
IORQ_N_B_PHI_hold: HOLD(POSEDGE) IORQ_N B_PHI;
WAIT_N_B_PHI_hold: HOLD(POSEDGE) WAIT_N B_PHI;
BD0_N_BWR_setup: SETUP(POSEDGE) BD0 N_BWR;
BD1_N_BWR_setup: SETUP(POSEDGE) BD1 N_BWR;
BD2_N_BWR_setup: SETUP(POSEDGE) BD2 N_BWR;
BD3_N_BWR_setup: SETUP(POSEDGE) BD3 N_BWR;
BD0_N_BWR_hold: HOLD(POSEDGE) BD0 N_BWR;
BD1_N_BWR_hold: HOLD(POSEDGE) BD1 N_BWR;
BD2_N_BWR_hold: HOLD(POSEDGE) BD2 N_BWR;
BD3_N_BWR_hold: HOLD(POSEDGE) BD3 N_BWR;
BD0_IORQ_N_setup: SETUP(POSEDGE) BD0 IORQ_N;
BD1_IORQ_N_setup: SETUP(POSEDGE) BD1 IORQ_N;
BD2_IORQ_N_setup: SETUP(POSEDGE) BD2 IORQ_N;
BD3_IORQ_N_setup: SETUP(POSEDGE) BD3 IORQ_N;
BD0_IORQ_N_hold: HOLD(POSEDGE) BD0 IORQ_N;
BD1_IORQ_N_hold: HOLD(POSEDGE) BD1 IORQ_N;
BD2_IORQ_N_hold: HOLD(POSEDGE) BD2 IORQ_N;
BD3_IORQ_N_hold: HOLD(POSEDGE) BD3 IORQ_N;
BD0_BA7_setup: SETUP(POSEDGE) BD0 BA7;
BD1_BA7_setup: SETUP(POSEDGE) BD1 BA7;
BD2_BA7_setup: SETUP(POSEDGE) BD2 BA7;
BD3_BA7_setup: SETUP(POSEDGE) BD3 BA7;
BD0_BA7_hold: HOLD(POSEDGE) BD0 BA7;
BD1_BA7_hold: HOLD(POSEDGE) BD1 BA7;
BD2_BA7_hold: HOLD(POSEDGE) BD2 BA7;
BD3_BA7_hold: HOLD(POSEDGE) BD3 BA7;
BD0_BA6_setup: SETUP(POSEDGE) BD0 BA6;
BD1_BA6_setup: SETUP(POSEDGE) BD1 BA6;
BD2_BA6_setup: SETUP(POSEDGE) BD2 BA6;
BD3_BA6_setup: SETUP(POSEDGE) BD3 BA6;
BD0_BA6_hold: HOLD(POSEDGE) BD0 BA6;
BD1_BA6_hold: HOLD(POSEDGE) BD1 BA6;
BD2_BA6_hold: HOLD(POSEDGE) BD2 BA6;
BD3_BA6_hold: HOLD(POSEDGE) BD3 BA6;

ENDMODEL
