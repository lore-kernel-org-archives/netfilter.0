From: Christer Ekholm <chrekh@bredband.net>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 03 May 2004 02:30:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86u0yytkrb.fsf@poke.localdomain>
References: <16533.31553.47397.464571@jane.localdomain>
	<200405030005.33281.Antony@Soft-Solutions.co.uk>
	<86y8oatnsf.fsf@poke.localdomain>
	<200405030045.56089.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405030045.56089.Antony@Soft-Solutions.co.uk> (Antony
 Stone's message of "Mon, 3 May 2004 00:45:56 +0100")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone <Antony@Soft-Solutions.co.uk> writes:

> Ah.   Sorry if my previous response seemed a little terse - I did not realise 
> you were aware of iproute2 and had tried so much of it already.

Don't be sorry, your assumption was perfectly valid.

>
>> I think my problem is that I need this to work from the host with the
>> connections to the providers. (localhost).
>>
>> My next thought was to use iptables to add a SNAT rule. But SNAT is only
>> allowed in POSTROUTING, and I think I would need that in OUTPUT
>
> I would recommend that you do try such a rule, since POSTROUTING happens after 
> OUTPUT (and FORWARD).
>
> Try:
>
> iptables -A POSTROUTING -t nat -p tcp --dport 25 -j SNAT --to 217.215.183.181
>

Ok, that almost makes it work. tcpdump shows the packets with the
correct sourceaddr, and I can see the returnpackets also. But they
doesn't seem to reach my telnet process, because it just sits waiting.

$telnet vishnu.netfilter.org 25
Trying 213.95.27.115...

tcpdump -n -i eth1
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 68 bytes
02:16:07.089217 IP 217.215.183.181.48896 > 213.95.27.115.25: SWE 1634311290:1634311290(0) win 5840 <mss 1460,sackOK,timestamp 69511424[|tcp]>
02:16:07.145586 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573673968[|tcp]>
02:16:10.086584 IP 217.215.183.181.48896 > 213.95.27.115.25: SWE 1634311290:1634311290(0) win 5840 <mss 1460,sackOK,timestamp 69511724[|tcp]>
02:16:10.142648 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573674267[|tcp]>
02:16:11.144472 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573674368[|tcp]>
02:16:12.086600 arp who-has 217.215.183.1 tell 217.215.183.181
02:16:12.099187 arp reply 217.215.183.1 is-at 00:20:1a:06:d9:19
02:16:16.086737 IP 217.215.183.181.48896 > 213.95.27.115.25: SWE 1634311290:1634311290(0) win 5840 <mss 1460,sackOK,timestamp 69512324[|tcp]>
02:16:16.143331 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573674867[|tcp]>
02:16:17.145349 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573674968[|tcp]>
02:16:28.087024 IP 217.215.183.181.48896 > 213.95.27.115.25: SWE 1634311290:1634311290(0) win 5840 <mss 1460,sackOK,timestamp 69513524[|tcp]>
02:16:28.143251 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573676067[|tcp]>
02:16:29.146786 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573676168[|tcp]>
02:16:52.087641 IP 217.215.183.181.48896 > 213.95.27.115.25: SWE 1634311290:1634311290(0) win 5840 <mss 1460,sackOK,timestamp 69515924[|tcp]>
02:16:52.144701 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573678467[|tcp]>
02:16:53.150064 IP 213.95.27.115.25 > 217.215.183.181.48896: S 294755035:294755035(0) ack 1634311291 win 5792 <mss 1460,sackOK,timestamp 573678568[|tcp]>


--
 Christer

