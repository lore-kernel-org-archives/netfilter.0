From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Management of bridged iptables
Date: Tue, 26 Apr 2005 12:33:32 +0200
Message-ID: <1403218a05042603336a6fff29@mail.gmail.com>
References: <ffe712837a51442e9ab369947e567ab7@ebasedsecurity.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ffe712837a51442e9ab369947e567ab7@ebasedsecurity.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: traef06@ebasedsecurity.com
Cc: netfilter@lists.netfilter.org

You can give the firewall an IP address, on any interface, whether
part of the bridge or not part of the bridge.
This will still keep the firewall stealthy (not shown in traceroutes),
as that IP is not a gateway for any server !!

On 4/26/05, traef06@ebasedsecurity.com <traef06@ebasedsecurity.com> wrote:
> I've been scouring Google searches looking for an answer. If this is the =
wrong forum, please forgive me.
>=20
> I want to be able to setup iptables and I guess ebtables for a bridged fi=
rewall. My problem is that I also need to be able
> to manage this remotely like with ssh or something.
>=20
> How do I do this and still be able to maintain a "stealthy" firewall?
>=20
> Thank you in advance for any help.
>=20
> Thomas J. Raef
> e-Based Security, Inc.
> "You're either hardened, or you're hacked!"
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

