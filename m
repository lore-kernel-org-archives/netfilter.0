From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: trying to document/understand the iptables kernel config options
Date: Tue, 8 Apr 2003 04:00:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304080400.46995.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0304071559390.20173-100000@dell>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304071559390.20173-100000@dell>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>, iptables mailing list <netfilter@lists.netfilter.org>

On Monday 07 April 2003 04:19 pm, Robert P. J. Day wrote:

[snipped humiliating reminder of my oversight :^)]

>   so now, the first question or two.  first, even after you
> select "IP tables support", you can deselect *everything*
> inside that menu.  if you do that, is there *anything* you
> can do in terms of netfiltering?  i mean, does that single
> selectable "IP tables support" option have any functionality
> all by itself?

Yes.  If you select "IP tables support" but no further options within=20
that set, you can still perform filtering.  For example, you could still=20
ACCEPT or DROP based on source or destination IP.

>   second, i notice that even if you deselect "IP tables
> support", you can still independently select the option
> "Connection tracking (required for masq/NAT) above it.
> without IP tables support, what is the value/function of
> the Connection tracking option?  what can you still do
> with it?

I presume that netfilter would still track connections, and that=20
information would still be available through /proc/net/ip_conntrack=20
however.  Useful for accounting or logging from userspace perhaps.  I'm=20
not aware of any useful purpose it would serve.  Anyone else?

>   more questions to come.
>
> rday

j


