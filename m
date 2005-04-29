From: Michal Ludvig <michal@logix.cz>
Subject: FTP server behind NAT
Date: Fri, 29 Apr 2005 17:08:17 +1200
Message-ID: <4271C141.5050008@logix.cz>
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

Hi all,

I've got an FTP server sitting at 192.168.1.4 in the internal network
and am trying to set up the firewall (2.4.29) to allow access to it from
outside.

Basically my setup is
1) DNAT one of our static external addresses to the FTP server:
iptables -t nat -A PREROUTING -i pvc0 -d a.b.c.142 \
         -j DNAT --to 192.168.1.4

2) Allow port 21 & related to FTP server and drop everything else
iptables -A FORWARD -i pvc0 -o internal -j pvc0-internal
iptables -A pvc0-internal -d 192.168.1.4 -m state \
         --state NEW -p tcp --dport 21 -j ACCEPT
iptables -A pvc0-internal -m state --state ESTABLISHED,RELATED \
         -j ACCEPT
iptables -A pvc0-internal -j LOG
iptables -A pvc0-internal -j DROP

3) ip_conntrack_ftp is loaded

Now I can connect from outside to a.b.c.142 and authenticate to the FTP
server. But as soon as a new channel is to be opened (e.g. dir listing
or file download) the connection hangs.

In /proc/net/ip_conntrack there is a correct(?) entry:
EXPECTING: - use=1 proto=6 src=x.y.z.127 dst=192.168.1.4 \
           sport=0 dport=32985

However the packet from my client (x.y.z.127) is still logged and dropped:
IN=pvc0 OUT=internal SRC=x.y.z.127 DST=192.168.1.4 LEN=60 TOS=0x00
PREC=0x00 TTL=56 ID=15185 DF PROTO=TCP SPT=1557 DPT=32985 WINDOW=5840
RES=0x00 SYN URGP=0

It is really logged and dropped in this chain (added some
--log-prefix'es to verify).

Anyone has an idea what is wrong with my setup? Why isn't the packet
treated as RELATED and passed through?

Thanks in advance!

Michal Ludvig
-- 
* Personal homepage: http://www.logix.cz/michal

