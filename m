From: Jason Opperisano <opie@817west.com>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Tue, 11 Jan 2005 11:29:14 -0500
Message-ID: <20050111162914.GA14045@bender.817west.com>
References: <Pine.LNX.4.05.10501101924120.16399-100000@darkstar.sysinfo.com>
	<002801c4f7ee$ccf74210$4206a8c0@loki>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002801c4f7ee$ccf74210$4206a8c0@loki>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jan 11, 2005 at 04:03:11PM +0100, Marius Mertens wrote:
> Hi again,
> 
> I just subscribed to this list in order to save the moderator some work and 
> minimize the delays in our discussion ;-)
> So no need to cc anymore.

we greatly appreciate that.

> On Tuesday, January 11, 2005 1:27 AM,
> R. DuFresne wrote:
> 
> >[...]
> >validate your conclusions, adding a LOG rule prior to the drop might
> >help track down 'why' you are seeing that 'counter' increment.
> 
> Below are the packets logged by
> iptables -A INPUT -i ppp0 -p tcp --dport 4664 -j LOG --log-level 
> 6 --log-prefix "SUSPICIOUS: "
> after running some minutes.

you could easily be creating this situation yourself with your "testing"
methodology.  if you are:

1) starting firewall
2) allowing connections to establish
3) stopping firewall, which includes removing ip_conntrack
4) starting firewall

all the packets that were part of the established connections in step 2
will no longer have a conntrack entry that ties them to the DNAT, and
they will end up in INPUT and get dropped.

i'm not saying this is what you are doing--but it's an explanation for
what you're seeing--the DNAT functionality in netfilter works properly
in my experience.

-j

--
"To alcohol: the cause of, and solution to, all of life's problems."
        --The Simpsons

