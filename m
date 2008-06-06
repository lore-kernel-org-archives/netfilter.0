From: =?ISO-8859-15?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Weird nat/conntrack Problem with PASV FTP upload
Date: Fri, 06 Jun 2008 15:56:06 +0200
Message-ID: <484941F6.9080701@bringe.com>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net> <4847F14D.5000806@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4847F14D.5000806@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Patrick McHardy wrote:
> I guess you're seeing INVALID packets (from the view of conntrack)
> and they're thus not NATed but delivered locally, causing a RST.
> Does dropping -m state --state INVALID packets in PREROUTING make
> any difference?

I've tried that for a day, to no avail:

(client)

000199 IP myclient.39268 > server.50857: . 3928342114:3928346458(4344) 
ack 716921888 win 46 <nop,nop,timestamp 491865886 41364954>
000197 IP myclient.39268 > server.50857: . 3928346458:3928348623(2165) 
ack 716921888 win 46 <nop,nop,timestamp 491865886 41364954>
214707 IP myclient.39268 > server.50857: . 3928162255:3928163703(1448) 
ack 716921888 win 46 <nop,nop,timestamp 491865908 41364954>
tcpdump: pcap_loop: truncated dump file; tried to read 66 captured 
bytes, only got 62
016181 IP server.50857 > myclient.39268: R 716921888:716921888(0) win 0

(natbox external)

000204 IP natbox.39268 > server.50857: . 3928342114:3928343562(1448) ack 
716921888 win 46 <nop,nop,timestamp 491865886 41364954>
000005 IP natbox.39268 > server.50857: . 3928343562:3928345010(1448) ack 
716921888 win 46 <nop,nop,timestamp 491865886 41364954>
000003 IP natbox.39268 > server.50857: . 3928345010:3928346458(1448) ack 
716921888 win 46 <nop,nop,timestamp 491865886 41364954>
000187 IP natbox.39268 > server.50857: . 3928346458:3928347906(1448) ack 
716921888 win 46 <nop,nop,timestamp 491865886 41364954>
000005 IP natbox.39268 > server.50857: . 3928347906:3928348623(717) ack 
716921888 win 46 <nop,nop,timestamp 491865886 41364954>
007712 IP server.50857 > natbox.39268: . ack 3928162255 win 1456 
<nop,nop,timestamp 41364957 491865884,nop,nop,sack 1 
{3928165151:3928165154}>
000011 IP natbox.39268 > server.50857: R 3928162255:3928162255(0) win 0
206983 IP natbox.39268 > server.50857: . 3928162255:3928163703(1448) ack 
716921888 win 46 <nop,nop,timestamp 491865908 41364954>
016041 IP server.50857 > natbox.39268: R 716921888:716921888(0) win 0

My nat rules currently look like this:

iptables -t nat -A PREROUTING -m state --state INVALID -j LOG
iptables -t nat -A PREROUTING -m state --state INVALID -j DROP
iptables -t nat -A POSTROUTING -s client -d server -p tcp -j SNAT 
--to-source natbox
iptables -t nat -A POSTROUTING -s clientnet/24 -o eth0 -j SNAT 
--to-source natbox-base

natbox is an ifalias on the external interface.

Any further ideas on how I could debug/fix this?

TIA,
Thomas
