From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: About nftable nat rule
Date: Wed, 24 May 2017 11:49:04 +0200
Message-ID: <CAOkSjBiuGUkVirqtAbCSPQd5pwvMcjgvt6FPApUaAgU2eXZ7Bg@mail.gmail.com>
References: <CAG1z+7_ngCZQcT7WSU+pzCeb2S8DS4kHe6+Z1+R0+ccPs6dWJQ@mail.gmail.com>
 <CAOkSjBhMSkyTKAqLYDMu88eAH=k2Hz_DxtLRB4mqPxbJHJOM5g@mail.gmail.com> <CAG1z+78-vrwDkSfvfy21NVhPqrYuxivmX5u-k+on6SW7cU5khw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG1z+78-vrwDkSfvfy21NVhPqrYuxivmX5u-k+on6SW7cU5khw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zheng konia <konianet@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 24 May 2017 at 11:30, Zheng konia <konianet@gmail.com> wrote:
> Hi, I do have read your wiki.
>
> However, there's less example about DNAT --to-destination-port range.
> You do have examples about to different destination, while I am
> looking for the different destination-port balance.
>
> Any suggestion?
>

Try something like this:

nft add rule t c ip protocol tcp dnat to 192.168.1.100 : numgen inc
mod 2 map { 0 : 4040 , 1 : 4050 }
(i.e, the destination address doesn't change, but port does)


We can update the wiki if that works.
