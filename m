From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: clearing dont-fragment bit
Date: 10 Oct 2003 07:13:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065762785.1650.17.camel@kermit>
References: <20031009134311.GA25685@oasis.frogfoot.net>
	 <1065716586.5873.23.camel@kermit>
	 <20031009165049.GA4043@oasis.frogfoot.net>
	 <1065719570.5873.31.camel@kermit>
	 <20031009181123.GA8403@oasis.frogfoot.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031009181123.GA8403@oasis.frogfoot.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Abraham van der Merwe <abz@frogfoot.net>
Cc: Netfilter Discussions <netfilter@lists.netfilter.org>

Am Don, 2003-10-09 um 20.11 schrieb Abraham van der Merwe:
> Yes, I know, but as long as all the fragments have unique ids it shouldn'=
t
> matter. Also, if the packet is fragmented along the way under normal
> circumstances (i.e. DF=3D0), then the IP-ID field would have to be increm=
ented
> by the router fragmenting the packet.
True but Linux 2.4 clears the IP-ID field when sending a packet with the
DF-Bit set. You have to manually recreate a unique IP-ID field when
clearing the DF-Bit on the firewall. Even when the router increments
this field all packets will have the ID of 1. When defragmenting the
receiver does not know which fragment belongs to which packet.

Linux 2.4 is the only operating system I know of that shows this
behavior.=20

Cheers,

Ralf

--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

