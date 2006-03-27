From: Support <support@ilgtravel.com>
Subject: iproute multiple isp balancing
Date: Mon, 27 Mar 2006 17:41:16 +0200
Message-ID: <4428079C.4000601@ilgtravel.com>
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

isp1 : eth2 with 4 static ip
isp2: eth3 with 4 static ip

i readed documentation about Advanced ip routing with iproute2 at 
http://lartc.org/howto/lartc.rpdb.multiple-links.html

i find the script mpath2 on site http://www.ssi.bg/~ja/tmp/mpath2.sh

have i to add one line type off command
ip route add $P2_NET dev $IF2 src $IP2 table T2
for every pubblic ip assained by my isp to the relative table

eth2  = 1 ip address assigned
eth2:0 = 2 ip address assigned
etc.

and eth1 similar

-- 
Support - Network Operating Center

International Leisure Group
Internet Address: www.ilgtravel.com
Head Office 38062 Arco -TN
tel +39 0464 588 807

Ai sensi della legge 196/03 si precisa che le informazioni contenute in questo messaggio sono riservate e ad uso esclusivo del destinatario. Qualora il messaggio le fosse pervenuto per errore, la preghiamo di eliminarlo senza copiarlo e di non inoltrarlo a terzi, dandocene gentilmente comunicazione. Grazie.

This message may contain confidential information, and, therefore is subject to Law 196/03. If you are not the addressee or authorized to receive this message, you must not use, copy, disclose or take any action based on any information herein. If you have received this message in error, please advise the sender immediately and delete this message. Thank you for your cooperation



