From: "=?koi8-r?B?98zBxMnNydIg8M/UwdDP1w==?=" <varyag18@mail.ru>
Subject: Problems with DNS
Date: Fri, 5 Sep 2003 21:47:01 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEKJPOHJKKBIDHGBCMDOEGHCAAA.varyag18@mail.ru>
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

I have some problems with DNS and iptables.

  ------------      ETH1 ----------------------------- ETH0    ----------
 | DNS SERVER|-----------| Packet filter with iptables|--------|Internet|
  ------------           ------------------------------        ----------
This is my rules for forwarding dns packets from eth0 to eth1 and from eth1
to eth0 :
121.1.1.1 - eth0 routable IP.
192.168.5.2 - DNS_DMZ IP.
192.168.5.0/255.255.255.0 -DMZ subnet.
-A PREROUTING -d 121.1.1.1 -i eth0 -p tcp -j DNAT --to-destination
192.168.5.2
-A PREROUTING -d 121.1.1.1 -i eth0 -p udp -j DNAT --to-destination
192.168.5.2
-A POSTROUTING -o eth0 -j SNAT --to-source 121.1.1.1
-A FORWARD -d 192.168.5.0/255.255.255.0 -i eth0 -o eth1 -p tcp -m
tcp --dport 53 -j allow
-A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -p tcp -m
state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -d 192.168.5.0/255.255.255.0 -i eth0 -o eth1 -p udp -m
udp --dport 53 -j ACCEPT
-A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -p tcp -m
tcp --dport 53 -j allow
-A FORWARD -s 192.168.5.0/255.255.255.0 -i eth1 -o eth0 -p udp -m
udp --dport 53 -j ACCEPT
-A allow -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j ACCEPT
-A allow -p tcp -m tcp -m state --state RELATED,ESTABLISHED -j ACCEPT
-A allow -p tcp -j LOG
-A allow -p tcp -j DROP

Problem:
My packet filter couldn't forward dns udp query to the internet and from
internet to local .What I'm doing wrong ?

-----
With best regards,
    Potapov Vladimir.


