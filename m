From: Jon Ferguson <ferguson@omegasoftware.co.uk>
Subject: Help for IP Masquerading and Win2k
Date: 19 May 2003 13:22:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053350526.25406.28.camel@Enterprise>
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

I'm a newbie to iptables and am on RH8.0.

Perhaps someone can set me strait on my setup.

(I've reviewed the 14 May thread Help for IP Masquerading, and followed
the tutorial at
www.yolinux.com/TUTORIALS/LinuxTutorialNetworkGateway.html but am still
having probs.)

I have an RH8.0 box as my gateway, behind which I have a local net with
a Win2k box. I'm using a dialup connection and have setup static ips on
my internal network: 192.168.0.1 for the gateway box, 192.168.0.2 for
the win2k box.  I've also setup Squid.

I've run the script in the www.yolinux.com tutorial:

iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

iptables --table nat --append POSTROUTING --out-interface ppp0 -j
MASQUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

What I find is that if I set up my browser to use the SQUID proxy server
I can get through no problem and browse the net.

However since I'm doing IP Masquerading shouldn't I be able to see the
internet if I turn off the Use of a proxy server as well?

I have setup the Local Area Connection properties for TCP/IP in Win2K:
Ip address: 192.168.0.2
Subnet mask: 255.255.255.0
default gateway: 192.168.0.1 (my RH8.0 box)

Preferred DNS server: 213.1.119.97 (my ISP)
alt.: 213.1.119.98

Can anyone see what I'm missing????

The reason I'm doing all this is so that I can use a windows VPN Client
to connect through the network to a VPN server somewhere else off in
hyperspace. But for now I'm just testing using a IE.

Thanks for all your help.

Jon




