From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: NAT + (libnfqueue || libipq): There are some documents about it?
Date: Tue, 2 Jun 2009 00:59:43 -0300
Message-ID: <3fdd6ce00906012059x7189613asf89a2070320f3b09@mail.gmail.com>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
	 <1243321049.27090.22.camel@khasse.inl.fr>
	 <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
	 <3fdd6ce00905311605k6815936ct6dd19d49cbf30668@mail.gmail.com>
	 <1243889365.6398.19.camel@ice-age>
	 <3fdd6ce00906012047r1671e005n55c51835d67ee39d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=spmlgcQv4mM04OXOTxoIP13JXOMojvBTLSk4/avUhK8=;
        b=Uc3F5Hvk24PXzVDueN1kvAqjHj5i6468KdzNnvImrBZlyUNvd8NVcD5lQQlb40jpWz
         KM556S+J9mCjJVv79PqR1sFsuZA5V1BPlIHxPXjmaG8cLStFujR7CcP/WIdiotGitccw
         nga1cY0NuWnhuGHFYzONRm5+cf3EsAZLCMH3o=
In-Reply-To: <3fdd6ce00906012047r1671e005n55c51835d67ee39d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

Sorry, my e-mail client doesn't follow the "Reply-To" header... So, it
has been sent to Eric instead of being sent to the list. The message
follow bellow.


---------- Forwarded message ----------
=46rom: Bruno Moreira Guedes <thbmatrix@gmail.com>
Date: 2009/6/2
Subject: Re: NAT + (libnfqueue || libipq): There are some documents abo=
ut it?
To: Eric Leblond <eric@inl.fr>


2009/6/1 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le dimanche 31 mai 2009 =E0 20:05 -0300, Bruno Moreira Guedes a =E9cr=
it :
>> 2009/5/27 Bruno Moreira Guedes <thbmatrix@gmail.com>:
>> > 2009/5/26 Eric Leblond <eric@inl.fr>:
>> >> Hi,
>> >>
>> >> Le mardi 26 mai 2009 =E0 01:53 -0300, Bruno Moreira Guedes a =E9c=
rit :
>> >>> Hi all,
>> >>>
>> >>> I need to do some tasks about translating address in user-space.=
 So, I
>> >>> first tried using libipq because it seems to me a library presen=
t in a
> ...
>> But, even with the right checksum it doesn't work as expected(by me)=
=2E
>> The packet seems like I dropped it instead of accepting it. So, I as=
k:
>> does netfilter "retranslate" the packet answer for me? For example:
>>
>> 1) I receive in the nat::POSTROUTING a packet and jump it to QUEUE o=
r NFQUEUE;
>> 2) By jumping it to QUEUE or NFQUEUE, the packet is sent to user-spa=
ce
>> and "received" by nfnetlink library
>> 3) So, it "goes" to the my code through ipq/nfqueue, which changes t=
he
>> source addr from 1.1.1.1 to 2.2.2.2
>> 4) My code sets the verdict NF_ACCEPT
>> 5) The packet is sent to its destiny (by example 2.2.2.3)
>> 6) The host 2.2.2.3 send me a ACK, and the IP header has source
>> address 2.2.2.3, and destiny address 2.2.2.2
>>
>> And so, netfilter will automatically make a "answer DNAT" in the ACK
>> by changing its destiny to 1.1.1.1 and sending it to the 1.1.1.1 hos=
t,
>> or it'll simply accept the packet as it seems to be for the local
>> machine??
>
> If you accept the packet in POSTROUTING nat, it will discard any NAT
> action done after the NFQUEUE rule. Thus you will need to do NAT by
> yourself.

Do you have any hint to do the NAT by myself? Where do I start? Thank
you in the advance.

>
> If you want to see what happens, I suggest to run "conntrack -E" when
> doing test. It will show you what the connection tracking is doing.
>
> BR,
> --
> Eric Leblond <eric@inl.fr>
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>
