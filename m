From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Re: Programmatically adding Map element into the map/set using libnftnl
Date: Wed, 30 Nov 2016 22:28:04 +0000
Message-ID: <CAE0moydm75tcK=fTAXZQL8cWjTAAxTPv_69caEtT1swqFcA5iQ@mail.gmail.com>
References: <CAE0moyeVaSi5gmTZgsm4r8on0oWg7zU1eBRaj75TKY9YA58Jew@mail.gmail.com>
 <20161130193453.GA12643@salvia> <CAE0moycYr9ew0+2A38Z5jr=rUMEQ+JYKk1b0MX7sBQXyrmW5iA@mail.gmail.com>
 <20161130201434.GA24593@salvia> <20161130212725.GA2576@salvia> <CAE0moyeLhx0K_L_XSaehmSH5qGsezWiST_E9qWw0wUHn4hHezg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Bz7C5dX3xnNycQPJd3i1srm+1D0wTZgWPulQwcgXtFo=;
        b=GNL9cp1zrrircT7GZj16sxaLmJG/ZNPFaGjjmmdCSJRWLTeOamUYeWodYAlBlRlATN
         f2P6McDTSlFBn7W32iOcEeEza6bb8OkY343A73zwtkFnn6ndnt3+XeRWlDw8kqaIEBq9
         ukbZC790YFFqWH/lx1hV6CIIkYbGpShGv9CKug/P68giHXwaor48Bjv8KwQAdth8wL5u
         d5fTwD00+njv2jWWdP55JHxX01br6+dojZ7SI0vMZ8NuI6MhcJno/Foz4/RUPYnXgf0D
         SwVmhBNv000Vo40+7BxPChr6GrRkbbNoE0JMVoqMKDxP9uIqEhfKkljQGXS++DrEfPw+
         os2g==
In-Reply-To: <CAE0moyeLhx0K_L_XSaehmSH5qGsezWiST_E9qWw0wUHn4hHezg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Is there a way to flush all the elements in a set through command
line? e.g. using command line as

___________________________
nft flush set ip6 my_table my_set
___________________________


just like it can be done with rules in the chain etc.

When I try the above I get the following error:

BUG: invalid command object type 2
nft: rule.c:1245: do_command_flush: Assertion `0' failed.
Aborted (core dumped)



On Wed, Nov 30, 2016 at 10:17 PM, Khawar Shehzad
<shehzad.khawar@gmail.com> wrote:
> Thanks Pablo, that helped a lot.
>
>
> On Wed, Nov 30, 2016 at 9:27 PM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>> On Wed, Nov 30, 2016 at 09:14:34PM +0100, Pablo Neira Ayuso wrote:
>>> On Wed, Nov 30, 2016 at 07:46:05PM +0000, Khawar Shehzad wrote:
>>> > Thanks. I want to add an element to existing ipv6 map programmatically
>>> > in C using libnftnl. From the above example commit, the code specifies
>>> > how to add a map (which I assessed by working on the
>>> > nft-set-elem-add.c example previously, thanks for the datatypes.c hint
>>> > too). I tried
>>> >
>>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, "fe80::2", 16);
>>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, "fe80::3", 16);
>>> >
>>> > AND
>>> >
>>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_KEY, &(sa1.sin6_addr),
>>> > sizeof(sa1.sin6_addr));
>>> >         nftnl_set_elem_set(e, NFTNL_SET_ELEM_DATA, &(sa2.sin6_addr),
>>> > sizeof(sa2.sin6_addr));
>>> >
>>> > but both didn't work. It showed same error i.e. "error: Invalid argument".
>>>
>>> Oh, those examples are broken. Batch header and trailing are missing,
>>> I'm going to fix this.
>>
>> Just fixed examples to add set element:
>>
>> http://git.netfilter.org/libnftnl/commit/?id=6a32dbd4cd56c8fede6044a447469fbd0e35c10a
>> http://git.netfilter.org/libnftnl/commit/?id=cc1b5986f5379c17c97ff9fb7064aceddf0b87ed
