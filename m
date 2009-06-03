From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: NAT + (libnfqueue || libipq): There are some documents about it?
Date: Wed, 3 Jun 2009 10:41:44 -0300
Message-ID: <3fdd6ce00906030641xb4605f9u4579ca8865bdec21@mail.gmail.com>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
	 <1243321049.27090.22.camel@khasse.inl.fr>
	 <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
	 <3fdd6ce00905311605k6815936ct6dd19d49cbf30668@mail.gmail.com>
	 <1243889365.6398.19.camel@ice-age>
	 <3fdd6ce00906012047r1671e005n55c51835d67ee39d@mail.gmail.com>
	 <1243919086.6398.25.camel@ice-age>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=fYsbdgwJWdRtFZwA0KE6uyO9J6Z7/iHp/+XljhMFsEw=;
        b=ZRgzdfrVZmzRV0KdpcaxpgQ1Ub98MXotpuT3WjnVEa1ETg2ojAs+FGiEBzXc1Q6muO
         dNNG7osw5DKYGjpvmBqC0dwqMssjSdZXXdQeq095OnDbKMhdxG/yt5bnSckm/KOJt0kZ
         jSalNhYAUL81EuylovvJTv4natHVFeeqZwiYQ=
In-Reply-To: <1243919086.6398.25.camel@ice-age>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

2009/6/2 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le mardi 02 juin 2009 =E0 00:47 -0300, Bruno Moreira Guedes a =E9crit=
 :
>> 2009/6/1 Eric Leblond <eric@inl.fr>:
>> > Hi,
>> >
>> > Le dimanche 31 mai 2009 =E0 20:05 -0300, Bruno Moreira Guedes a =E9=
crit :
>> >> 2009/5/27 Bruno Moreira Guedes <thbmatrix@gmail.com>:
>> >> > 2009/5/26 Eric Leblond <eric@inl.fr>:
>> >> >> Hi,
>> >
>> > If you accept the packet in POSTROUTING nat, it will discard any N=
AT
>> > action done after the NFQUEUE rule. Thus you will need to do NAT b=
y
>> > yourself.
>>
>> Do you have any hint to do the NAT by myself? Where do I start? Than=
k
>> you in the advance.
>
> You can try to set-up NAT by yourself by modyfing the connection
> tracking entry of your packet. You can do so by using
> libnetfilter_conntrack.
>
> I've never tested IP modification via libnetfilter_conntrack but it
> should work.
>
> The painful way is too manually do the translation (ie QUEUE packet i=
n
> PREROUTING nat) but has ths chain is placed after connection tracking=
 it
> can led to the packet being detected as INVALID by connection trackin=
g
> system.
>
> BR,
> --
> Eric Leblond <eric@inl.fr>
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>

I'm taking a look into libnetfilter_conntrack. It's really
interesting, but I have another question to ask... Do I need to worry
about performance on doing it?

My first idea is to use the following ip tables ruleset:

nat::PREROUTING, nat:POSTROUTING
1 jump to QUEUE

filter::INPUT, filter::OUTPUT, filter::FORWARD
1 ACCEPT ESTABLISHED,RELATED
2 jump to QUEUE

But in order to doing "every packet" nat meaning using connection
tracking, I need to review this idea to something like:

filter::INPUT, filter::OUTPUT, filter::FORWARD
1 jump to QUEUE

and also doing all the work here. This is the main reason of my fear.

Thank you again!!

--Bruno
