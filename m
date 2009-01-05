From: Indiana Epilepsy and Child Neurology <BrainChild@Skyler.com>
Subject: Q: iptables terminating targets
Date: Mon, 05 Jan 2009 11:24:35 -0500
Message-ID: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com>
Reply-To: BrainChild@Skyler.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Background: My home network had a Windows 2000 machine connected to a
cable modem, sharing the internet connection with the other computers
at home.  That computer died and I decided to replace it with a Debian
box I had.  I did some searching on firewalling and nat and tried to
follow some of the iptables examples I found.  When that didn't work I
decided I needed a better understanding of iptables, and started
studying the man page and various explanations I found on the web.

Here's what I don't understand: From what I read, terminating targets
like ACCEPT and DROP stop consideration of any further rules in any
tables and chains.  It also seems like all the built-in chains have a
policy of ACCEPT by default, and the policy target is effective if no
rules match in the chain.  I have seen no way to _remove_ a policy
from a chain - only _change_ the policy target.  This seems to lead to
the (obviously false) conclusion that only one built-in chain will
ever be considered - the first one.  If a rule doesn't terminate, the
policy will!

Does an ACCEPT or DROP target as a _policy_ behave in a
non-terminating way where in a rule they are terminating?  Or maybe,
"terminating" only means no more rules in the current built-in chain
get considered, rather than no more rules in _any_ chain?  Something
else?

IMHO it would be a good idea for the man page to clarify this.  I'm
stuck.
