From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables wishes
Date: Tue, 1 Apr 2003 10:13:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304011013.28518.netfilter@newkirk.us>
References: <200304010341.48281.netfilter@newkirk.us> <1049192271.9857.49.camel@tux.rsn.bth.se>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1049192271.9857.49.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Tuesday 01 April 2003 05:17 am, Martin Josefsson wrote:
> On Tue, 2003-04-01 at 10:41, Joel Newkirk wrote:
> > Personally I have four:
> >
> > 1 - revamped LOG entry format, especially cleaning up MAC.
>
> see the next remark.
>
> > 2 - completely separate netfilter logging from kernel log streams.=20
> > (not just redirecting infrequently-used kernel streams, but actual
> > dedicated netfilter streams)
>
> use ULOG
> you can easily modify the format it uses for the logfile.
> that part of the source isn't complicated at all.

Thanks.  Digging further into ULOG is something that's been on my to-do=20
list for a while now.  I'm interested in setting up remote logging such=20
as is possible with syslog.  If necessity doesn't drive me to it sooner,=20
I'll probably attack this in a few months.

> > 3 - Ability to match "original DestinationIP" of a DNATted packet in
> > subsequent chains.  Useful with a single physical interface but
> > multiple IPs bound to it.
>
> Already there, look at the conntrack match (ipt_conntrack)

Wow.  Never found this before, but I see it in the source for the CVS=20
version I just downloaded, and after looking again I found it in the=20
Netfilter Extensions HowTo.  Thanks!

> iptables -A FORWARD -m conntrack --ctorigdst 1.1.1.1 -j ACCEPT

j


