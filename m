From: "Allan Gee" <allang@equation.co.za>
Subject: source/destination IP's reversed
Date: Mon, 12 Jan 2004 18:41:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <028001c3d92a$fe821e60$96c00fc4@Allang>
Reply-To: <allang@equation.co.za>
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

Hi there,
	I have a slight problem with the following scenario:
I am running the 2.4.18-10brnf0.0.7 kernel and using the box as a
bridge/traffic shaper.
I have used pom CONNMARK and string match patches to shape kazaa and e-mail
traffic.
eth1 is my out-going interface so the script below should have my single IP
address as the destination IP and not the source.
The problem is that it only detects the string matches if I reverse the
address i.e. put the destination IP as the source IP.
if I do it the right way no traffic gets marked. I wonder if there is a bug
somewhere?
I use iptables 1.2.9 and patch-o-matic 20030912

/sbin/iptables -t mangle -A PREROUTING -i eth1 -p tcp -j
CONNMARK --restore-mark
/sbin/iptables -t mangle -A PREROUTING -i eth1 -p tcp -m mark ! --mark 0 -j
ACCEPT
/sbin/iptables -t mangle -A PREROUTING -p tcp -i eth1 -s
xxx.xxx.xxx.xxx/32 -d 0/0 -m string --string 'Kazaa' -j MARK --se
/sbin/iptables -t mangle -A PREROUTING -p tcp -i eth1 -s
xxx.xxx.xxx.xxx/32 -d 0/0 -m string --string 'allang@equation.co.
/sbin/iptables -t mangle -A PREROUTING -i eth1 -p tcp -j
CONNMARK --save-mark
/sbin/iptables -t mangle -A FORWARD -p tcp -i eth1 -s xxx.xxx.xxx.xxx/32 -d
0/0 -m mark --mark 1 -j ACCEPT
/sbin/iptables -t mangle -A FORWARD -p tcp -i eth1 -s xxx.xxx.xxx.xxx/32 -d
0/0 -m mark --mark 2 -j ACCEPT

Regards Allan Gee
Phone: +27214181777
www.equation.co.za


