#include <stdio.h>
#include "cuda.h"
#define max(x,y)  ((x) > (y)? (x) : (y))
#define min(x,y)  ((x) < (y)? (x) : (y))
#define ceil(a,b) ((a) % (b) == 0 ? (a) / (b) : ((a) / (b)) + 1)

void check_error (const char* message) {
	cudaError_t error = cudaGetLastError ();
	if (error != cudaSuccess) {
		printf ("CUDA error : %s, %s\n", message, cudaGetErrorString (error));
		exit(-1);
	}
}

__global__ void curvi (double * __restrict__ in_r1, double *__restrict__ in_u1, double * __restrict__ in_u2, double *__restrict__ in_u3, double * __restrict__ in_mu, double * __restrict__ in_la, double * __restrict__ in_met1, double * __restrict__ in_met2, double * __restrict__ in_met3, double * __restrict__ in_met4, double * strx, double * stry, double c1, double c2, int N) {
	//Determing the block's indices
	int blockdim_k= (int)(blockDim.x);
	int k0 = (int)(blockIdx.x)*(blockdim_k);
	int k = max (k0, 0) + (int)(threadIdx.x);
	int blockdim_j= (int)(blockDim.y);
	int j0 = (int)(blockIdx.y)*(blockdim_j);
	int j = max (j0, 0) + (int)(threadIdx.y);

	double (*u1)[304][304] = (double (*)[304][304])in_u1;
	double (*u2)[304][304] = (double (*)[304][304])in_u2;
	double (*u3)[304][304] = (double (*)[304][304])in_u3;
	double (*mu)[304][304] = (double (*)[304][304])in_mu;
	double (*la)[304][304] = (double (*)[304][304])in_la;
	double (*r1)[304][304] = (double (*)[304][304])in_r1;
	double (*met1)[304][304] = (double (*)[304][304])in_met1;
	double (*met2)[304][304] = (double (*)[304][304])in_met2;
	double (*met3)[304][304] = (double (*)[304][304])in_met3;
	double (*met4)[304][304] = (double (*)[304][304])in_met4;

	if (j>=2 & k>=2 & j<=N-3 & k<=N-3) {
		for (int i=2; i<=N-3; i++) {
double _t_27_;
double _t_105_;
double _t_8_;
double _t_87_;
double _t_102_;
double _t_84_;
double _t_24_;
double _t_5_;
double _t_104_;
double _t_103_;
double _t_123_;
double _t_122_;
double _t_141_;
double _t_140_;
double _t_86_;
double _t_85_;
double _t_101_;
double _t_110_;
double _t_108_;
double _t_115_;
double _t_113_;
double _t_83_;
double _t_92_;
double _t_90_;
double _t_97_;
double _t_95_;
double _t_129_;
double _t_134_;
double _t_120_;
double _t_127_;
double _t_132_;
double _t_147_;
double _t_152_;
double _t_150_;
double _t_138_;
double _t_145_;
double _t_106_;
double _t_66_;
double _t_100_;
double _t_47_;
double _t_88_;
double _t_82_;
double _t_44_;
double _t_63_;
double _t_81_;
double _t_111_;
double _t_32_;
double _t_109_;
double _t_13_;
double _t_93_;
double _t_91_;
double _t_11_;
double _t_30_;
double _t_112_;
double _t_71_;
double _t_107_;
double _t_52_;
double _t_94_;
double _t_89_;
double _t_50_;
double _t_69_;
double _t_116_;
double _t_38_;
double _t_114_;
double _t_19_;
double _t_98_;
double _t_96_;
double _t_17_;
double _t_36_;
double _t_117_;
double _t_77_;
double _t_58_;
double _t_99_;
double _t_80_;
double _t_56_;
double _t_75_;
double _t_124_;
double _t_28_;
double _t_121_;
double _t_9_;
double _t_142_;
double _t_139_;
double _t_125_;
double _t_67_;
double _t_119_;
double _t_118_;
double _t_48_;
double _t_143_;
double _t_137_;
double _t_130_;
double _t_33_;
double _t_128_;
double _t_14_;
double _t_148_;
double _t_146_;
double _t_131_;
double _t_72_;
double _t_126_;
double _t_53_;
double _t_149_;
double _t_144_;
double _t_135_;
double _t_39_;
double _t_133_;
double _t_20_;
double _t_153_;
double _t_151_;
double _t_136_;
double _t_78_;
double _t_59_;
double _t_154_;
double _t_79_;
double r1ic0jc0kc0 = r1[i][j][k];
double _t_26_;
double _t_25_;
double _t_178_;
double _t_23_;
double _t_22_;
double _t_21_;
double _t_1_;
double _t_176_;
double _t_37_;
double _t_35_;
double _t_34_;
double _t_31_;
double _t_173_;
double _t_29_;
double _t_171_;
double _t_46_;
double _t_45_;
double _t_191_;
double _t_43_;
double _t_42_;
double _t_189_;
double _t_41_;
double _t_40_;
double _t_57_;
double _t_55_;
double _t_54_;
double _t_51_;
double _t_186_;
double _t_49_;
double _t_184_;
double _t_65_;
double _t_64_;
double _t_203_;
double _t_62_;
double _t_61_;
double _t_201_;
double _t_60_;
double _t_76_;
double _t_74_;
double _t_73_;
double _t_70_;
double _t_198_;
double _t_68_;
double _t_196_;
double _t_0_;
double _t_7_;
double _t_6_;
double _t_166_;
double _t_4_;
double _t_3_;
double _t_2_;
double _t_164_;
double _t_18_;
double _t_16_;
double _t_15_;
double _t_12_;
double _t_161_;
double _t_10_;
double _t_159_;
double _t_162_;
double _t_160_;
double _t_163_;
double _t_158_;
double _t_157_;
double _t_156_;
double _t_167_;
double _t_165_;
double _t_168_;
double _t_174_;
double _t_172_;
double _t_175_;
double _t_170_;
double _t_169_;
double _t_179_;
double _t_177_;
double _t_180_;
double _t_155_;
double _t_187_;
double _t_185_;
double _t_188_;
double _t_183_;
double _t_182_;
double _t_181_;
double _t_192_;
double _t_190_;
double _t_193_;
double _t_199_;
double _t_197_;
double _t_200_;
double _t_195_;
double _t_194_;
double _t_204_;
double _t_202_;
double _t_205_;

_t_27_ = -u1[i-2][j][k-2];
_t_105_ = -u1[i-2][j][k-2];
_t_105_ += u1[i-2][j][k+2];
_t_8_ = -u1[i-2][j][k+2];
_t_27_ += u1[i+2][j][k-2];
_t_87_ = -u1[i+2][j][k-2];
_t_8_ += u1[i+2][j][k+2];
_t_87_ += u1[i+2][j][k+2];
_t_102_ = c2 * _t_105_;
_t_84_ = c2 * _t_87_;
_t_24_ = c2 * _t_27_;
_t_5_ = c2 * _t_8_;
_t_104_ = 2.0 * mu[i-2][j][k];
_t_104_ += la[i-2][j][k];
_t_103_ = _t_104_ * met2[i-2][j][k];
_t_123_ = 2.0 * mu[i+1][j][k];
_t_123_ += la[i+1][j][k];
_t_122_ = _t_123_ * met2[i+1][j][k];
_t_141_ = 2.0 * mu[i-1][j][k];
_t_141_ += la[i-1][j][k];
_t_140_ = _t_141_ * met2[i-1][j][k];
_t_86_ = 2.0 * mu[i+2][j][k];
_t_86_ += la[i+2][j][k];
_t_85_ = _t_86_ * met2[i+2][j][k];
_t_101_ = _t_103_ * met1[i-2][j][k];
_t_110_ = la[i-2][j][k] * met3[i-2][j][k];
_t_108_ = _t_110_ * met1[i-2][j][k];
_t_115_ = la[i-2][j][k] * met4[i-2][j][k];
_t_113_ = _t_115_ * met1[i-2][j][k];
_t_83_ = _t_85_ * met1[i+2][j][k];
_t_92_ = la[i+2][j][k] * met3[i+2][j][k];
_t_90_ = _t_92_ * met1[i+2][j][k];
_t_97_ = la[i+2][j][k] * met4[i+2][j][k];
_t_95_ = _t_97_ * met1[i+2][j][k];
_t_129_ = la[i+1][j][k] * met3[i+1][j][k];
_t_134_ = la[i+1][j][k] * met4[i+1][j][k];
_t_120_ = _t_122_ * met1[i+1][j][k];
_t_127_ = _t_129_ * met1[i+1][j][k];
_t_132_ = _t_134_ * met1[i+1][j][k];
_t_147_ = la[i-1][j][k] * met3[i-1][j][k];
_t_152_ = la[i-1][j][k] * met4[i-1][j][k];
_t_150_ = _t_152_ * met1[i-1][j][k];
_t_138_ = _t_140_ * met1[i-1][j][k];
_t_145_ = _t_147_ * met1[i-1][j][k];
_t_106_ = -u1[i-2][j][k-1];
_t_66_ = -u1[i-2][j][k-1];
_t_106_ += u1[i-2][j][k+1];
_t_102_ += c1 * _t_106_;
_t_100_ = _t_101_ * _t_102_;
_t_47_ = -u1[i-2][j][k+1];
_t_66_ += u1[i+2][j][k-1];
_t_88_ = -u1[i+2][j][k-1];
_t_47_ += u1[i+2][j][k+1];
_t_88_ += u1[i+2][j][k+1];
_t_84_ += c1 * _t_88_;
_t_82_ = _t_83_ * _t_84_;
_t_44_ = c2 * _t_47_;
_t_63_ = c2 * _t_66_;
_t_81_ = _t_100_ * strx[i];
_t_81_ += _t_82_ * strx[i];
_t_111_ = -u2[i-2][j][k-2];
_t_32_ = -u2[i-2][j][k-2];
_t_111_ += u2[i-2][j][k+2];
_t_109_ = c2 * _t_111_;
_t_13_ = -u2[i-2][j][k+2];
_t_32_ += u2[i+2][j][k-2];
_t_93_ = -u2[i+2][j][k-2];
_t_13_ += u2[i+2][j][k+2];
_t_93_ += u2[i+2][j][k+2];
_t_91_ = c2 * _t_93_;
_t_11_ = c2 * _t_13_;
_t_30_ = c2 * _t_32_;
_t_112_ = -u2[i-2][j][k-1];
_t_71_ = -u2[i-2][j][k-1];
_t_112_ += u2[i-2][j][k+1];
_t_109_ += c1 * _t_112_;
_t_107_ = _t_108_ * _t_109_;
_t_81_ += _t_107_ * stry[j];
_t_52_ = -u2[i-2][j][k+1];
_t_71_ += u2[i+2][j][k-1];
_t_94_ = -u2[i+2][j][k-1];
_t_52_ += u2[i+2][j][k+1];
_t_94_ += u2[i+2][j][k+1];
_t_91_ += c1 * _t_94_;
_t_89_ = _t_90_ * _t_91_;
_t_81_ += _t_89_ * stry[j];
_t_50_ = c2 * _t_52_;
_t_69_ = c2 * _t_71_;
_t_116_ = -u3[i-2][j][k-2];
_t_38_ = -u3[i-2][j][k-2];
_t_116_ += u3[i-2][j][k+2];
_t_114_ = c2 * _t_116_;
_t_19_ = -u3[i-2][j][k+2];
_t_38_ += u3[i+2][j][k-2];
_t_98_ = -u3[i+2][j][k-2];
_t_19_ += u3[i+2][j][k+2];
_t_98_ += u3[i+2][j][k+2];
_t_96_ = c2 * _t_98_;
_t_17_ = c2 * _t_19_;
_t_36_ = c2 * _t_38_;
_t_117_ = -u3[i-2][j][k-1];
_t_77_ = -u3[i-2][j][k-1];
_t_117_ += u3[i-2][j][k+1];
_t_114_ += c1 * _t_117_;
_t_81_ += _t_113_ * _t_114_;
_t_58_ = -u3[i-2][j][k+1];
_t_77_ += u3[i+2][j][k-1];
_t_99_ = -u3[i+2][j][k-1];
_t_58_ += u3[i+2][j][k+1];
_t_99_ += u3[i+2][j][k+1];
_t_96_ += c1 * _t_99_;
_t_81_ += _t_95_ * _t_96_;
_t_80_ = c2 * _t_81_;
_t_56_ = c2 * _t_58_;
_t_75_ = c2 * _t_77_;
_t_124_ = -u1[i+1][j][k-2];
_t_28_ = u1[i+1][j][k-2];
_t_124_ += u1[i+1][j][k+2];
_t_121_ = c2 * _t_124_;
_t_9_ = u1[i+1][j][k+2];
_t_28_ -= u1[i-1][j][k-2];
_t_24_ += c1 * _t_28_;
_t_142_ = -u1[i-1][j][k-2];
_t_9_ -= u1[i-1][j][k+2];
_t_5_ += c1 * _t_9_;
_t_142_ += u1[i-1][j][k+2];
_t_139_ = c2 * _t_142_;
_t_125_ = -u1[i+1][j][k-1];
_t_67_ = u1[i+1][j][k-1];
_t_125_ += u1[i+1][j][k+1];
_t_121_ += c1 * _t_125_;
_t_119_ = _t_120_ * _t_121_;
_t_118_ = _t_119_ * strx[i];
_t_48_ = u1[i+1][j][k+1];
_t_67_ -= u1[i-1][j][k-1];
_t_63_ += c1 * _t_67_;
_t_143_ = -u1[i-1][j][k-1];
_t_48_ -= u1[i-1][j][k+1];
_t_44_ += c1 * _t_48_;
_t_143_ += u1[i-1][j][k+1];
_t_139_ += c1 * _t_143_;
_t_137_ = _t_138_ * _t_139_;
_t_118_ += _t_137_ * strx[i];
_t_130_ = -u2[i+1][j][k-2];
_t_33_ = u2[i+1][j][k-2];
_t_130_ += u2[i+1][j][k+2];
_t_128_ = c2 * _t_130_;
_t_14_ = u2[i+1][j][k+2];
_t_33_ -= u2[i-1][j][k-2];
_t_30_ += c1 * _t_33_;
_t_148_ = -u2[i-1][j][k-2];
_t_14_ -= u2[i-1][j][k+2];
_t_11_ += c1 * _t_14_;
_t_148_ += u2[i-1][j][k+2];
_t_146_ = c2 * _t_148_;
_t_131_ = -u2[i+1][j][k-1];
_t_72_ = u2[i+1][j][k-1];
_t_131_ += u2[i+1][j][k+1];
_t_128_ += c1 * _t_131_;
_t_126_ = _t_127_ * _t_128_;
_t_118_ += _t_126_ * stry[j];
_t_53_ = u2[i+1][j][k+1];
_t_72_ -= u2[i-1][j][k-1];
_t_69_ += c1 * _t_72_;
_t_149_ = -u2[i-1][j][k-1];
_t_53_ -= u2[i-1][j][k+1];
_t_50_ += c1 * _t_53_;
_t_149_ += u2[i-1][j][k+1];
_t_146_ += c1 * _t_149_;
_t_144_ = _t_145_ * _t_146_;
_t_118_ += _t_144_ * stry[j];
_t_135_ = -u3[i+1][j][k-2];
_t_39_ = u3[i+1][j][k-2];
_t_135_ += u3[i+1][j][k+2];
_t_133_ = c2 * _t_135_;
_t_20_ = u3[i+1][j][k+2];
_t_39_ -= u3[i-1][j][k-2];
_t_36_ += c1 * _t_39_;
_t_153_ = -u3[i-1][j][k-2];
_t_20_ -= u3[i-1][j][k+2];
_t_17_ += c1 * _t_20_;
_t_153_ += u3[i-1][j][k+2];
_t_151_ = c2 * _t_153_;
_t_136_ = -u3[i+1][j][k-1];
_t_78_ = u3[i+1][j][k-1];
_t_136_ += u3[i+1][j][k+1];
_t_133_ += c1 * _t_136_;
_t_118_ += _t_132_ * _t_133_;
_t_59_ = u3[i+1][j][k+1];
_t_78_ -= u3[i-1][j][k-1];
_t_75_ += c1 * _t_78_;
_t_154_ = -u3[i-1][j][k-1];
_t_59_ -= u3[i-1][j][k+1];
_t_56_ += c1 * _t_59_;
_t_154_ += u3[i-1][j][k+1];
_t_151_ += c1 * _t_154_;
_t_118_ += _t_150_ * _t_151_;
_t_80_ += c1 * _t_118_;
_t_79_ = _t_80_ * stry[j];
r1ic0jc0kc0 += _t_79_;
_t_26_ = 2.0 * mu[i][j][k-2];
_t_26_ += la[i][j][k-2];
_t_25_ = _t_26_ * met2[i][j][k-2];
_t_178_ = la[i][j][k-2] * met2[i][j][k-2];
_t_23_ = _t_25_ * met1[i][j][k-2];
_t_22_ = _t_23_ * _t_24_;
_t_21_ = _t_22_ * strx[i];
_t_1_ = _t_21_ * stry[j];
_t_176_ = _t_178_ * met1[i][j][k-2];
_t_37_ = mu[i][j][k-2] * met4[i][j][k-2];
_t_35_ = _t_37_ * met1[i][j][k-2];
_t_34_ = _t_35_ * _t_36_;
_t_1_ += _t_34_ * stry[j];
_t_31_ = mu[i][j][k-2] * met3[i][j][k-2];
_t_173_ = mu[i][j][k-2] * met3[i][j][k-2];
_t_29_ = _t_31_ * met1[i][j][k-2];
_t_1_ += _t_29_ * _t_30_;
_t_171_ = _t_173_ * met1[i][j][k-2];
_t_46_ = 2.0 * mu[i][j][k+1];
_t_46_ += la[i][j][k+1];
_t_45_ = _t_46_ * met2[i][j][k+1];
_t_191_ = la[i][j][k+1] * met2[i][j][k+1];
_t_43_ = _t_45_ * met1[i][j][k+1];
_t_42_ = _t_43_ * _t_44_;
_t_189_ = _t_191_ * met1[i][j][k+1];
_t_41_ = _t_42_ * strx[i+2];
_t_40_ = _t_41_ * stry[j];
_t_57_ = mu[i][j][k+1] * met4[i][j][k+1];
_t_55_ = _t_57_ * met1[i][j][k+1];
_t_54_ = _t_55_ * _t_56_;
_t_40_ += _t_54_ * stry[j];
_t_51_ = mu[i][j][k+1] * met3[i][j][k+1];
_t_186_ = mu[i][j][k+1] * met3[i][j][k+1];
_t_49_ = _t_51_ * met1[i][j][k+1];
_t_40_ += _t_49_ * _t_50_;
_t_184_ = _t_186_ * met1[i][j][k+1];
_t_65_ = 2.0 * mu[i][j][k-1];
_t_65_ += la[i][j][k-1];
_t_64_ = _t_65_ * met2[i][j][k-1];
_t_203_ = la[i][j][k-1] * met2[i][j][k-1];
_t_62_ = _t_64_ * met1[i][j][k-1];
_t_61_ = _t_62_ * _t_63_;
_t_201_ = _t_203_ * met1[i][j][k-1];
_t_60_ = _t_61_ * strx[i-2];
_t_40_ += _t_60_ * stry[j];
_t_76_ = mu[i][j][k-1] * met4[i][j][k-1];
_t_74_ = _t_76_ * met1[i][j][k-1];
_t_73_ = _t_74_ * _t_75_;
_t_40_ += _t_73_ * stry[j];
_t_70_ = mu[i][j][k-1] * met3[i][j][k-1];
_t_198_ = mu[i][j][k-1] * met3[i][j][k-1];
_t_68_ = _t_70_ * met1[i][j][k-1];
_t_40_ += _t_68_ * _t_69_;
_t_196_ = _t_198_ * met1[i][j][k-1];
_t_0_ = c1 * _t_40_;
_t_7_ = 2.0 * mu[i][j][k+2];
_t_7_ += la[i][j][k+2];
_t_6_ = _t_7_ * met2[i][j][k+2];
_t_166_ = la[i][j][k+2] * met2[i][j][k+2];
_t_4_ = _t_6_ * met1[i][j][k+2];
_t_3_ = _t_4_ * _t_5_;
_t_2_ = _t_3_ * strx[i];
_t_1_ += _t_2_ * stry[j];
_t_164_ = _t_166_ * met1[i][j][k+2];
_t_18_ = mu[i][j][k+2] * met4[i][j][k+2];
_t_16_ = _t_18_ * met1[i][j][k+2];
_t_15_ = _t_16_ * _t_17_;
_t_1_ += _t_15_ * stry[j];
_t_12_ = mu[i][j][k+2] * met3[i][j][k+2];
_t_161_ = mu[i][j][k+2] * met3[i][j][k+2];
_t_10_ = _t_12_ * met1[i][j][k+2];
_t_1_ += _t_10_ * _t_11_;
_t_0_ += c2 * _t_1_;
r1ic0jc0kc0 += _t_0_;
_t_159_ = _t_161_ * met1[i][j][k+2];
_t_162_ = -u1[i][j-2][k+2];
_t_162_ += u1[i][j+2][k+2];
_t_160_ = c2 * _t_162_;
_t_163_ = -u1[i][j-1][k+2];
_t_163_ += u1[i][j+1][k+2];
_t_160_ += c1 * _t_163_;
_t_158_ = _t_159_ * _t_160_;
_t_157_ = _t_158_ * stry[j+2];
_t_156_ = _t_157_ * strx[i];
_t_167_ = -u2[i][j-2][k+2];
_t_167_ += u2[i][j+2][k+2];
_t_165_ = c2 * _t_167_;
_t_168_ = -u2[i][j-1][k+2];
_t_168_ += u2[i][j+1][k+2];
_t_165_ += c1 * _t_168_;
_t_156_ += _t_164_ * _t_165_;
_t_174_ = -u1[i][j-2][k-2];
_t_174_ += u1[i][j+2][k-2];
_t_172_ = c2 * _t_174_;
_t_175_ = -u1[i][j-1][k-2];
_t_175_ += u1[i][j+1][k-2];
_t_172_ += c1 * _t_175_;
_t_170_ = _t_171_ * _t_172_;
_t_169_ = _t_170_ * stry[j];
_t_156_ += _t_169_ * strx[i];
_t_179_ = -u2[i][j-2][k-2];
_t_179_ += u2[i][j+2][k-2];
_t_177_ = c2 * _t_179_;
_t_180_ = -u2[i][j-1][k-2];
_t_180_ += u2[i][j+1][k-2];
_t_177_ += c1 * _t_180_;
_t_156_ += _t_176_ * _t_177_;
_t_155_ = c2 * _t_156_;
_t_187_ = -u1[i][j-2][k+1];
_t_187_ += u1[i][j+2][k+1];
_t_185_ = c2 * _t_187_;
_t_188_ = -u1[i][j-1][k+1];
_t_188_ += u1[i][j+1][k+1];
_t_185_ += c1 * _t_188_;
_t_183_ = _t_184_ * _t_185_;
_t_182_ = _t_183_ * stry[j-2];
_t_181_ = _t_182_ * strx[i];
_t_192_ = -u2[i][j-2][k+1];
_t_192_ += u2[i][j+2][k+1];
_t_190_ = c2 * _t_192_;
_t_193_ = -u2[i][j-1][k+1];
_t_193_ += u2[i][j+1][k+1];
_t_190_ += c1 * _t_193_;
_t_181_ += _t_189_ * _t_190_;
_t_199_ = -u1[i][j-2][k-1];
_t_199_ += u1[i][j+2][k-1];
_t_197_ = c2 * _t_199_;
_t_200_ = -u1[i][j-1][k-1];
_t_200_ += u1[i][j+1][k-1];
_t_197_ += c1 * _t_200_;
_t_195_ = _t_196_ * _t_197_;
_t_194_ = _t_195_ * stry[j];
_t_181_ += _t_194_ * strx[i];
_t_204_ = -u2[i][j-2][k-1];
_t_204_ += u2[i][j+2][k-1];
_t_202_ = c2 * _t_204_;
_t_205_ = -u2[i][j-1][k-1];
_t_205_ += u2[i][j+1][k-1];
_t_202_ += c1 * _t_205_;
_t_181_ += _t_201_ * _t_202_;
_t_155_ += c1 * _t_181_;
r1ic0jc0kc0 += _t_155_;
r1[i][j][k] = r1ic0jc0kc0;

			r1[i][j][k] += c2*(
					mu[i][j+2][k]*met3[i][j+2][k]*met1[i][j+2][k]*(
						c2*(u1[i][j+2][k+2]-u1[i][j+2][k-2]) +
						c1*(u1[i][j+2][k+1]-u1[i][j+2][k-1])   )*stry[j+1]*strx[i]
					+ mu[i][j+2][k]*met2[i][j+2][k]*met1[i][j+2][k]*(
						c2*(u2[i][j+2][k+2]-u2[i][j+2][k-2]) +
						c1*(u2[i][j+2][k+1]-u2[i][j+2][k-1])  )
					+ ( mu[i][j-2][k]*met3[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u1[i][j-2][k+2]-u1[i][j-2][k-2]) +
							c1*(u1[i][j-2][k+1]-u1[i][j-2][k-1])  )*stry[j]*strx[i]
						+ mu[i][j-2][k]*met2[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u2[i][j-2][k+2]-u2[i][j-2][k-2]) +
							c1*(u2[i][j-2][k+1]-u2[i][j-2][k-1])   ) )
					) + c1*(
						mu[i][j+1][k]*met3[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u1[i][j+1][k+2]-u1[i][j+1][k-2]) +
							c1*(u1[i][j+1][k+1]-u1[i][j+1][k-1]) )*stry[j-1]*strx[i]
						+ mu[i][j+1][k]*met2[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u2[i][j+1][k+2]-u2[i][j+1][k-2]) +
							c1*(u2[i][j+1][k+1]-u2[i][j+1][k-1]) )
						+ ( mu[i][j-1][k]*met3[i][j-1][k]*met1[i][j-1][k]*(
								c2*(u1[i][j-1][k+2]-u1[i][j-1][k-2]) +
								c1*(u1[i][j-1][k+1]-u1[i][j-1][k-1]) )*stry[j]*strx[i]
							+ mu[i][j-1][k]*met2[i][j-1][k]*met1[i][j-1][k]*(
								c2*(u2[i][j-1][k+2]-u2[i][j-1][k-2]) +
								c1*(u2[i][j-1][k+1]-u2[i][j-1][k-1]) ) ) );

			r1[i][j][k] +=
				c2*(  mu[i][j+2][k]*met1[i][j+2][k]*met1[i][j+2][k]*(
							c2*(u2[i+2][j+2][k]-u2[i-2][j+2][k]) +
							c1*(u2[i+1][j+2][k]-u2[i-1][j+2][k])    )
						+  mu[i][j-2][k]*met1[i][j-2][k]*met1[i][j-2][k]*(
							c2*(u2[i+2][j-2][k]-u2[i-2][j-2][k])+
							c1*(u2[i+1][j-2][k]-u2[i-1][j-2][k])     )
				   ) +
				c1*(  mu[i][j+1][k]*met1[i][j+1][k]*met1[i][j+1][k]*(
							c2*(u2[i+2][j+1][k]-u2[i-2][j+1][k]) +
							c1*(u2[i+1][j+1][k]-u2[i-1][j+1][k])  )
						+ mu[i][j-1][k]*met1[i][j-1][k]*met1[i][j-1][k]*(
							c2*(u2[i+2][j-1][k]-u2[i-2][j-1][k]) +
							c1*(u2[i+1][j-1][k]-u2[i-1][j-1][k])))
				+
				c2*(  la[i+2][j][k]*met1[i+2][j][k]*met1[i+2][j][k]*(
							c2*(u2[i+2][j+2][k]-u2[i+2][j-2][k]) +
							c1*(u2[i+2][j+1][k]-u2[i+2][j-1][k])    )
						+ la[i-2][j][k]*met1[i-2][j][k]*met1[i-2][j][k]*(
							c2*(u2[i-2][j+2][k]-u2[i-2][j-2][k])+
							c1*(u2[i-2][j+1][k]-u2[i-2][j-1][k])     )
				   ) +
				c1*(  la[i+1][j][k]*met1[i+1][j][k]*met1[i+1][j][k]*(
							c2*(u2[i+1][j+2][k]-u2[i+1][j-2][k]) +
							c1*(u2[i+1][j+1][k]-u2[i+1][j-1][k])  )
						+ la[i-1][j][k]*met1[i-1][j][k]*met1[i-1][j][k]*(
							c2*(u2[i-1][j+2][k]-u2[i-1][j-2][k]) +
							c1*(u2[i-1][j+1][k]-u2[i-1][j-1][k])));

		} 
	}
}

extern "C" void host_code (double *h_r1, double *h_u1, double *h_u2, double *h_u3,  double *h_mu, double *h_la, double *h_met1, double *h_met2, double *h_met3, double *h_met4, double *h_strx, double *h_stry, double c1, double c2, int N) {
	double *r1;
	cudaMalloc (&r1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for r1\n");
	cudaMemcpy (r1, h_r1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u1;
	cudaMalloc (&u1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u1\n");
	cudaMemcpy (u1, h_u1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u2;
	cudaMalloc (&u2, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u2\n");
	cudaMemcpy (u2, h_u2, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *u3;
	cudaMalloc (&u3, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for u3\n");
	cudaMemcpy (u3, h_u3, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *mu;
	cudaMalloc (&mu, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for mu\n");
	cudaMemcpy (mu, h_mu, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *la;
	cudaMalloc (&la, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for la\n");
	cudaMemcpy (la, h_la, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met1;
	cudaMalloc (&met1, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met1\n");
	cudaMemcpy (met1, h_met1, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met2;
	cudaMalloc (&met2, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met2\n");
	cudaMemcpy (met2, h_met2, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met3;
	cudaMalloc (&met3, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met3\n");
	cudaMemcpy (met3, h_met3, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *met4;
	cudaMalloc (&met4, sizeof(double)*N*N*N);
	check_error ("Failed to allocate device memory for met4\n");
	cudaMemcpy (met4, h_met4, sizeof(double)*N*N*N, cudaMemcpyHostToDevice);
	double *strx;
	cudaMalloc (&strx, sizeof(double)*N);
	check_error ("Failed to allocate device memory for strx\n");
	cudaMemcpy (strx, h_strx, sizeof(double)*N, cudaMemcpyHostToDevice);
	double *stry;
	cudaMalloc (&stry, sizeof(double)*N);
	check_error ("Failed to allocate device memory for stry\n");
	cudaMemcpy (stry, h_stry, sizeof(double)*N, cudaMemcpyHostToDevice);

	dim3 blockconfig (16, 8);
	dim3 gridconfig (ceil(N, blockconfig.x), ceil(N, blockconfig.y), 1);

	curvi <<<gridconfig, blockconfig>>> (r1, u1, u2, u3, mu, la, met1, met2, met3, met4, strx, stry, c1, c2, N);
	cudaMemcpy (h_r1, r1, sizeof(double)*N*N*N, cudaMemcpyDeviceToHost);
}
