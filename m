From: Simon Lodal <simonl@parknet.dk>
Subject: Re: DNAT hiding routers behind it
Date: Sat, 07 Aug 2004 16:47:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4114EB94.8050004@parknet.dk>
References: <4113BEF9.5090706@parknet.dk> <200408062356.16206.Antony@Soft-Solutions.co.uk> <411443B8.8090202@parknet.dk> <200408070837.38949.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030407060105070202060908"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408070837.38949.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030407060105070202060908
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

>>simonl@pc $ traceroute -q1 -I 192.168.1.11
>>traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
>>  1  10.44.252.1 (10.44.252.1)  4.297 ms
>>  2  10.44.8.1 (10.44.8.1)  3.892 ms
>>  3  192.168.44.1 (192.168.44.1)  4.826 ms
>>  4  192.168.1.11 (192.168.1.11)  5.095 ms
>>
>>All good. Now for the fun (dnat to another host at similar distance):
>>root@fw # iptables -t nat -A PREROUTING -i vmnet2 -s 10.44.252.2 -d
>>192.168.1.11 -j DNAT --to-destination 192.168.2.11
>>
>>simonl@pc $ traceroute -q1 -I 192.168.1.11
>>traceroute to 192.168.1.11 (192.168.1.11), 30 hops max, 38 byte packets
>>  1  10.44.252.1 (10.44.252.1)  1.854 ms
>>  2  192.168.1.11 (192.168.1.11)  9.378 ms
>>  3  192.168.1.11 (192.168.1.11)  17.237 ms
>>  4  192.168.1.11 (192.168.1.11)  3.783 ms
>>
>>See?
> 
> 
> Yes.   Strange.   I think I'd like to see the output of "traceroute -q1 -I 
> 192.168.2.11" (with or without the DNAT rule, shouldn't make any difference).
Note I managed to set up stuff so I do not need the SNAT rule anymore. 
The firewall is a plain forwarding router now, except for the dnat rule.

It is what you would expect (same with and without dnat):
simonl@pc $ traceroute -q1 -I 192.168.2.11
traceroute to 192.168.2.11 (192.168.2.11), 30 hops max, 38 byte packets
  1  10.44.252.1 (10.44.252.1)  1.095 ms
  2  10.44.8.1 (10.44.8.1)  1.936 ms
  3  192.168.44.1 (192.168.44.1)  6.036 ms
  4  192.168.2.11 (192.168.2.11)  3.077 ms

> Also, can you put a packet sniffer such as ethereal on the link 10.44.8.10 - 
> 10.44.8.1 to see what packets are really leaving your firewall to the rest of 
> the network?
Sure, this is from the firewall, ethereal sniffing all interfaces with 
filter "ip proto 1", with dnat, doing traceroute -q1 -I 192.168.1.11 
(slightly prettyprinted):

No Source        Destination   Protocol Info
  1 10.44.252.2   192.168.1.11  ICMP     Echo (ping) request
  2 10.44.252.1   10.44.252.2   ICMP     Time-to-live exceeded
  3 10.44.252.2   192.168.1.11  ICMP     Echo (ping) request
  4 10.44.252.2   192.168.2.11  ICMP     Echo (ping) request
  5 10.44.8.1     10.44.252.2   ICMP     Time-to-live exceeded
  6 192.168.1.11  10.44.252.2   ICMP     Time-to-live exceeded
  7 10.44.252.2   192.168.1.11  ICMP     Echo (ping) request
  8 10.44.252.2   192.168.2.11  ICMP     Echo (ping) request
  9 192.168.44.1  10.44.252.2   ICMP     Time-to-live exceeded
10 192.168.1.11  10.44.252.2   ICMP     Time-to-live exceeded
11 10.44.252.2   192.168.1.11  ICMP     Echo (ping) request
12 10.44.252.2   192.168.2.11  ICMP     Echo (ping) request
13 192.168.2.11  10.44.252.2   ICMP     Echo (ping) reply
14 192.168.1.11  10.44.252.2   ICMP     Echo (ping) reply

In my understanding line 5 means 10.44.8.1 sent back a ttl-exceeded as 
it should.

The strange thing is on line 6. The ttl-exceeded packet is sent to the 
pc, but at that point, the source adress has been changed to 192.168.1.11.

The corresponding output from traceroute'ing 192.168.2.11 is:
  5 10.44.8.1     10.44.252.2   ICMP     Time-to-live exceeded
  6 10.44.8.1     10.44.252.2   ICMP     Time-to-live exceeded

The ttl-exceeded packet is just forwarded, as expected.

I have attached libpcap dump files for traceroute'ing both hosts in case 
it contains more relevant info.

I would like to set up a stealth sniffer between firewall and next-hop 
router, but I do not know how, wish I still had a hub.

FYI kernel is 2.4.25.


Simon

--------------030407060105070202060908
Content-Type: application/octet-stream;
 name="traceroute -q1 -I 192.168.1.11.dump"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="traceroute -q1 -I 192.168.1.11.dump"

1MOyoQIABAAAAAAAAAAAAP//AABxAAAAC+kUQRgMDgA2AAAANgAAAAAAAAEABgAMKX42PgAA
CABFAAAmiSQAAAEBaNEKLPwCwKgBCwgAVmyJIwABAQEL6RRB6UMOAAvpFEGSDA4AUgAAAFIA
AAAABAABAAYAUFbAAAIAAAgARcAAQp7nAABAAc63Ciz8AQos/AILAPT/AAAAAEUAACaJJAAA
AQFn0Qos/ALAqAILCABWbIkjAAEBAQvpFEHpQw4AC+kUQUREDgA2AAAANgAAAAAAAAEABgAM
KX42PgAACABFAAAmiSUAAAIBZ9AKLPwCwKgBCwgA9zGJIwACAgIL6RRBR3wOAAvpFEGhRA4A
NgAAADYAAAAABAABAAYABV0aXfQAAAgARQAAJoklAAABAWfQCiz8AsCoAgsIAPcxiSMAAgIC
C+kUQUd8DgAL6RRBVkkOAEgAAABIAAAAAAAAAQAGAASWBQitAAAIAEXAADjgMgAAgAFBdwos
CAEKLPwCCwBsqAAAAABFAAAmiSUAAAEBZ9AKLPwCwKgCCwgA9zGJIwACC+kUQYVJDgBIAAAA
SAAAAAAEAAEABgBQVsAAAgAACABFwAA44DIAAH8BkvDAqAELCiz8AgsAbKgAAAAARQAAJokl
AAABAWjQCiz8AsCoAQsIAPcxiSMAAgvpFEEWbg4ANgAAADYAAAAAAAABAAYADCl+Nj4AAAgA
RQAAJokmAAADAWbPCiz8AsCoAQsIABEGiSMAAwMDC+kUQSymDgAL6RRBV24OADYAAAA2AAAA
AAQAAQAGAAVdGl30AAAIAEUAACaJJgAAAgFmzwos/ALAqAILCAARBokjAAMDAwvpFEEspg4A
C+kUQeZwDgBIAAAASAAAAAAAAAEABgAElgUIrQAACABFwAA4PHMAAH8BC7rAqCwBCiz8AgsA
UtMAAAAARQAAJokmAAABAWfPCiz8AsCoAgsIABEGiSMAAwvpFEEpcQ4ASAAAAEgAAAAABAAB
AAYAUFbAAAIAAAgARcAAODxzAAB+ATewwKgBCwos/AILAFLTAAAAAEUAACaJJgAAAQFozwos
/ALAqAELCAARBokjAAML6RRB4JcOADYAAAA2AAAAAAAAAQAGAAwpfjY+AAAIAEUAACaJJwAA
BAFlzgos/ALAqAELCABD2okjAAQEBAvpFEH4zw4AC+kUQSGYDgA2AAAANgAAAAAEAAEABgAF
XRpd9AAACABFAAAmiScAAAMBZc4KLPwCwKgCCwgAQ9qJIwAEBAQL6RRB+M8OAAvpFEHRnA4A
PgAAAD4AAAAAAAABAAYABJYFCK0AAAgARQAAJklyAAB+ASqDwKgCCwos/AIAAEvaiSMABAQE
C+kUQfjPDgAAAAAAAAAAAAvpFEH+nA4ANgAAADYAAAAABAABAAYAUFbAAAIAAAgARQAAJkly
AAB9ASyDwKgBCwos/AIAAEvaiSMABAQEC+kUQfjPDgA=
--------------030407060105070202060908
Content-Type: application/octet-stream;
 name="traceroute -q1 -I 192.168.2.11.dump"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="traceroute -q1 -I 192.168.2.11.dump"

1MOyoQIABAAAAAAAAAAAAP//AABxAAAA1+gUQbBICwA2AAAANgAAAAAAAAEABgAMKX42PgAA
CABFAAAmiSMAAAEBZ9IKLPwCwKgCCwgAgCmJIgABAQHX6BRB9ocLANfoFEEfSQsAUgAAAFIA
AAAABAABAAYAUFbAAAIAAAgARcAAQp7mAABAAc64Ciz8AQos/AILAPT/AAAAAEUAACaJIwAA
AQFn0gos/ALAqAILCACAKYkiAAEBAdfoFEH2hwsA1+gUQZmjCwA2AAAANgAAAAAAAAEABgAM
KX42PgAACABFAAAmiSQAAAIBZtEKLPwCwKgCCwgAbtmJIgACAgLX6BRBBtYLANfoFEH1owsA
NgAAADYAAAAABAABAAYABV0aXfQAAAgARQAAJokkAAABAWfRCiz8AsCoAgsIAG7ZiSIAAgIC
1+gUQQbWCwDX6BRBYqgLAEgAAABIAAAAAAAAAQAGAASWBQitAAAIAEXAADjgMAAAgAFBeQos
CAEKLPwCCwD1AQAAAABFAAAmiSQAAAEBZ9EKLPwCwKgCCwgAbtmJIgAC1+gUQZyoCwBIAAAA
SAAAAAAEAAEABgBQVsAAAgAACABFwAA44DAAAH8BQnkKLAgBCiz8AgsA9QEAAAAARQAAJokk
AAABAWfRCiz8AsCoAgsIAG7ZiSIAAtfoFEFW3QsANgAAADYAAAAAAAABAAYADCl+Nj4AAAgA
RQAAJoklAAADAWXQCiz8AsCoAgsIAJudiSIAAwMD1+gUQdgPDADX6BRBmt0LADYAAAA2AAAA
AAQAAQAGAAVdGl30AAAIAEUAACaJJQAAAgFm0Aos/ALAqAILCACbnYkiAAMDA9foFEHYDwwA
1+gUQRjgCwBIAAAASAAAAAAAAAEABgAElgUIrQAACABFwAA4OyAAAH8BDQ3AqCwBCiz8AgsA
yDwAAAAARQAAJoklAAABAWfQCiz8AsCoAgsIAJudiSIAA9foFEF54AsASAAAAEgAAAAABAAB
AAYAUFbAAAIAAAgARcAAODsgAAB+AQ4NwKgsAQos/AILAMg8AAAAAEUAACaJJQAAAQFn0Aos
/ALAqAILCACbnYkiAAPX6BRBTxAMADYAAAA2AAAAAAAAAQAGAAwpfjY+AAAIAEUAACaJJgAA
BAFkzwos/ALAqAILCADrd4kiAAQEBNfoFEGHMwwA1+gUQYgQDAA2AAAANgAAAAAEAAEABgAF
XRpd9AAACABFAAAmiSYAAAMBZc8KLPwCwKgCCwgA63eJIgAEBATX6BRBhzMMANfoFEEwFQwA
PgAAAD4AAAAAAAABAAYABJYFCK0AAAgARQAAJklwAAB+ASqFwKgCCwos/AIAAPN3iSIABAQE
1+gUQYczDAAAAAAAAAAAANfoFEFTFQwANgAAADYAAAAABAABAAYAUFbAAAIAAAgARQAAJklw
AAB9ASuFwKgCCwos/AIAAPN3iSIABAQE1+gUQYczDAA=
--------------030407060105070202060908--

