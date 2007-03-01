From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Blocking direct private IP address
Date: Thu, 1 Mar 2007 08:30:56 +0100
Message-ID: <000001c75bd3$8d74af10$0b0ffe0a@NS006819>
References: <Pine.LNX.4.61.0703010449120.23355@yvahk01.tjqt.qr>
	<BAY119-F39A4E5F3A07FF3275AC4E0D6800@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F39A4E5F3A07FF3275AC4E0D6800@phx.gbl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> My focus here is really on how to differentiate traffic that
> gets DNATted from 10.0.0.1 to 192.168.0.99 from traffic that
> was actually directly addressed to 192.168.0.99. 

By matching destination-port for example.
If you match packets for 10.0.0.1:80 and forward it using
PREROUTING/DNAT to 192.168.0.99, *all* packets that match this criteria
are DNATed.
Packets sent to other ports are *not* DNATed, also, they are not sent to
the FORWARD chain but to the INPUT chain..

> In both cases, by the time the packet arrives in the filter
> table FORWARD chain, the destination is simply 192.168.0.99,
> there is no trace of the original pre-DNAT IP address, if
> any....at least, that is where I got stuck anyway.

I'm not clear on why you need that information, because...

> I hope that explains it a bit more clearly.
> 
> The approach I am playing with at the moment is to add a rule
> in the mangle table PREROUTING chain that marks any packets
> that show up from eth0 that are not addressed to 10.0.0.1.

If you match packets to port 80/tcp, other ports are *not* forwarded.

> Then, in the filter table FORWARD chain, I added rules to
> test for that mark and log and drop any packets that match.
> 
> I know I could simply put the logging and drop rules directly
> in the mangle table PREROUTING chain but, based on various
> guidelines for iptables I have read, I am trying to keep all
> filtering activities within the filter table.

I think that if you do something like this:

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -d 192.168.0.99 \
  -p tcp --dport 80 -j ACCEPT
$ipt -t nat -A PREROUTING -i eth0 -d 10.0.0.1 \
  -p tcp --dport 80 -j DNAT 192.168.0.99

it'll do what you want it to and you'll have the option to forward other
ports to other destination IP's.


Grts,
Rob



