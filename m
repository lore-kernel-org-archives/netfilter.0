From: Filippo Nicolussi <Filippo.Nicolussi@ilgtravel.com>
Subject: - no subject -
Date: Mon, 27 Mar 2006 17:46:55 +0200 (CEST)
Message-ID: <4609835.1143474415826.SLOX.WebMail.wwwrun@exchange.ilgtravel.com>
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
Content-Type: text/plain; charset="us-ascii"
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


