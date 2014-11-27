From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Thu, 27 Nov 2014 11:25:31 +0100
Message-ID: <CAOkSjBhzfTfFa7RD_ft3MsmdxQ59TURN1cyi7yCUF0erp7yA8Q@mail.gmail.com>
References: <5474BC91.6060108@c-s.fr> <20141126130042.GA1533@salvia>
 <54760ABA.4040900@c-s.fr> <20141126174721.GA3815@salvia> <5476152E.8010400@c-s.fr>
 <20141126181312.GA25447@salvia> <547649EC.2090200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=SIGISHGHo3j1VSkFru8issT18F8I0RW86lMzGkB08Ls=;
        b=C7Y1VSoNZmJBM4RC8xXA1ALSLMLHBdML3Mn6t7YKZWl2OiUk5HRFcraxDikzSlwmQx
         5/ojH8zO22WdtVY98DMOm6sfy9JU2zzqVgAJuWgTIPDN/6RcV6wH+XfdIfVd52XCoT/4
         iTcXf2esPE9sB7ZM1rN2y9NC3hKvo4gwMcIP/40gH6g8y6AMZDEvzVQJKXWMKVIYNmkz
         jrkfjCIrquEDzWXSok7sTOJ4/Teji518zF5U/zxNb1mGs+vrDlD4FzR15Zeh/oRt6s2K
         ULSLhvQ5TNK58E912XMypCm7Nf2S1pHRSNHEGdtcu1uCibVZtgivZ+0RNHmQ+krH4mI7
         mAxA==
In-Reply-To: <547649EC.2090200@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: stoffl4ever <stoffl4ever@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 26 November 2014 at 22:45, stoffl4ever <stoffl4ever@gmail.com> wrote=
:
> On 26.11.2014 19:13, Pablo Neira Ayuso wrote:
>>> > I tried it, it adds rules but doesn't remove the previous ones. H=
ow
>>> > can I replace previous rules in one go with 'nft -f' ?
>> You have to prepend:
>>
>>  flush table filter
>>
>> to the output of 'nft list table filter'.
>>
>> Since 3.18, you can also use:
>>
>>  flush ruleset
>>
>> that removes everything, including the existing table and chain
>> configuration.
> Also named sets?
> I was running into this before that sets are not removed when only us=
ing:
> flush table filter

Yes, flush ruleset will fully wipe all the ruleset, including rules,
chains, sets, and tables.

--=20
Arturo Borrero Gonz=C3=A1lez
