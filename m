From: Daniel Bastos <daniel@dbastos.net>
Subject: Re: dns server
Date: Thu, 6 Jun 2002 11:00:17 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020606110017.A28416@laptop.dbastos.net>
References: <1420507267.20020606152231@gmx.de> <200206061333.g56DXZA31052@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <200206061333.g56DXZA31052@vulcan.rissington.net>; from Antony@Soft-Solutions.co.uk on Thu, Jun 06, 2002 at 02:33:18PM +0100
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

> > Hi,
> >
> > im running a dns server here and i'm not sure if the following rule is
> > enough to allow dns queries from everywhere:
> >
> > $IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT
> 
> You should also allow TCP port 53.   DNS uses both.

As I remember, when clients query the DNS Server
the port 53/tcp is used, and when your server 
queries other servers, it uses the port 53/udp.



Best Regards,
-- 
Daniel Bastos
System Engineer
http://www.dbastos.net
GPG/PGP: http://www.dbastos.net/pgpkey.txt

