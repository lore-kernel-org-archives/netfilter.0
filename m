From: Rakotomandimby Mihamina <mrakotom@free.fr>
Subject: Strange outgoing packet ...
Date: Fri, 16 Jan 2004 10:15:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401161015.41975.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi all,
Im' running 2.4.24 and iptables 1.2.9 on slackware .

I made these rules on my single box connected to internet via the ppp0 
interface ( i only show OUTPUT related entries )

iptables -P OUTPUT DROP
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
#To allow me surfing :
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
# My ISP DNS :
iptables -A OUTPUT -d 193.252.19.4 -p ALL -j ACCEPT ;
iptables -A OUTPUT -d 193.252.19.3 -p ALL -j ACCEPT ;
iptables -A OUTPUT -d 80.10.246.1 -p ALL -j ACCEPT
iptables -A OUTPUT -d 80.10.246.132 -p ALL -j ACCEPT
#Logging everything else :
iptables -A OUTPUT -j LOG --log-level info --log-prefix "dropped_output_: "

and i get many lines like this in my log file :

Jan 16 06:54:40 milina kernel: dropped_output_: IN= OUT=ppp0 SRC=81.248.95.208 
DST=81.56.193.129 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP 
SPT=39332 DPT=113 WINDOW=18276 RES=0x00 SYN URGP=0

What would be this stuff on 113 port ??

Though when i sleep ( i kill X by switching to runlevel 3 , so there is 
neither "messenger" nor any stuff that should be connected but my web server 
and FTP server ... ) , it logs that .

Would you hel me ?
-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina


