From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: Fri, 14 Jan 2005 18:32:57 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501141828080.28737-100000@darkstar.sysinfo.com>
References: <20050114200228.GA21562@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050114200228.GA21562@spawar.navy.mil>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: seberino@spawar.navy.mil
Cc: netfilter@lists.netfilter.org


Yes, this is often refered to as egress filtering one might impliment it
to;

stop inside lamers from scanning or DDOSing other networks/servers

keep inside lamers from spoofing packets for other atack vectors on
servers/networks on the outside

reduce the ricks of more direct attacks from your insiders if they are
infected with wiruses and trojans that seek to spread themselves inside
and outside the net

to protect specific resouces on the inside from others on the inside.

to block protocols and ports from exiting your net that should never be
pushed outside your domain anyways, like the common windows realted ones
on ports 135-139 tcp/udp 445 tcp, and the pnp gunk they have now.

Just to name a few reasons for such filtering.  And it's a shame that it
has not become a common place filtering innitiative at more sites then it
is nowdays.

Thanks,

Ron DuFresne


On Fri, 14 Jan 2005 seberino@spawar.navy.mil wrote:

> 
> I'm wondering if it is ever necessary to block
> *outgoing* packets at your firewall.
> 
> As long as you block /incoming/ carefully no hacker
> on the Internet can send spam through a node on
> your network or anything nasty like that right?
> 
> (I'm wondering for a wifi hotspot if any nastiness
> will happen if I don't block outgoing.  I block
> virtually all incoming except ssh.)
> 
> CS
> 

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


