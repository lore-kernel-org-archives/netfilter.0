From: "Timothy J. Miller" <tj.miller@javaspotlet.com>
Subject: DHCP Help
Date: Sun, 14 Sep 2003 07:46:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <767f9555.9555767f@idirliontech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

Hoping that someone can help me with my problem. I have a small lan segemented across two families of ip's on a quad card.

eth0 ->  Public IP
eth2 -> 10.2.3.1 -> internal DHCP for laptops
eth3 -> 10.2.1.1 -> internal static ips for servers

My problem is that my users sometimes must perform an ipconfig /renew on their laptops to get access to the outside world.  My rules at this time are not very explicit but I am trying to change that and I can't seem to figure out what the heck is going on.  My rules look like:

ipables -A INPUT -i $DHCP_INTERFACE -s 0.0.0.0 -d 255.255.255.255 \
        -p udp --sport 68 --dport 67 -j ACCEPT

iptables -A INPUT -i $DHCP_INTERFACE -s $DMZ \
        -d $DMZ -p udp --sport 68 --dport 67 -j ACCEPT

iptables -A INPUT -i $DMZ_INTERFACE -s $DMZ -d 10.2.1.1 -j ACCEPT

One last note, eth2 and eth3 are connected to a switch and I am not sure if that is going to effect this or not but thought that it may be relevent in solving my issues.

Any help or direction anyone can give is greatly appreciated.

- Tim


