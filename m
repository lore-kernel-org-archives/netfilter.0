From: "Leonardo A. de Camargo" <leonardo@openware.com.br>
Subject: RES: NAT, SNAT, FORWARD, what i use ?
Date: Thu, 31 Oct 2002 14:38:57 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NGBBLIMDELLHLIKGLDNNKEECCBAA.leonardo@openware.com.br>
References: <NGBBLIMDELLHLIKGLDNNMEEBCBAA.leonardo@openware.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <NGBBLIMDELLHLIKGLDNNMEEBCBAA.leonardo@openware.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

Plus,

the modules loaded are :

Module                  Size  Used by    Not tainted
fealnx                 10536   1  (autoclean)
mii                     1088   0  (autoclean) [fealnx]
sis900                 11908   1  (autoclean)
ipt_state                608   3  (autoclean)
ipt_LOG                 3104   2  (autoclean)
ip_nat_ftp              2912   0  (unused)
iptable_nat            12756   2  [ip_nat_ftp]
ip_conntrack_ftp        3168   0  (unused)
ip_conntrack           12780   3  [ipt_state ip_nat_ftp iptable_nat
ip_conntrack_ftp]
iptable_filter          1728   1
ip_tables              10304   6  [ipt_state ipt_LOG iptable_nat
iptable_filter]
supermount             57476   2  (autoclean)
lvm-mod                44224   0
usb-ohci               17856   0  (unused)
usbcore                48320   1  [usb-ohci]
ext3                   59680   1
jbd                    42804   1  [ext3]

-----Mensagem original-----
De: Leonardo A. de Camargo [mailto:leonardo@openware.com.br]
Enviada em: Quinta-feira, 31 de Outubro de 2002 14:32
Para: Antony Stone; netfilter@lists.netfilter.org
Assunto: RES: NAT, SNAT, FORWARD, what i use ?


>> I have machines xxx.zzz.yyy.www (conected to internet, via eth0) and a
>> 196.10.10.1
>Just out of interest, where did you get that IP address from ?

Just some IP from my mind, it is internal, just used between those two
machines=B4s eth1.


>iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to
>196.10.10.1
>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A FORWARD -p tcp --dport 80 -d 196.10.10.1 -j ACCEPT
>This will allow you to contact your internal web server using a browser on
>the Internet, by contacting xxx.zzz.yyy.www

Actually it didnt work, i set up info loggin and nothing were being logged
in port 80.
I dropped all my rules and set up ACCEPT policy on all chains, nothin
happened too.


>I would tell you how to do the same thing for telnet, but I think you
should
>be using SSH instead :-)   Maybe you can work it out from the rules above
>anyway though...

i know ssh is safer, thats just for experimental purpose, im very new with
iptables.

I=B4ll put my lil script to set this up, it runs in xxx.zzz.yyy.www=B4s rc.=
local
:

echo "1" > /proc/sys/net/ipv4/ip_forward	# This goes in 196.10.10.1 too
iptables -F
iptables -F -t mangle
iptables -F -t nat
iptables -P OUTPUT DROP
iptables -P INPUT DROP
iptables -P FORWARD  DROP
service inet stop
service inet start
iptables -A INPUT -j LOG --log-level info --log-prefix FIREWALL:
iptables -A OUTPUT -j LOG --log-level info --log-prefix FIREWALL:
iptables -t NAT -A PREROUTING -j LOG --log-level info --log-prefix FIREWALL:
iptables -A INPUT -p tcp -m tcp --dport 23 -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp -m tcp --dport 1024:65535 -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
ifconfig eth1 down
ifconfig eth1 196.10.10.2
ifconfig eth1 up
iptables -A INPUT -j DROP -s 196.10.10.0/24 -i ! eth1
iptables -A INPUT -j DROP -s ! 196.10.10.0/24 -i eth1
iptables -A INPUT -j DROP -d 196.10.10.255
iptables -A INPUT -j DROP -d xxx.zzz.yyy.255
iptables -A INPUT -j DROP -d 255.255.255.255
iptables -A OUTPUT -j DROP -d 196.10.10.255
iptables -A OUTPUT -j DROP -d xxx.zzz.yyy.255
iptables -A OUTPUT -j DROP -d 255.255.255.255
iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED
iptables -A FORWARD -j ACCEPT -m state --state RELATED
iptables -A OUTPUT -p tcp -m tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -p udp -m tcp --dport 53 -j ACCEPT
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to
196.10.10.1
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -d 196.10.10.1 -j ACCEPT


