From: Juan Hernandez <alucard@kanux.com>
Subject: RE: any suggestions
Date: 28 Nov 2003 13:15:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070039753.1086.45.camel@webmail.aeropostal.com.ve>
References: <7A3B4AA360FDEF448F3390421FC8D731012C5C0C@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731012C5C0C@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com, Lista de netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-11-28 at 13:08, bmcdowell@coxhealthplans.com wrote:
> Aside from telnet, is the smtp still working for local clients?  As in, not nat'ed, but directly connected and targetted at 192.168.0.2?
> 

Yes, working perfectly... look, ill do it from the machine itself


[root@webmail root]# telnet 192.168.0.2 25
Trying 192.168.0.2...
Connected to 192.168.0.2.
Escape character is '^]'.
220 mail.aeropostal.com.ve ESMTP

and this is the whole script... take a look, it's weird because I have
checked many many times


[root@webmail root]# more rc.firewall
#!/bin/sh

#Limpiar todo 
#Clean everything
IPTABLES="/sbin/iptables"
$IPTABLES -P INPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P OUTPUT ACCEPT
$IPTABLES -t mangle -P PREROUTING ACCEPT
$IPTABLES -t mangle -P OUTPUT ACCEPT
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F
$IPTABLES -X
$IPTABLES -t nat -X
$IPTABLES -t mangle -X

#Reglas de firewall
#Firewall rules 
echo 0 > /proc/sys/net/ipv4/ip_forward

$IPTABLES -P FORWARD DROP
$IPTABLES -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A FORWARD -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp --dport 25
-j DNAT --to-destination 192.168.0.2:25

#Recien anadida por la lista de correo pero funcionaba sin esto

#Just added from mailing list but used to work before without this
$IPTABLES -t nat -A POSTROUTING -s 192.168.0.2 -p tcp --sport 25 -j SNAT
--to-source 192.168.0.1
echo 1 > /proc/sys/net/ipv4/ip_forward


Thank you...



-- 
Juan Hernandez
>Slacker til' death do us apart
If it seems slow it's just because there are too many things loaded...
and of course, it's not slack



