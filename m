From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Rate my rules. Take a look ICMP only
Date: Fri, 7 Feb 2003 18:25:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302071825.49278.netfilter@newkirk.us>
References: <20030207231105.50898.qmail@web40201.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030207231105.50898.qmail@web40201.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

On Friday 07 February 2003 06:11 pm, SBlaze wrote:
> Recently I created what I think are some pretty decent ICMP rules to
> allow me to trace and ping outside of my network but not allow the
> same kind of activities in...I think I did a pretty good job after
> reading the tutorial
>
> You guys be the judge and let me know if there was better way for this
> to be done.
>
> iptables -A INPUT -p ICMP -i eth0 -m state --state NEW  -j DROP
> iptables -A INPUT -p ICMP -i eth0 -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> iptables -A OUTPUT -p ICMP -o eth0 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT

If you have DROP policy for INPUT you don't need the first rule, and the=20
third should work just as well without any state matching at all. (The=20
only additional state allowed through that ways is 'INVALID' which you=20
should explicitly DROP if you are concerned about it) =20

Regardless, you seem to have grasped how the state matches work, and how=20
to use them to allow only desired connections.  These rules WILL impose=20
the limitations you desire, so that rates as a success.

j


