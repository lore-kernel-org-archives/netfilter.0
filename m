From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Internal ip exiting network on firewall external nic despight rule
Date: Fri, 20 Sep 2002 20:05:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020920190549.NZVO16609.mta05-svc.ntlworld.com@there>
References: <000501c260d4$b650ff50$0801a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c260d4$b650ff50$0801a8c0@s3ac>
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

On Friday 20 September 2002 7:37 pm, Rowan Reid wrote:

> I'm not sure I understand this data that I'm getting from my firewall.
> If I understand it correctly it's saying that a machine from my local
> net is going out through my external Interface.  I have a rule which
> should drop all internal network request that appear at the external
> nic. Any help would be appreciated.
>
> RULE ####
> # remote interface, claiming to be local machines, IP spoofing, get lost
> #
> $IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it

The "-d $UNIVERSE" is redundant here:

1. It's redundant in any rule - leave it out and the meaning is the same.
2. You don't need to specify destination address in the INPUT chain because 
it has to be an address on the firewall - can't be anything else.

> CONFIG ###
> s3a-www:~ # firewall mlist
>   External Interface:  eth1
>   Internal Interface:  eth0
>   ---
>   External IP: **.**.76.66
>   ---
>   Internal Network: 192.168.1.0/24
>   Internal IP:      192.168.1.1
>
> LOG FILE ###
> Sep 20 04:04:01 s3a-www kernel: IN=eth1 OUT=eth1 SRC=192.168.1.105
> DST=216.99.233.76 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=61116 DF
> PROTO=TCP SPT=4380 DPT=110 WINDOW=8760 RES=0x00 ACK URGP=0

You're correct that this log entry shows a packet with source address 
192.168.1.105 entering your firewall on eth1, however what I don't understand 
it why it would be picked up by a rule in your INPUT chain, because this 
packet is not destined for the firewall itself - it is destined for machine 
216.99.233.76 chimmx04.algx.net, and should therefore be passing through your 
FORWARD chain (even if it does come in and go out the same interface, it'll 
still go through the FORWARD chain).

The packet is trying to connect to chimmx04.algx.net on port 110, which is 
pop3, and that machine is indeed running a pop3 server - it claims to be a 
Messaging Multiplexor running iPlanet Messaging Server 5.1

Do you have a machine with address 192.168.1.105 on your internal network ?

Maybe you could show us the rest of your ruleset, in particular any nat rules 
you've set up - also perhaps explain your network configuration more fully - 
what is eth1 actually connected to - is it just a router / ADSL / cable modem 
/ whatever to the outside world, or is there anything else on the external 
side of the firewall ?

Antony.

-- 

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979

