From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Mon, 10 Jan 2005 19:27:12 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501101924120.16399-100000@darkstar.sysinfo.com>
References: <003601c4f51b$22c36790$4206a8c0@loki>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003601c4f51b$22c36790$4206a8c0@loki>
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
To: Marius Mertens <marius.mertens@gmx.de>
Cc: netfilter@lists.netfilter.org

On Sat, 8 Jan 2005, Marius Mertens wrote:

> On Friday, January 07, 2005 9:08 PM,
> Michael Gale wrote:
> 
> > I believe you are misunderstanding what is happening, your rule:
> >
> > iptables -A INPUT -i ppp0 -p tcp --dport 4664 -j DROP
> >
> > Should not affect packets you are forwarding, because those packets
> > from outside that are being sent to a internal machine should be
> > matched against the FORWARD and not the INPUT.
> 
> Yes, this is exactly my problem: As you said, forwarded packets should never 
> be matched against rules in INPUT. And thats where the DROP rule above 
> enters the game: I just inserted it as a very primitive "test", just to have 
> a packet counter for packets matching criteria "-i ppp0 -p tcp --dport 4664" 
> in INPUT and expected it to be constantly zero. The only purpose of this 
> drop rule is to show me, how many packets (matching the same criteria "-i 
> ppp0 -p tcp --dport 4664") have not been DNATed in PREROUTING.
> 

And there are other reasons that you might get this counter to increment
and none of them relating to packets meant for the DNAT system<s>/rules on
the FORWARD chain.  It's not enough of a test to validate your
conclusions, adding a LOG rule prior to the drop might help track down
'why' you are seeing that 'counter' increment.

Thanks,

Ron DuFresne
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


