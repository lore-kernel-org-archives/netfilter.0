From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: How to prevent smurf atacks?
Date: Wed, 5 Jun 2002 15:14:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605151409.B2090@funkyjesus.org>
References: <20020605145530.A2090@funkyjesus.org> <Pine.LNX.4.21.0206051559001.3749-100000@dns.toxicfilms.tv>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0206051559001.3749-100000@dns.toxicfilms.tv>; from solt@dns.toxicfilms.tv on Wed, Jun 05, 2002 at 04:04:06PM +0200
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Wed, Jun 05, 2002 at 04:04:06PM +0200, Maciej Soltysiak wrote:
> > A Smurf attack is effective just by the sheer weight of traffic sent to
> > you, rather than because of any weakness in your host, so unfortunately
> > there is nothing you can do on your host to harden it against this type
> > of onslaught.

> How about:
> - blocking ICMP directed at broadcast addreses?

Yes, but that stops you being a source of a smurf attack, rather than the
victim.  I think the original poster didn't want to be a victim, which I
don't think you can prevent bar blocking ICMP from broadcast addresses at
the borders ( where "broadcast addresses" isn't as easy to determine as I
imply ).

Of course, stopping yourself being a source of the problem is good too :)

> - setting /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts to 1

:)

> - adding anti-spoofing rules, smurf attacks may have spoofed IPs, and that
>   is when the attack gets its sharp edge. It may be spoofed as if it is
>   originating from your network.

No they won't, they'll be spoofed as the IP address of the victim.  Well,
unless one of your IP addresses is the intended victim, but that strikes me
as unlikely - and it'd be hard to spot without MAC address checking rules
anyway.

> The same goes for fraggle attacks, those are UDP brodcast packets to
> unserved ports with spoofed IPs.
> 
> If the destination and source IPs are in the same subnet, we can have
> the net attacking itself.
> 
> I guess that is what we are talking about.

Sort of.  I think.  Probably.  Not that this is another vague term or
anything :)

-- 
FunkyJesus System Administration Team


