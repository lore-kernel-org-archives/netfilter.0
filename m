From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: How to set up
Date: Fri, 23 May 2003 09:44:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DC6@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: tr-huso <tr-huso@online.no>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Ack!

Talk about asking for everything all at once... I digress.

Rule 1 of firewalls is to never have any services on the firewall that
are not absolutely necessary. Of course if you are poor just like
everyone else I guess you have to bend that rule.

If you are putting tons of services on the firewall, you have to make
sure that the ones that are used for your local network don't get to the
internet!

Samba may seem fine now, but when some nasty hacker wipes out all your
shares you won't be so happy about having it! (SMB: Ports 137-139
tcp/udp; Port 445 tcp)

Make sure all default services in the Linux box are turned off, or a re
restricted from internet tampering, like Portmap, etc..

Patch all services that you will be running to the latest, greatest, and
most secure version.

When writing scripts, I can't recommend using person xyz's scripts. I
have always been of the impression that by learning about how iptables
or other tools work, you become more aware of really important issues of
how firewalls work. Read tutorials that cover iptables to make sure that
there aren't any "They can do that"?'s or "I never knew that"!'s.

As for monitoring software, I am incompetently bad at implementing any
systems monitoring tools so I can't offer any advice with that. I am
sure you can do a search and come up with tools like Tripwire or IDS's.
Running tools like Nessus is also a good idea when implementing a sanity
check on your firewall.


-----Original Message-----
From: tr-huso [mailto:tr-huso@online.no]=20
Sent: Friday, May 23, 2003 6:38 AM
To: Netfilter Mailing List
Subject: How to set up

Hi group.

I'm new to this group, so here is my setup:
A linux box (Red Hat 7.3) that is connected to the www and also works as
a=20
router for the rest of the network. It also runs an Apache webserver,
and will=20
also run a proftpd ftp-server soon.=20
A Windows XP machine that is used for anything else, connectes to the
internet=20
through the linux. Thanks to Samba the windows machine has some network=20
directories on the linux box.

Now I want to secure this thing, and I also want to log what's happening
on=20
the linux-box.

I've read a few articles on iptables, and read a few newsgroup-posts
related=20
to the topic.

I've also seen a few scripts that I might use, if someone can point out
which=20
one to use, I'm more than happy...

yours,

Trond




