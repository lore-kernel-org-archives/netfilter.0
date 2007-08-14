From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: not [!] rule is not working
Date: Tue, 14 Aug 2007 12:48:08 +0200
Message-ID: <46C18868.7050306@freemail.hu>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
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
To: pankaj jain <jainp1979@gmail.com>
Cc: netfilter@lists.netfilter.org

pankaj jain =EDrta:
> Hi,
> I was trying to drop arp packets such that only specific interface
> should answer the arp requests.
> I added following rules in input chain.
> -j DROP -i !eth1 -o * -d 10.19.1.102 --opcode 1 , pcnt=3D0 -- bcnt=3D0
> -j DROP -i !eth2 -o * -d 10.19.51.102 --opcode 1 , pcnt=3D0 -- bcnt=3D0=

>
>  =20
I think that this should be in THIS form:

-j DROP ! -i eth1 ....
> as packet count suggests these are not matching against any packet.
> when I do arping from other machine to the 10.19.1.102 (assigned to
> the eth1 interface)
> arp requests are responded from eth0 (ip-10.19.0.102).
> why the rules are not having any effect
Swifty


