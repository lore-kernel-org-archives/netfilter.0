From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Measuring traffic that goes thrugh a specific IP
Date: Sun, 9 Feb 2003 19:32:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302091932.11514.netfilter@newkirk.us>
References: <isapiwc.433ab781.5d1d.3e3d9787.496f4.ad@postur.simnet.is> <200302060039.58779.netfilter@newkirk.us> <isapiwc.433ab781.55d.3e425613.69620.b1@postur.simnet.is>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <isapiwc.433ab781.55d.3e425613.69620.b1@postur.simnet.is>
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
To: gummi7@simnet.is, netfilter@lists.netfilter.org

On Thursday 06 February 2003 07:33 am, gummi7@simnet.is wrote:
> "If you mean that the specific IP is simply a router somewhere that
> the traffic 'might happen' to pass through in its travels" That's
> exactly what I want to do :(
> I can always find out if a packet passes trough that specifec IP(the
> one I want to measure, therefore being internatoinal) by using a tool
> like DOS's "tracert", doesn't that help? Do you know of a program for
> linux that does what I am trying to do?

"traceroute" is the Linux equivalent of "tracert".  It will trace a route=
=20
to a given IP, and note all the IP's along the way.  It doesn't let you=20
measure traffic from your box that flows through a given IP, though, and=20
doesn't assure that your traffic actually follows that exact route.

j



