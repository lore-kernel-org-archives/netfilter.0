From: Milos Wimmer <wimmer@zcu.cz>
Subject: problem with active ftp masqarading in kernel 2.6.11
Date: Mon, 14 Mar 2005 17:48:36 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503141748000.5167@nike.zcu.cz>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


  Hello,

I found problem with active ftp masqarading in kernel 2.6.11.
I use linux firewall with masquarading for the local network.
When I run ftp client in active mode on any machines in the local network,
I can connect to remote ftp server in outside network (Internet). But
when I get "mget *" command in this ftp session, client downloads about
5 files only and then writes "500 R not understood" and then
"ftp: bind: Address already in use" and it stops.
I tried capture some packets and it looks firewall leaves off masqurading for 
this sessin.
When I switch ftp client to "passive" mode, all works fine.
When I run kernel 2.6.9 (and previous) on the firewall, all works fine (both 
active and passive mode).

I tried it on miscellaneous firewalls (with 2.6.11 kernel), miscellaneous ftp 
servers and miscellaneous ftp clients (in active mode) with same results. I 
tried both iptables-1.3.1 and iptables-1.3.0 without success.

Regards,
               Milos Wimmer

