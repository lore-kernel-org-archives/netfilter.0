From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: Port-forwarding Perfomance
Date: Wed, 23 Feb 2005 15:56:43 -0500
Message-ID: <1e8701c519ea$2e05a250$b000a8c0@cybergeneration.com>
References: <421D2F04.8090100@wildcash.com><1109156169.11713.2.camel@nostromo.bgsecm.com>
	<421DE4AF.6040702@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"
To: Rudi Starcevic <tech@wildcash.com>, netfilter@lists.netfilter.org


Hello Rudi

Here is my stats :

firewall (x.x.x.x) :
  pentium 133 MHz
  48 megs of RAM
  20 gigs HD

another linux behind (192.168.56.2) :
   pentium celeron 433
   64 megs ram
   80 gigs hd

3 other windows friends behind, average of 600
concurrent connections (caused by p2p)

got a 100 mbits LAN, i can download via FTP
at about 83 mbits from 192.168.56.2.

Via samba I get 70-75 mbits

FTP is nated via the 1rst firewall on a dsl link
which is 3 mbits down and 1 mbit up.

I can download at maximum capacity of DSL
link, cpu load of both servers are below 10%.

I didnt tried a local NAT on 100 mbits link,
if I have time I'll do it and let you know of results.

HTH

Maxime Ducharme
Programmeur / Spécialiste en sécurité réseau

----- Original Message ----- 
From: "Rudi Starcevic" <tech@wildcash.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, February 24, 2005 9:29 AM
Subject: Re: Port-forwarding Perfomance


Hi,

Still having trouble with port-forwarding performance.

As much as I look I can't find anything wrong.

I have one Linux 66.283.12.21 box and one Windows box 192.168.0.10

I can download a file of the linux box at around 140K/s

That very same file on the Windows machine is around 15K/s using DNAT
and Masq/Forwarding.

I'm very disappointed and did not expect to see anything like this, I
had more like 10% in mind ...

The linux box is not under heavy load and there is only 431 connections
being tracked.

Hmm .. I must have a problem else where, it just too hard to believe
those download rate numbers.


Jose Maria Lopez Hernandez wrote:

>El mié, 23-02-2005 a las 17:33 -0800, Rudi Starcevic escribió:
>
>
>>Hi,
>>
>>I have www port-forwarding setup and running OK.
>>
>>However I wonder if they way I have configured it is not the most
>>optimal for speed and performance.
>>
>>I have a default policy of DROP with a total of about 30 rules.
>>
>>These rules below do my www port-forwarding, can you see if there is a
>>better way to do this ?
>>
>># ENABLE FORWARDING / NAT / MASQUERADING
>>echo "1" > /proc/sys/net/ipv4/ip_forward
>>
>># NAT Forwarding Setup
>>$IPTABLES --table nat --append POSTROUTING --out-interface $ETH0 -j
>>MASQUERADE
>>
>>
>
>The only thing I can say about your rules it's that if you
>know the firewall IP it's much better to use SNAT than
>MASQUERADE, because you gain some speed with it.
>
>
>
>>$IPTABLES -A FORWARD -i $ETH1 -j ACCEPT
>>$IPTABLES -A FORWARD -i $ETH0 -j ACCEPT
>>$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>># http Port-Forwarding setup
>>$IPTABLES -t nat -A PREROUTING -i $ETH0 -p tcp --dport 80 -d $MEDIA1_IP
>>-j DNAT --to $MEDIA1_LO:80
>>
>>
>
>The rule it's OK, I don't know how you can do it better to achieve
>more speed.
>
>
>
>>Many thanks,
>>Kind regards
>>Rudi
>>
>>
>
>Regards.
>
>
>



-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


