From: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>
Subject: Re: STRING  module : Invalid argument
Date: Wed, 04 Oct 2006 12:56:32 +0200
Message-ID: <45239360.6060304@freemail.hu>
References: <45236AD9.4090300@freemail.hu>
	<53842.193.173.147.3.1159955117.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <53842.193.173.147.3.1159955117.squirrel@webmail.sterenborg.info>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

Rob Sterenborg =C3=ADrta:
> On Wed, October 4, 2006 10:03, G=EF=BF=BDsp=EF=BF=BDr Lajos wrote:
>  =20
>> Hi,
>>
>> fw1:~# iptables -v -A INPUT -j DROP -p tcp -m string --string "test"
>> DROP  tcp opt -- in * out *  0.0.0.0/0  -> 0.0.0.0/0  STRING match "te=
st"
>> iptables: Invalid argument
>>
>>    =20
Does it means that it fails at insertation of the rule into the chain,=20
doesn't?

> - You probably don't have the string module installed and/or loaded.
> - Kernel 2.6.18 is rather new (sep-2006) and iptables 1.2.11 is rather =
old
> (june 2004). Upgrade to a new iptables version: 1.3.6 is just released.
>
>  =20
I have already tried it with the Debian backport of iptables (v1.3.x)=20
... Same results.

Right now I am recompiling the kernel and iptables + pom-ng.
Hope it helps... :)
> Grts,
> Rob
>
>
>
>
>
>  =20


