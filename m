From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 18:49:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302011849.12907.netfilter@newkirk.us>
References: <01CEA3A5B8B2D511890F0002A5870AEC5FB572@EXCHANGE>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC5FB572@EXCHANGE>
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
To: Khanh Tran <khanh@slc.edu>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

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

The MAC appears in the logs from the PREROUTING chains,=20
(mangle-PREROUTING and nat-PREROUTING) and INPUT chains (mangle-INPUT=20
and filter-INPUT) but not FORWARD chains (mangle-FORWARD and=20
filter-FORWARD).  I've never understood why, but honestly didn't care=20
since it never affected me.  It's not a valid concept in the OUTPUT=20
chains, btw, and would be valid only on some traffic in POSTROUTING.

The MAC information IS available in the FORWARD chains, since it is valid=
=20
to match "-m mac --mac-source" there.  A quick check in ipt_LOG.c turns=20
up the test "if (in && !out)" being performed in ipt_log_target(), so=20
that if the out interface is already known (IE, forward, output or=20
postrouting chains) then it will not print anything.  (This is followed=20
by the comment "MAC logging for input chain only." )

Perhaps a test to see what chain we are in, or if the MAC information is=20
valid, would be a better solution there...  A quick 'fix' should be to=20
comment out lines 292 and 304, (referring to ipt_LOG.c in kernel 2.4.19=20
source) the outer if construct mentioned above, or just removing the "&&=20
!out".  With that gone, (and a kernel recompile :^) it should ALWAYS=20
include "MAC=3D" in every log entry (or all that are not originating on=20
the box itself, in the second suggestion), and the inner if construct=20
should cause it to log simply a space for the MAC if the data is invalid=20
or not available.

I'd like to see it actually log "in-MAC:" and "src-MAC:" separately, and=20
am certainly up to the coding, but really don't want to get into kernel=20
rebuilding at the moment.  If someone else wants to, feel free, and I=20
can offer a rewritten ipt_log_target() function if desired.  Otherwise=20
I'll try to keep it in mind, and might get to it in a few weeks.  (I=20
just built a dedicated [sort of] gateway server for my home network, and=20
eventually will roll a custom kernel for it... I also just moved, and am=20
still living mostly out of boxes...)

I have a vaguely related question, if anyone has the answer.  The actual=20
information in the "MAC=3D" field of a LOG entry confused me at first,=20
being composed of 14 colon-separated elements.  Finally I realized it is=20
listing the MAC of the firewall box's interface that accepted the=20
packet, followed by the MAC of the originating interface, but this is=20
followed by ":08:00" as well.  What does this signify, if anything?  If=20
this is documented somewhere I apologize, because I have NOT RTFM on=20
this matter... :^)

j


