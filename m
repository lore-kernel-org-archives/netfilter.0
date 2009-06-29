From: Nishit Shah <nsshah.82@gmail.com>
Subject: Re: arptables ruleset not working when compiling on 
	fedora6,7,8/centos 5/redhat 5
Date: Mon, 29 Jun 2009 20:21:48 +0530
Message-ID: <b2d58cb80906290751j7fb3976bx9d04fed852c8b451@mail.gmail.com>
References: <b2d58cb80906290712k33c1ebbvfc8e661cb34c502c@mail.gmail.com>
	 <56378e320906290721i63f969edm90aed19619decf71@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Kbig8gNE06OOvq+jrPKCMSxBs2R1Z6z1MV1XaQcFKrk=;
        b=TK+Z5m0NB5QDj5pFmjGCyhfT4nQZcS57OwQcQw7okW9jub6qIFPhmdjU/5W82GfK+E
         ff68OpXTDg1B2ZvH1OlxRV/ph7nd0QQssnDOU8vB73oqRcXIdJejWPcxmWA1/TkCVOzb
         SFV7v50JLKx76/EWLnuBCDH1qjt5u1yjNBvrc=
In-Reply-To: <56378e320906290721i63f969edm90aed19619decf71@mail.gmail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Mon, Jun 29, 2009 at 7:51 PM, Richard Horton<arimus.uk@googlemail.co=
m> wrote:
> 2009/6/29 Nishit Shah <nsshah.82@gmail.com>:
>> Hi,
>> =A0 =A0 =A0 =A0 I am compiling arptables-v0.0.3-3/arptables-v0.0.3-2=
 on
>> fedora6,7,8/centos 5/redhat 5. Module is compiled successfully.
>> Following are the simple steps.
>>
>> =A0 =A0 =A0 =A0make
>> =A0 =A0 =A0 =A0make install
>>
>> =A0 =A0 =A0 =A0Now, I am applying following rules,
>>
>> =A0 =A0 =A0 =A0arptables -N user1
>> =A0 =A0 =A0 =A0arptables -N user2
>> =A0 =A0 =A0 =A0arptables -N user3
>>
>> =A0 =A0 =A0 =A0arptables -A INPUT -j user1
>> =A0 =A0 =A0 =A0arptables -A INPUT -j user2
>> =A0 =A0 =A0 =A0arptables -A INPUT -j user3
>>
>> =A0 =A0 =A0 when I am doing arptables -nvx -L, I am getting packet c=
ounts
>> on only "arptables -A INPUT -j user1", no packet counts on user2 and
>> user3 chains. If I remove the user1 chain, I am getting packet count=
s
>> on user2 chain, not on user3 chain. It means only the first user
>> defined chain is traversing.
>>
>> =A0 =A0 =A0 all above machine contains gcc >=3D 4.1.2 and glibc >=3D=
 2.5
>>
>> =A0 =A0 =A0 If i compile the same source with machine having gcc 2.9=
6 and
>> glibc 2.2.4 things are working properly on the above machines.
>> =A0 =A0 =A0 Is it something related to gcc and/or glibc ? as I am no=
t
>> seeing any issues with kernel space arptables code.
>>
>> Rgds,
>> Nishit Shah.
>
>
> I might be missing something obvious but all three rules are identica=
l
> so traffic is going to hit the first rule and go down to user1 chain.
>
>
> Your user chains don't have any actions associated so looks to me lik=
e
> it enter the chain, nothing will happen - including not returning to
> the input chain so the other rules aren't being hit.
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian =
=46orest Cats
> http://www.pbase.com/arimus - My online photogallery
>

If user chain doesn't have any actions associated, action is
ARPT_CONTINUE. So, the packet will traverse the next rule in INPUT
(that is arptables -A -j user2) and so on. (That is the behavior I am
getting when compiled with gcc 2.96 and glibc 2.2.4)

Rgds,
Nishit Shah.
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
