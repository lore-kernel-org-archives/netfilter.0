From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problems with Routing and masquerading
Date: Wed, 31 May 2006 09:01:16 +0200
Message-ID: <447D3F3C.3090203@plouf.fr.eu.org>
References: <447C57E8.3050005@multitech.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <447C57E8.3050005@multitech.co.in>
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

Hello,

Vinod Chandran a =E9crit :
>=20
> I have a linux box which balances load between two interfaces ( say WAN=
1=20
> and WAN2). I have masquerading on for any request coming from LAN to th=
e=20
> outside world.
>=20
> The setup is in such a way that WAN1 drops packets with source ip=20
> belonging to WAN2's network and viceversa.
> For some strange reason, I find that packet coming out from the WAN=20
> interface has source address of WAN2 and thereby getting dropped.
[...]

If you use MASQUERADE and alternate routing tables based on source=20
address or fwmark, try to use SNAT instead if possible. MASQUERADE does=20
not work well with advanced routing.

