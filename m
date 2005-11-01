From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Ping flood
Date: Tue, 01 Nov 2005 16:30:21 +0200
Message-ID: <43677BFD.3080805@darkstar.nom.za>
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
To: netfilter <netfilter@lists.netfilter.org>

I have the following log:
Nov  1 09:10:40 guardian ---SA_IN--- IN=eth1 OUT= 
MAC=ff:ff:ff:ff:ff:ff:00:e0:1e:83:d5:19:08:00  SRC=64.34.170.237 
DST=255.255.255.255 LEN=1072 TOS=00 PREC=0x40 TTL=243 ID=12209 DF 
PROTO=ICMP TYPE=8 CODE=0 ID=0 SEQ=0

I am receiving thousands of these a day, icmp traffic is blocked with 
iptables. But still this traffic is coming up the line. Is my only 
solution to contact the ISP or is there something I can do in 
iptables/linux?

Paulo

