From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: NAT + (libnfqueue || libipq): There are some documents about it?
Date: Sun, 31 May 2009 20:05:28 -0300
Message-ID: <3fdd6ce00905311605k6815936ct6dd19d49cbf30668@mail.gmail.com>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
	 <1243321049.27090.22.camel@khasse.inl.fr>
	 <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Q/92ETYjbsLMPFJvomEybYs3UzpHyzett76eXYJk4X8=;
        b=ATnTGH0EeZA83ewyDol3e9D5pIyXRM86JHs+iDiewpE6DbyQFgKHWNlgB35j1WgqJA
         lKPHfVGz7+AMTjq8FqHxa6nrj1rcmPuCCK/00OTEZV5xeKKZVOW6PQytTKLRvxz+lQrb
         HzfwS9zwK8KEy16mnS2T18zD01rkJw+taMnbI=
In-Reply-To: <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

2009/5/27 Bruno Moreira Guedes <thbmatrix@gmail.com>:
> 2009/5/26 Eric Leblond <eric@inl.fr>:
>> Hi,
>>
>> Le mardi 26 mai 2009 =E0 01:53 -0300, Bruno Moreira Guedes a =E9crit=
 :
>>> Hi all,
>>>
>>> I need to do some tasks about translating address in user-space. So=
, I
>>> first tried using libipq because it seems to me a library present i=
n a
>>> great variety of linux distros. But it was unsuccessful, the change=
s
>>> done on packets appeared to be simply 'ignored'.
>>>
>>> So, now I want to do it with libnfqueue. Before starting a possibly
>>> unsuccessful try, I want to know if is there any documents about it=
,
>>> and if anybody should give me some idea about it.
>>
>> It is a really good idea to switch to nfqueue...
>>
>> The thing to know is that you need to compute the checksum of the pa=
cket
>> after modification before setting the verdict.

Now I'm computing the checksum before the verdict. To check if the
checksums are being correct computed, I'm also recomputing the
ckecksum before changing the packet. Tcpdump also said my checksum is
correct.

>>
>> If you want to code a Proof of concept, you can simply use
>> =A0 =A0 =A0 =A0http://software.inl.fr/trac/wiki/nfqueue-bindings
>> Which provide high level langage binding to libnfnetlink_queue.
>>
>> BR,
>> --
>> =C9ric Leblond <eric@inl.fr>
>> INL, http://www.inl.fr/
>> NuFW, http://www.nufw.org
>>
>
> Ohh, of course... I'm forgiving to recalculate both IP and TCP packet
> checksums...
> Thank you by the information. I'll try this now.
>
> PS: is there any related library which provides the needed checksums?
>
> Thank you all.
>
> Bruno
>

But, even with the right checksum it doesn't work as expected(by me).
The packet seems like I dropped it instead of accepting it. So, I ask:
does netfilter "retranslate" the packet answer for me? For example:

1) I receive in the nat::POSTROUTING a packet and jump it to QUEUE or N=
=46QUEUE;
2) By jumping it to QUEUE or NFQUEUE, the packet is sent to user-space
and "received" by nfnetlink library
3) So, it "goes" to the my code through ipq/nfqueue, which changes the
source addr from 1.1.1.1 to 2.2.2.2
4) My code sets the verdict NF_ACCEPT
5) The packet is sent to its destiny (by example 2.2.2.3)
6) The host 2.2.2.3 send me a ACK, and the IP header has source
address 2.2.2.3, and destiny address 2.2.2.2

And so, netfilter will automatically make a "answer DNAT" in the ACK
by changing its destiny to 1.1.1.1 and sending it to the 1.1.1.1 host,
or it'll simply accept the packet as it seems to be for the local
machine??

If it simply "accept" the packet, how could I made this "DNAT" happen??

It seems a little confuse for me by now, but I was expecting the first
case because when I add a SNAT rule in the POSTROUTING table, this
"answer DNAT" seems to be done "by magic".

Thank you all in the advance.

--Bruno Moreira Guedes
