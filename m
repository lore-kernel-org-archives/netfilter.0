From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: (no subject)
Date: Tue, 05 Jul 2005 14:13:39 +0200
Message-ID: <42CA7973.302@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi List

I seem to have a problem whereby if I type the following commonds, I get 
the following output


gate:~# netstat-nat
Proto NATed Address                  Foreign Address                State
gate:~#

or when I use conntrack-viewer.pl

gate:~# conntrack-viewer.pl
Active Connections according to /proc/net/ip_conntrack
Proto   Source Address           Remote Address           Service 
State       Masq  Name Resolution
Use of uninitialized value in getservbyport at 
/usr/sbin/conntrack-viewer.pl line 114.
Use of uninitialized value in getservbyport at 
/usr/sbin/conntrack-viewer.pl line 115.
Use of uninitialized value in length at /usr/sbin/conntrack-viewer.pl 
line 128.


if I use  iptstate (this seems to work)
                                                              IPTables - 
State Top
Version: 1.3          Sort: SrcIP           s to change sorting
Source                                                 Destination 
                                       Proto   State        TTL
192.168.111.10,1114                                    192.168.111.11,53 
                                      udp                    0:01:33
192.168.111.10,1118                                    192.168.111.11,53 
                                      udp                    0:01:06
192.168.111.11,51146 
213.133.106.29,35520                                   tcp 
ESTABLISHED   98:43:17

I had a brief look at the /dev/net/ip_conntrack, and all seems fine there.

If anyone has any tips or advice, it would be most appreciated.

Kind Regards
Brent Clark

