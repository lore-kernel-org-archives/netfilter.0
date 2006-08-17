From: Marcelo Salavee Lemos <marcelo@fm.usp.br>
Subject: problem module psd with kernel-2.6.17.7
Date: Thu, 17 Aug 2006 15:44:42 -0300
Message-ID: <44E4B91A.8080905@fm.usp.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I migrate my kernel 2.6.16.22 for 2.6.17.7 and i recompile my 
iptables-1.3.5-20060816 with patch-o-matic-ng aplying module psd.
When i execute:

iptables -A INPUT -m psd -j DROP


I have in dmesg:

ip_conntrack version 2.4 (7168 buckets, 57344 max) - 236 bytes per conntrack
ip_tables: (C) 2000-2006 Netfilter Core Team
netfilter PSD loaded - (c) astaro AG
ip_tables: psd match: invalid size 0 != 12


lsmod:

Module                  Size  Used by
ipt_layer7             12472  50
xt_multiport            4103  4
ipt_psd                44691  0
ipt_TOS                 2776  20
ipt_LOG                 7240  50
xt_state                2761  3
xt_tcpudp               4009  80
xt_limit                3129  3
iptable_mangle          3190  1
iptable_filter          3295  1
ip_nat_h323             6475  0
ip_conntrack_h323      49758  1 ip_nat_h323
ip_nat_ftp              3789  0
ip_conntrack_ftp        7470  1 ip_nat_ftp
iptable_nat             7935  1
ip_nat                 16165  3 ip_nat_h323,ip_nat_ftp,iptable_nat
ip_tables              13472  3 iptable_mangle,iptable_filter,iptable_nat
ip_conntrack           47936  7 
xt_state,ip_nat_h323,ip_conntrack_h323,ip_nat_ftp,ip_conntrack_ftp,iptable_nat,ip_nat
nfnetlink               6131  2 ip_nat,ip_conntrack
x_tables               12774  10 
ipt_layer7,xt_multiport,ipt_psd,ipt_TOS,ipt_LOG,xt_state,xt_tcpudp,xt_limit,iptable_nat,ip_tables
intel_agp              21240  1
shpchp                 36776  0
i8xx_tco                6711  0
i2c_i801                8646  0
i2c_core               17886  1 i2c_i801
skge                   35045  0
sk98lin               164242  0


When i use iptables-1.3.5 the error is:

Unknown error 4294967295


Anybody help me?


Tks
Marcelo

---------------------------------------------------------------------
Esta mensagem pode conter informacao confidencial.
Se voce nao for o destinatario ou a pessoa autorizada a receber
esta mensagem, nao podera usar, copiar ou divulgar as informacoes nela
contidas ou tomar qualquer acao baseada nessas informacoes. Se
voce recebeu esta mensagem por engano, favor avisar imediatamente o
remetente, respondendo o e-mail e, em seguida, apague-o.
Agradecemos sua cooperacao.

This message may contain confidential information.
If you are not the addressee or authorized person to receive it for the
addressee, you must not use, copy, disclose or take any action based on
this message or any information herein. If you have received this message
in error, please advise the sender immediately by replying this e-mail 
message and delete it.
Thanks in advance for your cooperation.
----------------------------------------------------------------------
                  Faculdade de Medicina USP
----------------------------------------------------------------------


