From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: Strange ipfilter happenings
Date: Wed, 26 Dec 2007 23:22:19 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0712262215310.21102@mail3.jubileegroup.co.uk>
References: <37cc9b7a236ffeb8ed42521651430571@teqknow.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <37cc9b7a236ffeb8ed42521651430571@teqknow.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

First off, I don't think this is really a netfilter list problem.
It isn't something that iptables is doing without being bidden, it
doesn't do things like that.  You might be better off asking on some
general Linux/Fedora help forum.  I think you're going to need to do a
bit of reading to get to grips with this, having "Linux Firewall" -
whatever it is - plus SElinux plus rolling your own iptables firewall
sounds like a recipe for confusion if you aren't completely happy that
you understand it all.  I'm only stepping in here with some general
help because everyone else will be on holiday.  Anyway, here goes...

On Wed, 26 Dec 2007, Phil Leinhauser wrote:

> I have an FC6 install that is running Qmailtoaster. The QMT install
> made sure all firewalls were off and installed IPtables and put in a
> default config. Linux firewall and SElinux are both off.  ...  About
> 15 minutes or so, the iptables config reverts back to some older
> config!  ... I manually added a few random ports into the config
> file and the same thing happens, they are active for a little while
> but then the running config reverts to an older version.

I don't quite understand all of that.  I'm not sure what you mean by
"Linux firewall" - something in FC6? - and "iptables config file", and
I have no idea at all what you mean by "the iptables config".  Do you
mean for example the output of

iptables-save

or something like

iptables -L -n -v --exact --line-numbers

or are you looking at a file somewhere?  The kernel parts of iptables
keep tables of rules which are altered by commands given through the
iptables userspace binaries.  The two most commonly used such binaries
are called 'iptables-restore' and (unfortunately) 'iptables'.  You can
have a file which iptables-restore can read in order to set your kernel
tables to a given state.  I'm pretty sure FC6 uses iptables-restore as
delivered, but I don't know what's happened to your system since then.
Alternatively you can have a script which calls the 'iptables' binary
multiple times to add rules to the tables.  That might be the file
that you're talking about.  You can of course do both.  Carefully.
Usually, your system startup scripts use the iptables binaries to set
security policies, and that's that.  The kernel then accepts, drops or
logs as decreed in the tables.  I don't know much about SElinux, the
fact that it's around on your system might have some bearing on all
this even if as you say you think it's disabled - I just don't know.

Make sure that your system clock is synced to atomic time (e.g. using
ntpd, and by the way do that for every system you ever install).  Then
your system logs might possibly be useful.  Then note the time of when
things happen exactly.  Then find out what runs at those times.  Then
you have some evidence.  You might even have your culprit. :)

> I have also done an iptables-save and it appears to save the config
> with no errors but the iptables config file date stamp never
> changes.  Where or what is it saving?

Read the iptables-save manpage:

man iptables-save

That will tell you that iptables-save sends its output to STDOUT.

Unless you're telling it to save output to a file using redirection,
or unless you're not using the iptables-save utility with which I'm
familiar, it's going to send the output to your terminal (or screen,
or xterm, or whatever you gave the command from).

While you're about it, also look at

man iptables-restore

which _might_ be what's running when your rules get hosed.  But
if it is, something will be running it, it doesn't run on its own.

> I've been playing with this for weeks now

Your perseverance is commendable, but you should have asked sooner.

> I even uninstalled and reinstalled iptables.

Completely unnecessary, as I think you've discovered.

This is not something mystical that iptables is doing.  Your system is
doing it.  Probably a daemon that it's running.  Check your crontabs,
and the logs.  You might find something interesting in /var/log/cron
or something like that but I don't use FCanything so I can't be sure
if this stuff will be logged nor, if it is, where the logs will be.

--

73,
Ged.
