From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: syslogging firewall data to an external file
Date: Sun, 20 Mar 2005 23:40:19 +0200
Message-ID: <423DEDC3.1000902@hotpop.com>
References: <20050320210235.0CBD0F9D7EF@mx2.hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050320210235.0CBD0F9D7EF@mx2.hotpop.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

matt wrote:

>Hi all,
>
>Apologies if this post is more a kernel/syslog post, but from what I=92v=
e read
>part of it is netfilter.
>
>I have a linux box that=92s has an iptables rule -A INPUT -j LOG --log-p=
refix
>"FIREWALL:INPUT"
>
>Which is basiclly my last rule, so if my other rules haven=92t been matc=
hed it
>will log it into the syslog
>
>My syslog config looks like this
>
>auth,authpriv.* -/var/log/auth.log
>*.*;auth,authpriv.none -/var/log/sys.log
>daemon.* -/var/log/daemon.log
>kern.* -/var/log/kern.log
>mail.* -/var/log/mail.log
>user.* -/var/log/user.log
>*.emerg *
>
>So kernel warnings go to kern.log =96 mail alerts go to mail.log etc thu=
s
>keeping the actual syslog clean of anything other than core stuff. Howev=
er
>my syslog is getting flooded with firewall data. I=92ve read in the FAQ =
that
>explains how the priority of the logging feature is used with syslog,
>however I was wondering if there was anyway I could configure
>netfilter/syslog to something like this
>
>kern.* -/var/log/kern.log
>mail.* -/var/log/mail.log
>user.* -/var/log/user.log
>netfilter.* /var/log/firewall.log
>
>so that once again the syslog logs only =93core=94 data and all the gene=
ral
>netfilter jazz goes to the firewall.log, so that should I need to I can
>study it, yet keeping the syslog clear.
>
>Thanks,
>
>Matt
>
>
> =20
>
Hello,

Use the ULOG (userspace logging) target and the ulogd deamon. That way=20
you may specify logging to a particular file (supports sql logging too).
More at: http://iptables-tutorial.frozentux.net/iptables-tutorial.html

regards,
Georgi Alexandrov

