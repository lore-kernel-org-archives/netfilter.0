From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables wishes
Date: Tue, 1 Apr 2003 09:22:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304010922.19125.netfilter@newkirk.us>
References: <200304011158.AA220332250@klintan.se>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304011158.AA220332250@klintan.se>
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
To: micke@klintan.se, netfilter@lists.netfilter.org

On Tuesday 01 April 2003 04:58 am, Michael Klinteberg wrote:
> ---------- Original Message ----------------------------------
> From: Joel Newkirk <netfilter@newkirk.us>
> Reply-To: netfilter@newkirk.us
> Date: Tue, 1 Apr 2003 03:41:48 -0500

> >I was curious to hear what people might have as a 'wishlist' for
> >iptables/netfilter capabilities.  Every once in a while something
> > comes
> >up here that simply doesn't seem to have a good solution.
> >My hope is that many of our personal wishes may already be
> >possible, and
> >by voicing them someone who has a solution may post it.  And for

> >2 - completely separate netfilter logging from kernel log
> > streams.  (not
> >just redirecting infrequently-used kernel streams, but actual
> >dedicated netfilter streams)
>
> Ohh yes!!! This is also "a must have". An extended to this yould
> be to log to diffrent files for diffrent rules. Something like
> iptables -A INPUT -s bad.host.net --log-
> file /var/log/netfilter/bad.hosts -j LOG

That can be 'fudged' right now by using --log-level debug and --log-level=
=20
notice, for instance, then redirecting kern.=3Ddebug to one file and=20
kern.=3Dnotice to another from /etc/syslog.conf.  Both streams usually=20
have very little traffic.

j


