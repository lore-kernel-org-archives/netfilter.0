From: felix@crowfix.com
Subject: Ignorance about combining two net connections
Date: Sun, 14 Oct 2007 05:37:03 -0700
Message-ID: <20071014123703.GA30106@crowfix.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a computer out in the boonies where access is of two types:
dialup and satellite.  The computer has a static IP address for the
dialup because it has its own domain and needs that for SMTP service.
The satellite can't supply static addresses, only DHCP, so can't be a
mail server.

I have been trying to figure out how to combine the two in the
firewall so it sends everything to the satellite connection except
SMTP and maybe ssh.  I figure SMTP out has to come from the static IP
address to avoid being thought spam, and perhaps ssh too.  What I am
stumped on is exactly how to split this traffic at the firewall
between the static and dynamic connections.

I used to be a C programmer, wrote socket code, understood it pretty
well, but I have been doing so much Perl the last few years that bit
rot has set in, and I am afraid now that I remember just enough to be
dangerous.  For instance, I know that when a client connects to a
remote server's port 25, when the server accept()s the connection, it
assigns a new temporary port to that connection.  But I forget the
details, and rereading Stevens is a frustrating trip down memory lane.

Suppose I have an iptables rule which sends all outgoing traffic with
a destination port of 25 down the static pipe.  What happens when the
server switches ports?  The client will send subsequent packets to a
non-25 port and they will not be sent down the static pipe -- right?
Will the remote server notice or even care?  The packets will have the
proper destination address and port, the right sequence number, etc,
but what will happen to the source address?  I assume the internals of
the kernel must handle the translation so that return packets aren't
lost, but I never did know a lot about that end of things.

Incoming to the local SMTP server doesn't need any attention, right?
What happens when my server accept()s the connection and changes the
port in use -- will that switch to the satellite connection OK?

Or is iptables smart enough to keep track of the packets and know they
are connected?  Does it only need the rule for new packets?

I am really out of my depth these days on these nitty gritty details,
and any advice will be greatly appreciated.  Without the proper
firewall routing of these two, I have to switch them manually for
software upgrades, any serious browsing, etc, but I have to make sure
it is on dialup to get email.

-- 
            ... _._. ._ ._. . _._. ._. ___ .__ ._. . .__. ._ .. ._.
     Felix Finch: scarecrow repairman & rocket surgeon / felix@crowfix.com
  GPG = E987 4493 C860 246C 3B1E  6477 7838 76E9 182E 8151 ITAR license #4933
I've found a solution to Fermat's Last Theorem but I see I've run out of room o
