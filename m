From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: weird message in logs
Date: Tue, 19 Oct 2004 16:53:37 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <11cb01c4b615$52ba8360$49caa8c0@caris.priv>
References: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>
	<20041019184419.GA3363@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Is it a problem that it is dropping these ?  I tried option a .. it did not
seem to change anything.

|192.168.202.73| ---> |eth0 on internal firewall 192.168.200.1| ---> |eth0:1
on internal firewal 10.90.0.1| ----> |eth1 on other firewall
10.90.0.2| ----> | eth0 on other firewall 192.168.90.1| --- >
|192.168.90.10|

Basically, I was sshing to eth1 on the other firewall form 192.168.202.73
... I assume the redirect comes from the reply ?  technically, eth1 is on
the same physical network as 192.168.200.0/21 ... so is that why it is doing
the redirect ?  Is not logging these messages solving the problem ?  Or is
there a prolem at all ?  Thank you very much for your reply.

Peter

----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, October 19, 2004 3:44 PM
Subject: Re: weird message in logs


On Tue, Oct 19, 2004 at 01:52:28PM -0300, Peter Marshall wrote:
> Below is a message I get in my messages file.  Basically, there is a
company
> going to lease space from us.  I know it would have been easier to just
> stick another card in my firewall and give them a subnet, however, that is
> not possible for our setup (long story).  Anyway, I bult another firewall
> for them.  This firewall sits within our internal network (physically) and
> has 2 network cards.  The firewalls internal network card is for their
> netowrk; 192.168.90.0/24,  The external card has a network of its own
> 10.90.0.2.  My internal firewall has a sub interface eth0:1 with the
number
> 10.90.0.1  (eth0 is 192.168.200.1 and is the gateway to my companys
internal
> network).
>
> What I am doing at the moment is ssh'ing to the newly created firewall
> called rubidium on port 15422.  I get the following in my messages file.
> Does anyone know how to correct this problem.  It does not prevent me from
> sshing, however, I would prefer to not have errors in my log files.
>
> Oct 19 14:46:05 rubidium kernel: REJECT: INPUT IN=eth1 OUT=
> MAC=00:50:04:9b:7a:ee:00:50:04:68:df:06:08:00 SRC=10.90.0.1 DST=10.90.0.2
> LEN=484 TOS=0x10 PREC=0xC0 TTL=64 ID=58050 PROTO=ICMP TYPE=5 CODE=1
> GATEWAY=192.168.202.73 [SRC=10.90.0.2 DST=192.168.202.73 LEN=456 TOS=0x10
> PREC=0x00 TTL=64 ID=7787 DF PROTO=TCP SPT=15422 DPT=2510 WINDOW=8576
> RES=0x00 ACK PSH URGP=0 ]

machine 10.90.0.1 is sending an ICMP Redirect message to 10.90.0.2 saying
that the next hop for 192.168.202.73 is 192.168.202.73...

if you don't want to see these logs:

(a) disable the sending of ICMP Redirects on 10.90.0.1:
      sysctl -w net.ipv4.conf.eth0.send_redirects=0
(b) drop, but don't log "-p icmp --icmp-type 5/1" on 10.90.0.2
(c) accept, and don't log "-p icmp --icmp-type 5/1" on 10.90.0.2

if it were me--i'd opt for "a"

-j

-- 
Jason Opperisano <opie@817west.com>


