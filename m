From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Re: FORWARD packet problem
Date: Thu, 20 Jul 2006 15:50:11 +0200
Message-ID: <44BF8A13.2010205@darkstar.nom.za>
References: <44BE4BCE.8060509@darkstar.nom.za>
	<44BE8385.4080509@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44BE8385.4080509@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter <netfilter@lists.netfilter.org>

Pascal Hambourg wrote:

> Hello,
>
> Paulo Andre a =E9crit :
>
>> I have a multiple isp fw
>> eth0 =3D int
>> eth1 =3D default isp
>> eth2 =3D sec isp
>>
>> when I try and make a connection to and internal server via the eth2=20
>> , the packet appears on the PREROUTING table, and then not on FORWARD=20
>> , anyone have any ideas?
>
>
> I guess there is a default route via eth1.
> If so, first check that /proc/sys/net/ipv4/conf/eth2/rp_filter=3D0 else=20
> the input routing, which takes place between PREROUTING and INPUT or=20
> FORWARD, may drop incoming IP packets on eth2 whose source address is=20
> not routed out via eth2 as a protection against IP spoofing.
>
>
Thanks Pascal, that fixed it.
Would I have to use CONNMARK and MARK to get connections leaving the=20
correct interface?

Paulo


