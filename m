From: "Jon Wyatt" <samur2@hotmail.com>
Subject: ACK packets being dropped from yahoo
Date: Sun, 15 Dec 2002 14:50:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F3EgmgEaIj38y8iUSmR0000d53d@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have set up a firewall/gateway to handle all internet requests. 
Everything's looking great and I'm surfing the web quite happily from my 
Linux box. Then I try to run a search from yahoo (www.yahoo.com) and hit 
problems. Once I've entered a search string and hit the search button the 
browser just sits there an eventually times out.

It appears that yahoo is sending an ACK which I'm blocking (because it's not 
part of an initialisation), unless I've misunderstood the communication 
process.

Here's the rules where I set them:-
$IPTABLES -N bad_tcp_packets
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
--log-prefix "New not syn:"
$IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP



And here's the message I get when yahoo attempts to send the ACK.

New not syn:IN=ppp0 OUT= MAC= SRC=212.158.*.* DST=217.135.*.* LEN=52 
TOS=0x00 PREC=0x00 TTL=63 ID=27155 PROTO=TCP SPT=80 DPT=32782 WINDOW=8760 
RES=0x00 ACK RST URGP=0

What's going on there then?

Thanks.

jon.


Better than having your body rubbed vigorously with a cheese grater.
http://www.samuri.co.uk.


_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail


