From: "louie miranda" <lmiranda@chikka.com>
Subject: Forwarding problem, :( port redirection!
Date: Mon, 24 Feb 2003 16:12:51 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <045a01c2dbdc$8964ae00$0b00000a@nocpc3>
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
To: netfilter@lists.samba.org

Im trying just to forward simple ftp, 21 request into my internal machine.
Im typing this but it does not work..

any ideas?


iptables -t nat -A PREROUTING -i eth0 -p tcp -d 10.0.0.11 --dport 21 -j
DNAT --to 203.190.72.108:21
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 203.190.72.108 --dport 21 -j
ACCEPT


eth0: Internet
eth1: LAN


Doc: http://www.knowplace.org/netfilter/syntax.html#conf6
================================
Destination NAT the packets (changes the destination IP address in the IP
header and port number in the TCP/UDP header)
    iptables -t nat -A PREROUTING -i eth0 -p protocol -d
ip_address_of_eth0 --dport original_port_number -j DNAT --to
destination_ip_address:destination_port_number
Forward the natted packets (allow the natted packet to be forwarded)
    iptables -A FORWARD -i eth0 -o eth1 -p protocol -d
destination_ip_address --dport destination_port_number -j ACCEPT
================================









--
thanks,
louie miranda



