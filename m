From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: How to log
Date: Tue, 25 Feb 2003 16:20:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302251620.36405.netfilter@newkirk.us>
References: <000401c2dd11$129f2f80$0200a8c0@klintan.local>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c2dd11$129f2f80$0200a8c0@klintan.local>
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
To: Michael K <micke@klintan.se>, netfilter@lists.netfilter.org

On Tuesday 25 February 2003 04:01 pm, Michael K wrote:
> When I uses the --jump LOG in iptables it logs to /dev/console. Read
> the man page for syslog.conf(5) and added "kern.warn /var/log/krnmsg".
> Restarted syslog; and still it logs to /dev/console.

You need to use "kern.=3Dwarn" to designate a target for kernel warning=20
messages.  You also, IIRC, need to make sure you don't have a kern.*=20
entry before it, or a *.warn.

> Can I prevent this from happening?

Possibly.  Check if you have a "kern.*" or any other entry going to=20
"/dev/console", and if you do you can comment it out.

> Is there another (better) way to log?

You can use the ULOG target, but you'll need to install a few userspace=20
programs to deal with that.  If all you want is to look through logs=20
occasionally for anything unexpected, or use the log to debug firewall=20
rules as you work, follow the suggestion below.

> Can't I use something like "iptables.* /var/log/iptables" so that I
> only get messages from iptables? (Did try it, byt didn't work)

You can get close to this on most systems.  With most stable-kernel=20
installations you have very few entries in the kernel debug stream, so=20
you can add the parameter "--log-level 7" to you LOG rules, and divert=20
"kern.=3Ddebug" in your syslog.conf file to an (almost) iptables-only log=
=2E =20
If you also use the "--log-prefix" parameter you can prepend a specified=20
string to each log entry from that rule, to help in reading the log.  A=20
useful example of all this is:

iptables -A FORWARD -j LOG --log-level 7 --log-prefix "Unexpected=20
Forward:"

As the last rule in the FORWARD chain.  If you have "kern.=3Ddebug=20
/var/log/iptables" in syslog.conf then "cat /var/log/iptables | grep=20
Unexp" would list out all the matching log entries.

> BTW: the system is Redhat 7.3

j


