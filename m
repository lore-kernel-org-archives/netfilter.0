From: <bmcdowell@coxhealthplans.com>
Subject: RE: iptables logs going to all ttys
Date: Tue, 14 Oct 2003 08:28:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731F41A0E@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org


If you're like me, and you've checked and re-checked your syslog.conf to =
no avail, you may want to try:

dmesg -n 1

I found that little tid-bit after three or four days of googling...

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Joel Newkirk
Sent: Monday, October 13, 2003 9:34 PM
To: lucas
Cc: iptables mailing list
Subject: Re: iptables logs going to all ttys


On Mon, 2003-10-13 at 18:58, lucas wrote:
> Morning all,
>=20
> I have the following in my firewall script, and to my knowledge this =
is=20
> meant to stop all logs from going to all ttys but this is not the case =

> and its a real *pain* in the ass.
>
> $IPTABLES -N drop-and-log-it
> $IPTABLES -A drop-and-log-it -j LOG --log-level info
> $IPTABLES -A drop-and-log-it -j DROP
>=20
> If someone could give me a hint as to what i have overlooked that =
would=20
> be much appreciated, thanks

Syslog configuration is probably what you missed.  check
/etc/syslog.conf.  Very likely you have something like:
kern.*      /dev/console
in there, which states that all kernel messages of whatever level will
be sent to /dev/console.

For myself, I disable the /dev/console setting, then add:
kern.=3Ddebug  /var/log/firewall
kern.=3Dwarning /var/log/firewalladmin

Unless you're running a custom kernel with debugging enabled, the first
channel (debug) should be almost empty of traffic, ideal for redirection
to a firewall-only log file with "--log-level debug".  Everything of
level 'info' or higher usually goes to /var/log/messages as well.

j



