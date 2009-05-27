From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: NAT + (libnfqueue || libipq): There are some documents about it?
Date: Wed, 27 May 2009 11:53:13 -0300
Message-ID: <3fdd6ce00905270753g5ca270c3kfbc7985f8f3524f3@mail.gmail.com>
References: <3fdd6ce00905252153h2b83319q818cc0b1c9a7dfb5@mail.gmail.com>
	 <1243321049.27090.22.camel@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=5czfaYI3OzyHX/WlAeIMEdNyAqDYOnvC9uzKEQeHtBA=;
        b=gOKoAJx3bcgLAShKMBv+tiYK1qvnjEwl+VFDsjqy1Q0oSvB4lOPfdJLzYiqmySyQ7K
         AV32cNQADMmwi6Z7lhWXsDu7i7erqDpPg4+sP4yaQ+QYF7422pMrsOOyrj/Qdm4ltEJH
         IESRvlqyRr3eDudCS+EnrBvYcyKilZSKpJd6E=
In-Reply-To: <1243321049.27090.22.camel@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

2009/5/26 Eric Leblond <eric@inl.fr>:
> Hi,
>
> Le mardi 26 mai 2009 =E0 01:53 -0300, Bruno Moreira Guedes a =E9crit =
:
>> Hi all,
>>
>> I need to do some tasks about translating address in user-space. So,=
 I
>> first tried using libipq because it seems to me a library present in=
 a
>> great variety of linux distros. But it was unsuccessful, the changes
>> done on packets appeared to be simply 'ignored'.
>>
>> So, now I want to do it with libnfqueue. Before starting a possibly
>> unsuccessful try, I want to know if is there any documents about it,
>> and if anybody should give me some idea about it.
>
> It is a really good idea to switch to nfqueue...
>
> The thing to know is that you need to compute the checksum of the pac=
ket
> after modification before setting the verdict.
>
> If you want to code a Proof of concept, you can simply use
> =A0 =A0 =A0 =A0http://software.inl.fr/trac/wiki/nfqueue-bindings
> Which provide high level langage binding to libnfnetlink_queue.
>
> BR,
> --
> =C9ric Leblond <eric@inl.fr>
> INL, http://www.inl.fr/
> NuFW, http://www.nufw.org
>

Ohh, of course... I'm forgiving to recalculate both IP and TCP packet
checksums...
Thank you by the information. I'll try this now.

PS: is there any related library which provides the needed checksums?

Thank you all.

Bruno
