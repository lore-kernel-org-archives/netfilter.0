From: "matt" <matt@darcy.demon.co.uk>
Subject: syslogging firewall data to an external file
Date: Sun, 20 Mar 2005 21:01:34 -0000
Message-ID: <29279.0264510133$1111352429@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi all,

Apologies if this post is more a kernel/syslog post, but from what =
I=92ve read
part of it is netfilter.

I have a linux box that=92s has an iptables rule -A INPUT -j LOG =
--log-prefix
"FIREWALL:INPUT"

Which is basiclly my last rule, so if my other rules haven=92t been =
matched it
will log it into the syslog

My syslog config looks like this

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

So kernel warnings go to kern.log =96 mail alerts go to mail.log etc =
thus
keeping the actual syslog clean of anything other than core stuff. =
However
my syslog is getting flooded with firewall data. I=92ve read in the FAQ =
that
explains how the priority of the logging feature is used with syslog,
however I was wondering if there was anyway I could configure
netfilter/syslog to something like this

kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
netfilter.* /var/log/firewall.log

so that once again the syslog logs only =93core=94 data and all the =
general
netfilter jazz goes to the firewall.log, so that should I need to I can
study it, yet keeping the syslog clear.

Thanks,

Matt


--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.308 / Virus Database: 266.7.4 - Release Date: 18/03/2005
=20
