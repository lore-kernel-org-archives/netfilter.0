From: Juan Hernandez <alucard@kanux.com>
Subject: any sugestions
Date: 28 Nov 2003 12:01:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070034917.1170.15.camel@webmail.aeropostal.com.ve>
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
To: Lista de netfilter <netfilter@lists.netfilter.org>

Im using this in a webserver that must redirect everything to
192.168.0.2 in port 25... any suggestions? using this script will enable
to accept connections in port 80 and forward all the port 25 to the
other server?? am I missing something or could it be improved?? 

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -d 192.168.0.2 -p tcp --dport 25 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -d 192.168.0.1 -p tcp --dport 25
-j DNAT --to-destination 192.168.0.2:25
echo 1 > /proc/sys/net/ipv4/ip_forward

Thanx a lot 


-- 
Juan Hernandez
>Slacker til' death do us apart
If it seems slow it's just because there are too many things loaded...
and of course, it's not slack



