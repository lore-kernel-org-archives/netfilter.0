From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: How to set up
Date: Sat, 24 May 2003 11:52:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A019240@wardrive.citadelcomputer.com.au>
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

Monitor what? linux activity... ha ha.. don't expect any surprises.
Usually /var/logs/ directory contains syslogs of what's going on but =
usually it's the innocent services that are logging. Hackers can bypass =
this or wipe it completely to cover their tracks.
Kernel mode root kits go further by not showing up in the files list or =
"ps -ef" as well.. the root kit is embedded to the kernel so it blocks =
what it doesn't want the end user/administrator to see hence they have =
the freedom to sit there and not be noticed.

So your best bet it to stop it from ever happening at all otherwise it's =
too late.
I can't stress how important it is to do what Daniel Chemko said as to =
patch and get the latest of everything. This is really only towards the =
services you are exposing to the internet. ie. webserver, mail =
server..etc.etc.. even NATted machines inside must do this.. because =
they break into a NATted machine then they see everything else inside =
the network..

Use tripwire to monitor changes in files that shouldn't have been =
changed.
Find a website who can scan your ports for you.. some do it for free but =
then you get these annoying emails to purchase their services monthly.. =
he he (put a block on sendmail for their smtp server. he he)..



-----Original Message-----
From: tr-huso [mailto:tr-huso@online.no]
Sent: Friday, May 23, 2003 11:38 PM
To: Netfilter Mailing List
Subject: How to set up


Hi group.

I'm new to this group, so here is my setup:
A linux box (Red Hat 7.3) that is connected to the www and also works as =
a=20
router for the rest of the network. It also runs an Apache webserver, =
and will=20
also run a proftpd ftp-server soon.=20
A Windows XP machine that is used for anything else, connectes to the =
internet=20
through the linux. Thanks to Samba the windows machine has some network=20
directories on the linux box.

Now I want to secure this thing, and I also want to log what's happening =
on=20
the linux-box.

I've read a few articles on iptables, and read a few newsgroup-posts =
related=20
to the topic.

I've also seen a few scripts that I might use, if someone can point out =
which=20
one to use, I'm more than happy...

yours,

Trond




