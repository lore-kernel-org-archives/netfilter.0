From: Unknown <unknown@unknown.invalid>
Subject: Re: could someone translate these rules inot plain english
Date: Thu, 22 Jan 2004 12:19:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <28960.7509891086$1074792233@news.gmane.org>
References: <33682.66.65.52.125.1074751856.squirrel@sojourn.dyndns.org> <400F6EF4.2060608@lintelsys.com.au> <34137.66.65.52.125.1074768489.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <34137.66.65.52.125.1074768489.squirrel@sojourn.dyndns.org>
Content-Disposition: inline
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
To: Technical <technical@sojourn.dyndns.org>, netfilter@lists.netfilter.org

On January 22, 2004 05:48 am, Technical wrote:
> > Technical wrote:
> >> -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> > For this chain (presumably packets inbound to the network), accept any
> > packets that are part of established TCP connections (ie: a SYN packet
> > for the connection has gone out from the network), or related to UDP
> > packets that have gone out through the firewall.
> >
> >> -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
> >
> > Otherwise, reject the packet by sending back an ICMP message telling the
> > remote host that communication with its intended target is
> > administratively prohibited.
> >
> >
> > HTH
> > Alex Satrapa
>
> If the default is that iptables to reject all packets that cannot not be
> deall with any of the previous rules, why would somemone use the last
> rule??  am I missing something??

	The reply with host-prohibited is used to send  a different ICMP response 
	than would normally be sent (policy DROP doesn't reply) ... I believe also that the core tables in a 
	RH firewall are *not* set DROP -- they do that in the user chains they 
	create. .... but thats hearsay so I don't count it 100% accurate.



	Alistair.

