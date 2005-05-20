From: Jason Opperisano <opie@817west.com>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 15:37:16 -0400
Message-ID: <20050520193716.GA12584@bender.817west.com>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
	<20050519232314.GA9369@bender.817west.com>
	<20050519233347.GA9462@bender.817west.com>
	<428D8638.4040301@riverviewtech.net>
	<428D954E.1010105@riverviewtech.net>
	<20050520152021.GA11737@bender.817west.com>
	<Pine.LNX.4.61.0505201443170.8116@e-smith.charlieb.ott.istop.com>
	<428E3493.4040505@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <428E3493.4040505@riverviewtech.net>
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

On Fri, May 20, 2005 at 02:03:47PM -0500, Taylor, Grant wrote:
> >Why is filtering in -t mangle not also poor form?
> 
> I believe that you are really suppose to do the filtering in the filter 
> table.  But seeing as how the kernel will respond to the traceroute packet 
> that comes in before the rules in the filter table could DROP the packet we 
> have to do this filtering elsewhere to beat the kernel to the punch.  
> Jason, do you have any additional comments / corrections?

well--the different chains are there for a reason.  you have a filter
table for filtering packets, you have a nat table for translating
addresses...use them for their intended purpose.

one reason to not filter in nat is that not every packet traverses the
chains in the nat table, only --state NEW packets traverse the chains in
nat.  that alone should be enough of an argument that the nat table is
not intended for packet filtering.

another reason is maintainability.  i had a guy on IRC tearing his
hair out yesterday because he couldn't figure out why his packets
weren't getting through.  he added all the necessary rules to allow
the traffic, but no dice.  turns out he had a DROP rule in his nat
table...in POSTROUTING no less...  if he had just dropped the $%^#
packet in filter, it never would've gotten to nat POSTROUTING anyways.

if you desire to maintain large numbers of large-scale firewalls without
spending every waking moment caring for them, you need to do things in
an easy-to-maintain way.  filtering packets in a table not intended for
that purpose doesn't fall into this methodology.

so like i said, "it's poor form."  i'm not saying it's wrong, or that
you can't do it, but in my opinion; as a guy who's dealt with firewall
systems for a good long while now--it's not "best practice."

especially considering that we all have the wondrous mangle table
available to us, which *is* traversed by every packet, and gives us an
opportunity to do some pre-filter table scrubbing.

-j

--
"Stewie: Met her on my CB / said her name was Mimi / Sounded like
 an angel'd come to earth (come to earth) / When I went to meet her /
 Man, you should have seen her / Twice as tall as me, three times
 the girth."
        --Family Guy

