From: <oarojo@intermediacorp.com>
Subject: portforwarding-HOWTO
Date: Mon, 6 Jan 2003 14:50:37 +0800 (PHT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2132.192.168.0.1.1041835837.squirrel@mail.intermediacorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello people!!!

I have set-up a linux box firewall with two ethernet cards; eth0 facing the
internet and eth1 facing the internal network. Inside my network is my mail
server with an IP of 192.168.0.5. Now since my ISP had only given me one
valid IP address for my network, I wish to do port-forwarding for ports 25
and 110. I did something like:

# iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx --dport 25
-j DNAT --to 192.168.0.5:25

# iptables -t nat -A PREROUTING -p tcp -i eth0 -d xxx.xxx.xxx.xxx --dport
110 -j DNAT --to 192.168.0.5:110

# iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 25 -j ACCEPT
# iptables -A FORWARD -p tcp -i eth0 -d 192.168.0.5 --dport 110 -j ACCEPT

# iptables-save > /etc/sysconfig/iptables


When i used nmap to determine if ports 25 and 110 are open, it says:

25/tcp     filtered    smtp
110/tcp    filtered    pop-3

and when i try telnetting its valid ip

#telnet xxx.xxx.xxx.xxx 25


it says "trying...." and can't connect at all...

How's this? Did I missed something here? Please Help!!!


Oliver





