From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Should i be worried?
Date: Wed, 29 Jan 2003 02:17:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030129021717.6294a582.arnt@c2i.net>
References: <000c01c2c71c$bd541090$0200a8c0@whyzpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c2c71c$bd541090$0200a8c0@whyzpc>
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

On Tue, 28 Jan 2003 23:29:36 +0100, 
"Erik Ahlner" <whyz@home.se> wrote in message 
<000c01c2c71c$bd541090$0200a8c0@whyzpc>:

> Hello!
> 
> I just happened to do a dmesg, and got this output:
> 
> IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
> PREC=0x00 TTL=127 ID=14459 PROTO=UDP SPT=137 DPT=53 LEN=54
> IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
> PREC=0x00 TTL=127 ID=14715 PROTO=UDP SPT=137 DPT=53 LEN=54
> IN=eth0 OUT=eth0 SRC=192.168.0.88 DST=217.209.28.135 LEN=48 TOS=0x00
> PREC=0x00 TTL=127 ID=37469 DF PROTO=TCP SPT=2418 DPT=80 WINDOW=16384
> RES=0x00 SYN URGP=0
> 
> 
> As you can see, i get some message about traffic from 192.168.0.186
> and .88.. these two computers are NOT in my home network, so i guess
> that someone has named his computers like that on the university
> network, even though the university network has 130.236.x.x.
> Is this a problem for me?

..dunno, this box is yours?
[arnt@lana dropzone]$ dig -x 130.236.230.9

; <<>> DiG 9.2.1 <<>> -x 130.236.230.9
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 59666
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 0

;; QUESTION SECTION:
;9.230.236.130.in-addr.arpa.    IN      PTR

;; ANSWER SECTION:
9.230.236.130.in-addr.arpa. 86400 IN    PTR     ns.student.liu.se.

;; AUTHORITY SECTION:
236.130.in-addr.arpa.   86400   IN      NS      sunic.sunet.se.
236.130.in-addr.arpa.   86400   IN      NS      ns.isy.liu.se.
236.130.in-addr.arpa.   86400   IN      NS      dns.liu.se.

;; Query time: 497 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Jan 29 02:01:08 2003
;; MSG SIZE  rcvd: 140

> And what does this output actually mean?
> Has someone used my computer as a router?
> If they have, how is that possible?

..'cat /proc/sys/net/ipv4/ip_forward' is "1"?

..if you _dont_ wanna route traffic:
'echo "0" > /proc/sys/net/ipv4/ip_forward'

> This is what my iptable looks like:
> 
> $IPTABLES -P INPUT ACCEPT
> $IPTABLES -F INPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F OUTPUT
> $IPTABLES -P FORWARD DROP
> $IPTABLES -F FORWARD
> $IPTABLES -t nat -F
> 
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG
> 
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> $IPTABLES -A INPUT -s 192.168.0.0/24 -i eth0 -j DROP
> 
> I thought that the last line was to stop this from happening..

..try $IPTABLES -A FORWARD -s 192.168.0.0/24 -i eth0 -j DROP
                  /\/\/\/\

..you also wanna drop wintendo ports 137 thru 139 or come up 
with a damned good excuse to pass on this wintendo traffic.
From your inside, you may want to REJECT instead of DROP, speedier,
if you wanna teach people a lesson, try TARPIT from Patch-o-matic.

> Or am i just stupid? Did dmesg just show me that some packets have
> been dropped?
> 
> Many thanks
> 
> Erik Ahlner


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


