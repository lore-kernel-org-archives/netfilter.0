From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: RE: daisy chaining firewalls causes connection tracking problems ?
Date: Wed, 13 Aug 2003 13:46:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c36190$7acc7370$d90315ac@rsrc.be.local>
References: <20030812141400.GC14135@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20030812141400.GC14135@cannon.eng.us.uu.net>
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
To: 'Ramin Dousti' <ramin@cannon.eng.us.uu.net>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,


I've done some further testing, and i'm still puzzled. i'm not inclined
anymore to think it's because of the 3 firewalls one behind the other, i
think it's maybe because of our network topology:

this is the error from the iptables logs:

Aug 13 13:31:26 dobermann kernel: -drop_the_rest-IN=eth1 OUT=eth1
SRC=172.21.3.18 DST=172.16.208.130 LEN=44 TOS=0x00 PREC=0x00 TTL=127
ID=40929 DF PROTO=TCP SPT=6101 DPT=8361 WINDOW=8760 RES=0x00 ACK SYN URGP=0

as you can see, the traffic comes in via eth1 and leaves via eth1 (this is
just temporarily luckily). traffic to 172.16.208.130 is rerouted to the dmz
via another machine on the 172.21.x.x subnet

.
.
.


.... and then it suddenly dawned on me:

the traffic arrives at the destination via a different route than the
returned packets, so the last firewall never sees the SYN, only the ACK SYN.


grmbllll.


I'll go chew up a tree now.



Tom.



-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: 12 August 2003 16:14
To: Tom Van Overbeke
Cc: Netfilter (E-mail)
Subject: Re: daisy chaining firewalls causes connection tracking
problems ?


Hello,

Interesting. Do you think it's anything to do with chaining the three
FW's? Are you sure you don't have any back-door for the first SYN to
by-pass the "outer" FW, so the SYN,ACK is being considered as unrelated?

Ramin

On Tue, Aug 12, 2003 at 03:38:40PM +0200, Tom Van Overbeke wrote:

> Hi,
>
>
> I'm faced with an environment where there are 3 iptables firewalls
directly
> connected to one another. I have a few servers on one end, that need to
talk
> to servers on the other end of the 3 firewalls. (we use fwbuilder to
> maintain the firewalls).
>
> normally, i have no problems adding stateful rules to enable/disable
> traffic, but in this case, i seem to either have hit a bug, or maybe a
> limitation of iptables ???
>
>
> my case:
>
> i need to have a server talk to our backup server via an agent. we know
> which ports the backup app uses, and have before succesfully changed our
> firewall to enable backups on previous occasions.
>
> now, with 3 firewalls in between, i thought i could just use the exact 3
> rules and put them on each firewall, and it should work.
>
>
> but ... it doesn't. on one of the outer firewalls, i see that the session
> setup packets (ACK SYN bits are set) is being blocked.
>
>
> i had already solved a similar problem (with big brother) by doing it the
> 'ipchains' way, that is creating a rule for the traffic in each direction,
> and disabling the 'statefulness' of the rule. obviously, i'm not too happy
> with this solution, so I'd thought i ask you guys if the connection
tracking
> might have problems with multiple firewalls chained together ?
>
>
>
> thx,
>
>
> Tom.
>
>
>
>
>
>
****************************************************************************
> Disclaimer:
> This electronic transmission and any files attached to it are strictly
> confidential and intended solely for the addressee. If you are not
> the intended addressee, you must not disclose, copy or take any
> action in reliance of this transmission. If you have received this
> transmission in error, please notify the sender by return and delete
> the transmission.  Although the sender endeavors to maintain a
> computer virus free network, the sender does not warrant that this
> transmission is virus-free and will not be liable for any damages
> resulting from any virus transmitted.
> Thank You.
>
****************************************************************************
>


