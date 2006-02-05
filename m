From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: I want to understand the concept
Date: Sun, 5 Feb 2006 10:22:57 +0100
Message-ID: <001f01c62a35$c0c66aa0$0101000a@sterenborg.info>
References: <20060205085425.75608.qmail@web35905.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060205085425.75608.qmail@web35905.mail.mud.yahoo.com>
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

> Hello?
> 
> I want to understand the difference b/w following
> things
> 
> Q1. What is the difference b/w these 2 command
> 
> iptables -A FORWARD -s 192.168.0.1 -j DROP
> iptables -t mangle -A FORWARD -s 192.168.0.1 -j DROP

You SHOULD NOT FILTER in tables other than the filter table (the first
rule).

> what is the difference b/w
> 
> FORWARD of filter table?
> FORWARD of mangle table?

Using the mangle table you can alter packets in the FORWARD chain.
In the filter table you cannot.
In the mangle table you can filter packets, but you SHOUD NOT.

> Q2. What is the difference b/w POSTROUTING and
> PREROUTING?

Exactly what the names say : 
- PREROUTING : things to be done *before routing* like DNAT,
- POSTROUTING : things to be done *after routing* like SNAT.

> Q3. What is the difference b/w SNAT and DNAT?

Hmm.. Did you read any tutorial at all ?

SNAT is used to "masquerade" (not exactly..) your internal, private, IP
addresses so your client can connect to the internet.
DNAT can be used to do portforwarding, for example when you run a
webserver behind the firewall.

> Q4. What is the difference b/w that
> 
> How i can understand
> 
> FOR FILTER TABLE?
> 
> what is my source in FORWARD chain of FILTER table

The IP of original sender of the packet.

> what is my dstination in FORWARD chain of FILTER table

The IP of the actual recipient of the packet (so, if you use a
PREROUTING DNAT rule, you'd use that IP there).

> what is my source in INPUT chain of FILTER table

The IP of the machine the packets (or seems to) comes from.

> what is my dstination in INPUT chain of FILTER table

127.0.0.1 or one of your local IP addresses.

> what is my source in OUTPUT chain of FILTER table

127.0.0.1 or one of your local IP addresses.

> what is my destination in OUTPUT chain of FILTER table

The IP of the machine the packets (or seems to) go to.

> FOR NAT TABLE?

I'm not going to answer these. See below.

> FOR NAT TABLE?

Nor am I going to answer these.
I think you need to read this before doing anything else...

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

http://www.aptalaska.net/~jclive/IPTablesFlowChart.pdf

http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png


Gr,
Rob


