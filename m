From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: problem with forward/nat
Date: Sun, 7 Mar 2004 08:57:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007d01c4045c$d9130060$0400a8c0@bradmorgan>
References: <200403071503.56728.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200403071503.56728.Antony@Soft-Solutions.co.uk>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

> >  Once you hit that rule, the only thing going past
> > are INVALID packets so the rest of the INPUT and OUTPUT chains aren't
> doing
> > anything useful.
> 
> No, the other rules are dealing with packets to interfaces other than lo.

Opps, I missed the lo!  That means there is no ESTABLISHED,RELATED rule for
the Ethernet traffic.  My suggestions remove the lo interface which fixes
that.

So for local traffic add the rule:

iptables -A INPUT -i lo -j ACCEPT

just after the drop of INVALID state packets.  Since I leave the OUTPUT
default policy as ACCEPT, I don't have an OUTPUT rule for lo but it would
probably be:

iptables -A OUTOUT -o lo -j ACCEPT

again placed just after the drop of INVALID state packets.



