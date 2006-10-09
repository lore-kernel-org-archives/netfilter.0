From: aoliva <aoliva@it.uc3m.es>
Subject: Re: How to find the chain which calls the match
Date: Mon, 09 Oct 2006 18:53:12 +0200
Message-ID: <452A7E78.40709@it.uc3m.es>
References: <1160405480.28977.201.camel@mfarooq-1.tango-networks.com>	<452A6714.5030709@it.uc3m.es>
	<452A68BE.8030605@it.uc3m.es> <452A719B.9080209@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452A719B.9080209@freemail.hu>
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
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org

Thank you very much for the answer but I think this is not what I was=20
trying. I mean how to know which is the calling chain from inside the=20
code of the matching function.

Thank you very much for the help.

Regards
Antonio de la Oliva

G=E1sp=E1r Lajos wrote:
> aoliva =EDrta:
>> Sorry if you receives multiple copies,
>>
>> Hi all, I am writing a match for iptables and I would like it to have=20
>> a different behaviour when it is called from different chains (e.g.=20
>> different behaviour when called from INPUT than OUTPUT) anyone knows=20
>> how to check in the match which is the chain that is calling it?
>>
>> Thanks in advance.
>>
>> Antonio de la Oliva
>>
>
> I DO NOT THINK THAT IT IS A GOOD IDEA OF USING IPTABLES THIS WAY,
> but anyway try this:
>
> iptables -A INPUT -j MARK --set-mark 1
> iptables -A INPUT -j mychain
>
> iptables -A OUTPUT -j MARK --set-mark 2
> iptables -A OUTPUT -j mychain
>
> iptables -A FORWARD -j MARK --set-mark 3
> iptables -A FORWARD -j mychain
>
> iptables -A mybehaviour1 -j DROP
>
> iptables -A mychain -j mybehaviour1 -m mark --mark 1 //INPUT
> iptables -A mychain -j mybehaviour2 -m mark --mark 2 //OUTPUT
> iptables -A mychain -j mybehaviour3 -m mark --mark 3 //FORWARD
>
>
>
> Swifty
>


