From: "James B. Hiller" <jhiller@visi.net>
Subject: linux-2.6.9-rc1 compilation and configuration issue
Date: Sun, 5 Sep 2004 19:18:57 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409052318.i85NIvUX003634@bassett.home.org>
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
To: netfilter@lists.netfilter.org

Hi list!

Hope someone in netfilter-land will take pity on the village idiot here,
and explain what I'm seeing.  It's either bugs or a stupid-user stupid
selections of kernel netfilter compilation options.

I'll pose my questions first, then provide some (hopefully) useful background
and observation info.

Questions (all related to linux 2.6.9-rc1):

a.  Should it be the case that by simply selecting Networking Support,
Networking Options, Network Packet Filtering, Netfilter Configuration
(all just configurator choices), and finally Connection Tracking (i.e.
choosing Y for it, but none of the subordinate protocol choices) - and
NO other netfilter options - that a compilation error should result?
I did, and it does.  Is this a bug, or is there known to be some other
set of one or more options that I would have to select in order to not
get a compilation error?

b.  Should it further be the case that the ONLY netfilter option that can be
selected that allows for a clean compile given (a) is Full NAT?  I tried
everything else, and this is all that allows an error-free compile given
(a).  That is, iff (Full NAT = 'Y') && (Connection Tracking = 'Y'), I get a
clean compile, regardless of what other netfilter/connection tracking or
netfilter/Full NAT settings I have as 'Y'.

c.  Finally, should it be the case that if I select ONLY these two options,
or any other set of options (such as 3 of the connection tracking protocol
options; a robust set of match support options, and one or two of the NAT
options; and every subset of these that I tried, which is many), that I
should expect my system to more or less stop responding to any keyboard
input, and fail to cause most (but not all, right away) display updating
to stop; and eventually (within a few minutes) expect everything on the
system to stop?  I did, and it does, and I am sore confused.

I am confused for the following reasons (observations):

1.  I am using the exact same .config that I used for 2.6.8.1 and all the
related -mmX releases, as modified by the 'make oldconfig' action at each
version promotion and accepting only the default answer for the few new
options introduced across those promotions.  ALL kernel versions previous
to 2.6.9-rc1 worked with this more-or-less identical netfilter configuration,
back through around 2.4.20 (all regular tree and -mmX tree) when I first
started using netfilter a lot.

2.  On this particular box, I make no attempt to invoke a firewall-like script,
turn on any behaviors via echoing to /proc/sys/XXXX, or the like.  So as
far as I know, I have been/should be enabling kernel support for these
netfilter actions, but not actually invoking any.  Thus, I'm at a loss to
understand why a kernel configuration that worked before stops working now,
and when I roll back all useful options other than turning connection
tracking on, it won't even compile right.

I've got copies of each of my various .config files at each step, and can
easily recreate them, and the situations described, for each kernel version.
Just not attaching them now until some kind soul says they need to inspect
them, so as to not clog the list.

Please let me know, off-list if more appropriate, what's likely happening
here - whether I'm seeing bugs that are worth reporting, or whether I'm
simply ignorant of how to correctly select a proper set of options relative
to 2.6.9-rc1.  Or maybe some bug in previous versions that let me operate
in a stupid configuration was fixed with this release, and I'm now affected
by my all-along stupid choices.

One last piece of context:  The box on which I'm doing this is itself one
node on a wireless LAN, the gateway/router/WAP for which is another linux box
running 2.6.0 and the firewall script found in the IP-Masquerade-HOWTO (as
published prior to the current Nov 03 release of the HOWTO), as well as NAT as
found in 2.6.0.  I know one solution would be to simply not configure netfilter
on this box that is an internal node.  However, I do have reasons that I prefer
to keep it configured as closely as possible to the gateway node (the
differences being those options that are more newly available in more recent
kernel versions, which, up until the advent of 2.6.9-rc1, seemed to be not
an issue).  More importantly, if what I am staring at is bugs, then I would
like to properly report them for resolution.

Thx!
jbh

