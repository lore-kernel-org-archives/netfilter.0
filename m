From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dns server
Date: Thu, 6 Jun 2002 14:33:18 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061333.g56DXZA31052@vulcan.rissington.net>
References: <1420507267.20020606152231@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1420507267.20020606152231@gmx.de>
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
To: IP-Tables Maillingliste <netfilter@lists.samba.org>

On Thursday 06 June 2002 2:22 pm, Corin Langosch wrote:

> Hi,
>
> im running a dns server here and i'm not sure if the following rule is
> enough to allow dns queries from everywhere:
>
> $IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT

You should also allow TCP port 53.   DNS uses both.


Antony.

