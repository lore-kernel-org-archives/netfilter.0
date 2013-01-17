From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: Re: state match is obsolete 1.4.17
Date: Thu, 17 Jan 2013 14:38:11 +1000
Message-ID: <CAMD-=VLXkD3ekj2hbq1ReUf-ZmTZOx+WC0NMOwOH3mG0TJEvrg@mail.gmail.com>
References: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com>
	<alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr>
	<CAMD-=V+p0gv+amQearBpGPD0q3zALUEfQj6xCoTTg197jN3_5A@mail.gmail.com>
	<alpine.LNX.2.01.1301160105200.8938@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=mRn0Ch+djPnjzQeuSTEtif7Fl/3/MvegtZMzh3XWIRw=;
        b=Nj9SRIPHjDIeeL2uu34QsgrIYg8QfCukDoxPiaZ1YRVyh3BGRs9S0zJUhWNSIz+EOd
         u2Qq1T5ch+UyJVNXgr7TC7079bjRUs7oabalQT0yloLdVMXsT4YrVoqvRhk401LHgYb+
         QYsZPC7HfGJ/VkiVkxadoc2EclZAocjtdmUVZ0SgFNvzP/WhTJ36dsxoW0x6pu/o037V
         oj/H6OQlfnvy3dhrRCcLtWdkhf3UlQ+1j9N1pEVeJIE8MFRnyLDuL5qyUyy/pVFHM9oh
         m8IsytVk/krKfKxswidWsojyM9ekrkC8rPG+WOwN1DH2PPbiSfJvWo/KaoCx4P9+UvnA
         jDrg==
In-Reply-To: <alpine.LNX.2.01.1301160105200.8938@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On 1/16/13, Jan Engelhardt <jengelh@inai.de> wrote:
>
> On Wednesday 2013-01-16 00:27, Nick Edwards wrote:
>>> On Tuesday 2013-01-15 06:09, Nick Edwards wrote:
>>>
>>>>WARNING: The state match is obsolete. Use conntrack instead.
>>>>Getting these errors since upgrading to 1.4.17
>>>
>>> It is a warning, not an error. (An error would not let use you
>>> the command at all.)
>>
>>I can understand that if there is a lot of pre warning, as others have
>>mentioned, most guides show the former..
>>And can you confirm my change is the correct method to obtain the same
>>net result please?
>
> Yes.
>

Thanks Jan, thats what I was hoping for.


>>Maybe the warning could be changed to
>>WARNING: The state match is deprecated and will eventually go away.
>>Use conntrack instead.
>>That wont panic people into thinking the rule is not working.
>
> Cannot guarantee that it will make it in, but I support your
> position with this patch.

Thanks, it was just a thought but if it gets in, a few people might be
grateful, well, even if one more person is, it is a benefit.
Thanks again
Bye!
