From: andre.correa@pobox.com
Subject: sendto: No buffer space available
Date: Mon, 2 Dec 2002 11:16:45 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <571705138.20021202111645@pobox.com>
Reply-To: Andre Docena Correa <andre.docena@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hi list,

I  have  a  Linux  2.4.19  box  doing NAT, PPPoE, Traffic Shapping and
Firewalling.  It  is  a  2xPIII  733MHz with 512Mb RAM. Everything was
working  just  fine  until 5 or 6 days ago we started having some strange
behavior.

Under  moderate  traffic,  15  to  20  NAT users, we find that traffic
suddenly  stops  for 10 or 15 seconds and then comes back. During this
periods  I've  figured  out  that  if I ping my interfaces or Internet
addresses I get:

sendto: No buffer space available
ping: sent 64 octets to xxx.xxx.xxx.xxx, ret=-1

I've  made  lots  of  searchs  in  mailling lists, Internet and in the
kernel  source  but couldn't work on it.

Can you guys help me to solve this problem?

tks in advance for your help and attention.

Andre
andre.correa@pobox.com


