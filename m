From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Policy targets...
Date: Mon, 21 May 2007 18:13:01 +0200
Message-ID: <4651C50D.7080605@freemail.hu>
References: <464441F7.3050808@freemail.hu>
	<slrnf4j5ek.ic3.xpisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrnf4j5ek.ic3.xpisar@album.ics.muni.cz>
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
To: Petr Pisar <xpisar@fi.muni.cz>
Cc: netfilter@lists.netfilter.org

Hi!

Petr Pisar =EDrta:
> On 2007-05-11, G?sp?r Lajos <swifty@freemail.hu> wrote:
>  =20
>> Hi all,
>>
>> I was reading the iptables manual because I needed the correct argumen=
ts=20
>> of the policy (-P) command.
>> Here it is:
>>
>>        -P, --policy chain target
>>               Set the policy for the chain to the given target.  See t=
he=20
>> section TARGETS for the legal targets.  Only built-in (non-user-define=
d)=20
>> chains can
>>               have policies, and neither built-in nor user-defined=20
>> chains can be policy targets.
>>
>> So I checked the TARGETS.
>>
>> TARGETS
>>        A  firewall rule specifies criteria for a packet, and a target.=
 =20
>> If the packet does not match, the next rule in the chain is the=20
>> examined; if it does
>>        match, then the next rule is specified by the value of the=20
>> target, which can be the name of a user-defined chain or one of the=20
>> special values ACCEPT,
>>        DROP, QUEUE, or RETURN.
>>
>> My question is: What is the difference between the ACCEPT and the RETU=
RN=20
>> target in policy ??? :D
>>
>>    =20
> I think this is missunderstadning in man page. If you read the TARGETS
> section carefully you could see here is nothing about policy even if -P=

> paragraph referres to it.
>  =20
Okay. That is right. There is nothing about policy in TARGETS section.=20
But there is no "POLICYTARGETS" section! :D
> My opinion is ACCEPT and DROP only are valid policies. I don't know
> where I have this idea from but I'm pretty sure that other targets have=

> not sense in policy context.
>
> -- Petr
I agree! I was just curious. :D

Swifty


