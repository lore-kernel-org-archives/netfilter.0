From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables NAT
Date: Mon, 4 Aug 2014 10:51:03 +0200
Message-ID: <CAOkSjBiXx7NL0A2RZPzgGHDDWRB0=2OHb6o-uNp776YL_UyOhA@mail.gmail.com>
References: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
 <53DF0AE2.5080202@atc.tcs.com> <CAFnufp1WCpouK0xwwqhhM_fZaoVP-otepvwCXvtkx7PzYqSg3A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=e/dq4Yjl+o5EOQAkO32lFNzfLtvI/gcPFzFW77VSCNs=;
        b=BZMxMqYAwwnmzYKAbfCeV9uXY2djecKONoOqqdIe9erUv0ljEvWvbJUrt0KJTynrXa
         H1/jHL+YWnWAPCr+KO13yjFOl/yQsqCbUPWnuuEZUbbRAiJS3mdK4T9ggSCU8WumdYZp
         qNC2NUyHn/IKV120H6zYJ2Ho9tdHA06COwG2yIMS6CJKYTXZR1tDYnzqPdjMyaRmrYkC
         OZlAde9My55zXe5Nm/tz1KZRMv6KVF+c7E2Yy+ktoIMhPjwlDLXUqe45oGgtBvza5mhJ
         PfLD8zytdgRSZdQMUKnJkTml6KdNcVJei2f/rAmLQMO7WlX0qhdsYQzge3Jv6uSmH4YA
         nLkQ==
In-Reply-To: <CAFnufp1WCpouK0xwwqhhM_fZaoVP-otepvwCXvtkx7PzYqSg3A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Matteo Croce <technoboy85@gmail.com>
Cc: Vigneswaran R <vignesh@atc.tcs.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 4 August 2014 10:46, Matteo Croce <technoboy85@gmail.com> wrote:
> It started working after loading the module iptable_nat
> Does nftables rely on iptables?
>

I guess it should not.

Please provide detailed info about your system: kernel, nft, libnftnl, =
etc..

regards.

--=20
Arturo Borrero Gonz=C3=A1lez
