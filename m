From: "Peter Marshall" <peter.marshall@caris.com>
Subject: ipsec troubles
Date: Fri, 15 Oct 2004 15:00:03 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <0f2001c4b2e0$cbd8fbb0$49caa8c0@caris.priv>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi everyone.  I have two firewalls, internal and external.  I have a vpn
server in the middle on a routeable internet IP address.  The remote vpn
server is a rh9 linux box.  When I make the local one a rh9 box, everything
is great, however when the local one is an openbsd box, I get the following
error in my firewall logs on my internal firewall.  Does anyone know what it
means.

Note: E.F.G.33 is a routeable internet IP address

Oct 15 14:53:43 radium kernel: FORWARD REJECT IN=eth1 OUT=eth0
SRC=E.F.G.33 DST=192.168.201.22 LEN=56 TOS=0x00 PREC=0x00 TTL=254
ID=25774 PROTO=ICMP TYPE=3 CODE=4 [SRC=192.168.201.22 DST=10.0.0.2 LEN=1500
TOS=0x00 PREC=0x00 TTL=126 ID=18062 DF PROTO=TCP INCOMPLETE [8 bytes] ]
MTU=1444


Thanks,
Peter


