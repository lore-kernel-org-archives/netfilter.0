From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Protecting against DoS
Date: 09 Dec 2003 19:16:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070993798.18225.96.camel@kermit>
References: <9659.200.48.142.50.1070997074.squirrel@www.netfids.com>
	 <1070992891.1867.19.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070992891.1867.19.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: Geffrey =?ISO-8859-1?Q?Vel=E1squez?= <g_netfilter@netfids.com>, Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Die, 2003-12-09 um 19.01 schrieb John A. Sullivan III:
> > > echo 1 > /proc/sys/net/ipv4/tcp_syncookies -- if you have not compile=
d
> >=20
> >=20
> > Is that valid for forwarded packets? or only destinated to the firewall=
?
This is valid only for local packets.

> We have avoided using these /proc settings for just that concern - that
> they are mostly for the gateway itself and not for the devices being
> protected by it whether it is anti-spoofing with rp_filter or protecting
> against syn_floods.  Is this assumption of ours true? Thanks, all - John
Actually it depends. Most just concern local packets, but
rp_filter and accept_source_route for example tests for all packets.


Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

