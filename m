From: Thomas Lussnig <lussnig@smcc.net>
Subject: Re: kernel 2.6 IPsec and netfilter
Date: Mon, 29 Mar 2004 14:33:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4068179D.1030509@smcc.net>
References: <4068040C.AA93F507@india.hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4068040C.AA93F507@india.hp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: Devaraj Das <ddas@india.hp.com>

Devaraj Das wrote:

>Hi,
>I wanted to know whether there is a working solution for the issue that
>was discussed sometime back:
>http://www.spinics.net/lists/netfilter/msg22099.html
>In short is there any solution to enable blocking selective ports in a
>machine running Linux 2.6.0 + in-kernel ipsec.
>I would be very helpful if I can get a working solution or some
>information on a possible solution.
>Thanks,
>Devaraj.
> =20
>
Hi,
if you look at ipsec from Linux-2.6.0 you would have noticed that you def=
ine
SRC-IP/SRC-PORT -- DST-IP/DST-PORT this mean you question imply the=20
following setup:

1. You allow any port combination to go via the ipsec tunnel
2. You have ports that should not go via the ipsec tunnel wich you allow=20
via ipsec
3. Now this ports should be filtered on iptables layer
- possible at prerouting/mangle
+ define the correkt ipsec config

Gru=DF Thomas Lu=DFnig

