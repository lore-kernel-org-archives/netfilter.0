From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: ULOGD and invalid timestamps
Date: Fri, 10 Sep 2004 11:23:26 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <2E314DE03538984BA5634F12115B3A4E62EB38@email1.mitretek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Steve Melo <smelo@communitytrust.ca>, netfilter@lists.netfilter.org

I have used kernel 2.6.7 with no problems.

I currently use kernel 2.6.8.1.


-----Original Message-----
From: Steve Melo [mailto:smelo@communitytrust.ca]=20
Sent: Friday, September 10, 2004 10:49 AM
To: Piszcz, Justin Michael; netfilter@lists.netfilter.org
Subject: Re: ULOGD and invalid timestamps

Piszcz,

Thank you for taking the time to look into my problem..  My system's
time
works, the output of the date command shows: "Fri Sep 10 10:43:35 EDT
2004".
You mentioned that you have been using ULOG since version 1.0 with no
problems in the timestamp feature, but i did see something in the
changelog
about a timestamp fix for version 1.02:

=3D=3D=3Dchangelog=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ulogd (1.02-1) unstable; urgency=3Dlow

  * New upstream release.
    - fixed timestamp printing in LOGEMU (closes: Bug#208506)
  * debian/patches/ulogd-version.patch:
    - this is really ulogd 1.02
=3D=3D=3Dend =
changelog=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Unlike yourself tho i installed from binary.  I wonder also if this
could be
because im running a 2.6.7 kernel.. what kernel do you use?


-thanx
steve

----- Original Message -----=20
From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
To: "Steve Melo" <smelo@communitytrust.ca>;
<netfilter@lists.netfilter.org>
Sent: Friday, September 10, 2004 9:41 AM
Subject: RE: ULOGD and invalid timestamps


I have never had a problem with the timestamp in any version of ulogd
since 1.00, 1.01 or 1.02.

What does the following show:

% date


Where did you obtain/how did you install ulogd?

I used the source in all three versions.




-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Steve Melo
Sent: Thursday, September 09, 2004 12:31 PM
To: netfilter@lists.netfilter.org
Subject: ULOGD and invalid timestamps

Greetings list,

I'm using the ulogd to log information and everything works great except
that everything that gets logged has a timestamp of "Dec 31 19:00:00".
I
would like to have the correct timestamp.

Here is my setup:
Debian Linux w/2.6.7-1-686 kernel (binary install)
ulogd Version 1.02
iptables v1.2.9

Here is my /etc/ulogd.conf:
# netlink multicast group (the same as the iptables --ulog-nlgroup
param)
nlgroup 1

# logfile for status messages
logfile /var/log/ulog/ulogd.log

# loglevel: debug(1), info(3), notice(5), error(7) or fatal(8)
loglevel 5

# socket receive buffer size (should be at least the size of the
# in-kernel buffer (ipt_ULOG.o 'nlbufsiz' parameter)
rmem 131071

# libipulog/ulogd receive buffer size, should be > rmem
bufsize 150000

# ulogd_BASE.so - interpreter plugin for basic IPv4 header fields
#                 you will always need this
plugin /usr/lib/ulogd/ulogd_BASE.so
plugin /usr/lib/ulogd/ulogd_LOCAL.so


#
# ulogd_LOGEMU.so - simple syslog emulation target
#
# where to write to
syslogfile /var/log/ulog/syslogemu.log
# do we want to fflush() the file after each write?
syslogsync 1
# load the plugin
plugin /usr/lib/ulogd/ulogd_LOGEMU.so


#
# ulogd_OPRINT.so: file for packet dumping
#
# where to write the log
dumpfile /var/log/ulog/pktlog.log
# load the plugin (remove the '#'if you want to enable it
plugin /usr/lib/ulogd/ulogd_OPRINT.so




