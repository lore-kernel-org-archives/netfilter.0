From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: trying to document/understand the iptables kernel config options
Date: Mon, 7 Apr 2003 16:19:38 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304071559390.20173-100000@dell>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  for those of you who are playing with a fairly recent
2.5 kernel (and maybe even the current 2.4 kernel), i'm
attempting to reorganize the netfilter config menu options
so that they make more sense.  (if you've seen a *really*
recent 2.5 kernel, the new filesystems menu is my work.)

  so i'm going to ask a bunch of potentially dumb questions
about how some of those options depend on other options
in this email and subsequent ones.

  to start with, i want to document the options based on what
is needed for *minimal* filtering and work up from there.

  first, if you take a look at the overall netfilter kernel
config options, there are five main submenus:

  Connection tracking
  Userspace queueing
  IP tables support (the fundamental one, should be first)
  ARP tables support
  ipchains/ipfwadm

  now, questions and comments about the above (feel free to
chime in if you want your suggestions to influence what the
final menu looks like).

1) "IP tables support" should go at the top of the list.  well,
   duh.

2) ipchains/ipfwadm will be relabelled as "Legacy systems",
   or something like that.

3) "Userspace queueing", being experimental, can move to 
   the bottom of the menu.


  so now, the first question or two.  first, even after you
select "IP tables support", you can deselect *everything*
inside that menu.  if you do that, is there *anything* you
can do in terms of netfiltering?  i mean, does that single
selectable "IP tables support" option have any functionality
all by itself?

  second, i notice that even if you deselect "IP tables
support", you can still independently select the option
"Connection tracking (required for masq/NAT) above it.
without IP tables support, what is the value/function of
the Connection tracking option?  what can you still do
with it?

  more questions to come.

rday


