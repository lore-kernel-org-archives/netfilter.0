From: llee@battalion.nexxis.net
Subject: FreeSWAN and NAT
Date: Tue, 4 Feb 2003 17:20:51 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302041713580.13477-100000@battalion.nexxis.net>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I wish to create a FreeSWAN VPN connection between two NAT boxes using 
iptables.  I have FreeSWAN configured correctly, but when I attempt to 
ping one internal machine from the other network, the packets get mangled 
by what I assume to be NAT.  Source Host sends out 4 icmp packets at 504 
bytes, and the Target Host receives 4 packets at 240 bytes.

The way I have the iptables scripts set up is on each box like this:

iptables -t nat -A POSTROUTING -o eth0 -s $IP_RANGE_A -d $IP_RANGE_B -j 
ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $INET_IP

the only difference being the swapping of the IP_RANGES depending upon 
which box it's on.  I am still getting the same results.  I am trying to 
get all VPN-ed packets to bypass the NAT statement, but it appears that my 
statement is not working.  Is there another way to get those VPN packets 
through without getting mangled?  

I appreciate any help in advance.

Thanks,
Lonlone


