From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: dnat to multiple destination
Date: Wed, 26 Oct 2005 16:13:33 +0200
Message-ID: <435F8F0D.1020606@mnemon.de>
References: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

=B0=B0 =FE=E3=FE=E3 =DF=EAr=FB=E2=F1g =B0=B0 wrote:
> hi there,
>=20
> recently i read iptables man page,
> in the DNAT part :
> You  can  add  several --to-destination options.  If
> you specify more than
> one destination address, either via an address range
> or multiple --to-des=AD
> tination  options,  a simple round-robin (one after
> another in cycle) load
> balancing takes place between these adresses.
>=20
> in my mind, it sounds like:
> iptables -A PREROUTING -s xxx.xxx.xxx.xxx -p tcp
> --dport 80 -j DNAT --to-destination aaa.aaa.aaa.aaa
> --to-destination bbb.bbb.bbb.bbb


Try adding -t nat

