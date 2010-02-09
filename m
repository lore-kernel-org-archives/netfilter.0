From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: How do you correctly interpret the FORWARD chain interface 
	options?
Date: Tue, 9 Feb 2010 16:16:34 +0000
Message-ID: <ac5c74141002090816k7ab7a2d3hb892c390cd3039cb@mail.gmail.com>
References: <ac5c74141002090517o5463ed02i3b8c52b553bb462d@mail.gmail.com>
	 <56378e321002090525p44cfe5a4u3f1c89a355f78322@mail.gmail.com>
	 <ac5c74141002090723l73bd7ccva8b9e214fe33badc@mail.gmail.com>
	 <ac5c74141002090750p412dbce1wc1fb8aa447c51e07@mail.gmail.com>
	 <1265731243.3930.43.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=MatdJDMKrNemOx/BQh5/4MYcsF+DixQe1B8azUQP+s0=;
        b=H0Z/OAyJGzUBjfvGZ8Los8UbfKjmvTg2ukuK8GpnnzK8/xwF8KJnUPBMfBfM/ZEmRg
         TKdNQfF2KJOmirULVZvA/i0couurgNFWbNgbNwZkyueOckmT2tENavMmQKB/4XirEdXk
         LqsrjVSkDtXnQPDgdTNrxA43SJiJbXv4plt8s=
In-Reply-To: <1265731243.3930.43.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

Richard,

Thanks for clearing that up.


2010/2/9 =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=
=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>:
> =D0=92 =D0=92=D1=82=D0=BE, 09/02/2010 =D0=B2 15:50 +0000, paddy joeso=
ap =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Tue, Feb 9, 2010 at 3:23 PM, paddy joesoap <paddyjoesoap@gmail.co=
m> wrote:
>> > On Tue, Feb 9, 2010 at 1:25 PM, Richard Horton <arimus.uk@googlema=
il.com> wrote:
>> >> On 9 February 2010 13:17, paddy joesoap <paddyjoesoap@gmail.com> =
wrote:
>> >>> Hi All,
>> >>>
>> >>> How should one interpret the inbound ("-i") and outbound ("-o") =
of the
>> >>> FORWARD chain.
>> >>>
>> >>
>> >>
>> >> -i refers to the interface the packet is received on.
>> >> -o refers to the interface the packet is routed out on.
>> >>
>> >>
>> >
>>
>> Ignore last email (spotted an error in the example rules).
>>
>> I think I get what Richard is saying now.
>>
>> The following two rules-set are equivalent, it just depends where yo=
u
>> decide to filter.
>>
>> Am I correct?
>>

Thanks Richard. I'm slow to catch on ;-)

This leads me to a new question about how the default policy is execute=
d.

Lets suppose I only examine the inbound "-i" option, that is, allow
inbound external-traffic and allow inbound internal-traffic.
 # Client Request
iptables -A FORWARD -i eth0 -p tcp -s 0/0 -d webServIP --dport 80 -j AC=
CEPT
# Server Response
iptables -A FORWARD -i eth1 -p tcp -s webServIP --sport 80 -d 0/0 -j AC=
CEPT

Presumably since the default FORWARD policy is DROP and because I have
not *explicitly* defined what should happen in the "-o" of both, then
packets will be dropped. That is, FORWARD rules always require a
counterpart for bi-directional communication.

So would it be wise to write a generic outbound "-o" rules that trusts
how the firewall treats outbound traffic in all cases.

iptables -A FORWARD -o eth0 -j ACCEPT
iptables -A FORWARD -o eth1 -j ACCEPT

Then I only have to focus on one direction regarding the FORWARD
rule-set. Its just a way of reducing the number of rules I would have
to read or analyse. Perhaps this is a ridiculous thing to do!



>> =C2=A0iptables -A FORWARD -i eth0 -p tcp -s 0/0 -d webServIP --dport=
 80 -j ACCEPT
>> =C2=A0iptables -A FORWARD -o eth0 -p tcp -s webServIP --sport 80 -d =
0/0 -j ACCEPT
>>
>> =C2=A0iptables -A FORWARD -o eth1 -p tcp -s 0/0 -d webServIP --dport=
 80 -j ACCEPT
>> =C2=A0iptables -A FORWARD -i eth1 -p tcp -s webServIP --sport 80 -d =
0/0 -j ACCEPT
>>
>> In some sense writing the 4 rules leads to duplication, in that,
>> applying just two will suffice.
>
> This is correct.
>
>> > Does this mean that both versions below are equivalent or at least=
 do
>> > the same job?
>> >
>> > (1)
>> >
>> > iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
>> > iptables -A FORWARD -o eth1 -p tcp -s webServIP -j ACCEPT
>> >
>> > Because a packet will enter eth0 for internal network and a packet
>> > will leave eth1 (pushed towards eth0).
>> >
>> > (2)
>> >
>> > iptables -A FORWARD -i eth0 -p tcp -d webServIP -j ACCEPT
>> > iptables -A FORWARD -o eth0 -p tcp -s webServIP -j ACCEPT
>> >
>> > Because a packet will enter eth0 to be forwarded internally and a
>> > packet will also enter eth0 when leaving the network.
>> >
>> >
>> >>
>> >> --
>> >> Richard Horton
>> >> Users are like a virus: Each causing a thousand tiny crises until=
 the
>> >> host finally dies.
>> >> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norweg=
ian Forest Cats
>> >> http://www.pbase.com/arimus - My online photogallery
>> >>
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
> --
> =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=
=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>
>
>
