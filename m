From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: bridging with iptables (was no subject)
Date: 29 Jun 2002 01:50:08 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1025308208.860.9.camel@tux>
References: <200206281739.AA386531398@mail.ev1.net> 
	<20020628225316.KGEW295.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020628225316.KGEW295.mta03-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: Netfilter <netfilter@lists.samba.org>

On Sat, 2002-06-29 at 00:53, Antony Stone wrote:

> > Yes, look at the bridge-netfilter project:
> > http://bridge.sourceforge.net/
> 
> Hmmm.   Good.
> 
> I know this is getting a bit off-topic now, but does anyone know if you can 
> combine bridging with IPsec ?   ie have two bits of the same network address 
> range bridged across a VPN link ?
> 
> I've only ever set up IPsec links with a routing table pointing to the 
> 'other' network across the VPN link...

Use bridge + CIPE for that.

I've never used it but I've heard that it works fine, it's not IPsec but
another encrypted VPN.

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

