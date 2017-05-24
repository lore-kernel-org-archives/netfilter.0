From: Zheng konia <konianet@gmail.com>
Subject: Re: About nftable nat rule
Date: Wed, 24 May 2017 17:30:04 +0800
Message-ID: <CAG1z+78-vrwDkSfvfy21NVhPqrYuxivmX5u-k+on6SW7cU5khw@mail.gmail.com>
References: <CAG1z+7_ngCZQcT7WSU+pzCeb2S8DS4kHe6+Z1+R0+ccPs6dWJQ@mail.gmail.com>
 <CAOkSjBhMSkyTKAqLYDMu88eAH=k2Hz_DxtLRB4mqPxbJHJOM5g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=sJ02T3DbdYso4AckIJMyiIgQhtgdWkqL99A2r8s6PQE=;
        b=HYgE57xGQsanwu9rOGxGjCA5MCdtVud12+irNvSy950UrspooaoVRjx9Pp4919ZFfA
         ckfIFCNjhAZ3aQf9drebEalJnUgSKmjGXnp7mEik/2isv7wHwAjLcqTceM4YI7Lie9I/
         yDuCBIFV5ZwGWkbJahdakH1cXln3AD1cwga95HOpgXZ6KrFgM02ujLSat07AIZaVZWcf
         38CH/n9/J3BzGduUA4OE7RBY4mANqhx8PEeBXFJSQxVKW8n7E3JW+bOtgiZTccnGeGPK
         vrLoYgVammk4azomn1V9Ul8sqkPYWL2oNsw2hCW7kCG99yR7GuERbeB8tyig2rA//2JI
         6KzQ==
In-Reply-To: <CAOkSjBhMSkyTKAqLYDMu88eAH=k2Hz_DxtLRB4mqPxbJHJOM5g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@debian.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi, I do have read your wiki.

However, there's less example about DNAT --to-destination-port range.
You do have examples about to different destination, while I am
looking for the different destination-port balance.

Any suggestion?

2017-05-24 17:07 GMT+08:00 Arturo Borrero Gonzalez <arturo@debian.org>:
> On 24 May 2017 at 10:40, Zheng konia <konianet@gmail.com> wrote:
>>
>>  Can you show me how to do that? Thanks.
>>
>
> Please read the docs:
>
> https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
> https://wiki.nftables.org/wiki-nftables/index.php/Multiple_NATs_using_nftables_maps
