From: "Johan Seibel" <johan.seibel@gmx.de>
Subject: Prerouting to broadcast (or directed-broadcast)
Date: Fri, 4 Jun 2004 00:28:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c449ba$1796a5b0$0301a8c0@Seibel1>
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

hello,

I have a problem with my router. I want to wake up Computers in my LAN from
the Internet and therefore I have to make the router send a
broadcast-message to all computers in the LAN. Ofcourse the router has a
Linux operating system and works with iptables v1.2.8
Well, I have already tried something: I thought that it would be possible to
send a magic packet from the Internet to a special port e.g. port 2222 and
the router changes the destination address to a local broadcast address (I
have a lan with 192.168.1.1/255.255.255.0)
The rule I tried is:
    iptables -t nat -I PREROUTING -p udp -i ppp0 --dport 2222 -j
DNAT --to-destination 192.168.1.255
When I send a magic packet to this address the packet goes to this rule and
the I guess the destination address is corrected. But the router does not
send the packet to the local LAN, but it is lost somehow. I added another
rule
    iptables -t nat -I POSTROUTING -p udp --dport 2222
but the packet never reaches this rule.
Another experiment was to send the magic packet from a local linux box and
adding the following rule to the iptables of that computer:
    iptables -t nat -I OUTPUT -p udp --dport 2222 -j DNAT --to-destination
192.168.1.255
When I send a magic packet to the address 192.168.1.100 the destination
address is corrected and my computer wakes up.

So, why doesn't this work in the PREROUTING chain???
Or is there perhaps another solution for my problem?

(My router has no function where I can enable directed broadcast (like the
Cisco-routers have) and I do not know how this works.)

Any explanations or solutions are very welcome, please help me!
Thanks in advise
Johan


