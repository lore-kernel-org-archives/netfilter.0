From: Khanh Tran <khanh@slc.edu>
Subject: RE: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 19:21:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB575@EXCHANGE>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@newkirk.us, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

OK, so I tried to do:

iptables -A POSTROUTING -j LOG --log-tcp-options --log-ip-options

but all that gives me is an iptables error about that not being a valid
chain.  I do get the MAC address info if I log the INPUT chain, but all that
gives me is the info about the originating IP with a destination of the
internal interface of my firewall.  That's not much help for keeping track
of the activity of all my internals.  This is essentially all I am trying to
do.  If anyone has a better solution, I'm up for suggestions.

Khanh Tran
Network Operations
Sarah Lawrence College


-----Original Message-----
From: Joel Newkirk [mailto:netfilter@newkirk.us]
Sent: Saturday, February 01, 2003 6:49 PM
To: Khanh Tran; 'netfilter@lists.samba.org'
Subject: Re: netfilter/iptables LOG not logging MAC addresses


On Saturday 01 February 2003 04:06 pm, Khanh Tran wrote:
> I tried searching MARC for this one and couldn't find an answer...
>
> I have setup logging on my FORWARD chain with:
>
> iptables -A FORWARD -j LOG --log-tcp-options --log-ip-options
>
> It's logging just fine and showing up in my logs, but it's missing the
> MAC address.  I've seen the MAC address show up in logs from other
> peoples' posts and such.  Am I missing a log option switch?  Possibly
> something not compiled in my kernel?  Not loading a module?  Thanks in
> advance...
>
> Khanh Tran
> Network Operations
> Sarah Lawrence College

The MAC appears in the logs from the PREROUTING chains, 
(mangle-PREROUTING and nat-PREROUTING) and INPUT chains (mangle-INPUT 
and filter-INPUT) but not FORWARD chains (mangle-FORWARD and 
filter-FORWARD).  I've never understood why, but honestly didn't care 
since it never affected me.  It's not a valid concept in the OUTPUT 
chains, btw, and would be valid only on some traffic in POSTROUTING.

The MAC information IS available in the FORWARD chains, since it is valid 
to match "-m mac --mac-source" there.  A quick check in ipt_LOG.c turns 
up the test "if (in && !out)" being performed in ipt_log_target(), so 
that if the out interface is already known (IE, forward, output or 
postrouting chains) then it will not print anything.  (This is followed 
by the comment "MAC logging for input chain only." )

Perhaps a test to see what chain we are in, or if the MAC information is 
valid, would be a better solution there...  A quick 'fix' should be to 
comment out lines 292 and 304, (referring to ipt_LOG.c in kernel 2.4.19 
source) the outer if construct mentioned above, or just removing the "&& 
!out".  With that gone, (and a kernel recompile :^) it should ALWAYS 
include "MAC=" in every log entry (or all that are not originating on 
the box itself, in the second suggestion), and the inner if construct 
should cause it to log simply a space for the MAC if the data is invalid 
or not available.

I'd like to see it actually log "in-MAC:" and "src-MAC:" separately, and 
am certainly up to the coding, but really don't want to get into kernel 
rebuilding at the moment.  If someone else wants to, feel free, and I 
can offer a rewritten ipt_log_target() function if desired.  Otherwise 
I'll try to keep it in mind, and might get to it in a few weeks.  (I 
just built a dedicated [sort of] gateway server for my home network, and 
eventually will roll a custom kernel for it... I also just moved, and am 
still living mostly out of boxes...)

I have a vaguely related question, if anyone has the answer.  The actual 
information in the "MAC=" field of a LOG entry confused me at first, 
being composed of 14 colon-separated elements.  Finally I realized it is 
listing the MAC of the firewall box's interface that accepted the 
packet, followed by the MAC of the originating interface, but this is 
followed by ":08:00" as well.  What does this signify, if anything?  If 
this is documented somewhere I apologize, because I have NOT RTFM on 
this matter... :^)

j



