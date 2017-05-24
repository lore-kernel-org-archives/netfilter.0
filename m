From: Arturo Borrero Gonzalez <arturo@debian.org>
Subject: Re: About nftable nat rule
Date: Wed, 24 May 2017 13:34:16 +0200
Message-ID: <CAOkSjBgNmo0U210v8t8XLTyzUtt_-_vjK6E2VKbd3wYqgM_5kQ@mail.gmail.com>
References: <CAG1z+7_ngCZQcT7WSU+pzCeb2S8DS4kHe6+Z1+R0+ccPs6dWJQ@mail.gmail.com>
 <CAOkSjBhMSkyTKAqLYDMu88eAH=k2Hz_DxtLRB4mqPxbJHJOM5g@mail.gmail.com>
 <CAG1z+78-vrwDkSfvfy21NVhPqrYuxivmX5u-k+on6SW7cU5khw@mail.gmail.com>
 <CAOkSjBiuGUkVirqtAbCSPQd5pwvMcjgvt6FPApUaAgU2eXZ7Bg@mail.gmail.com> <20170524104446.GA23302@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170524104446.GA23302@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Zheng konia <konianet@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 24 May 2017 at 12:44, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> Note: Beware with stateless NAT, it only works with 1:1 mappings, it's
> easy to shoot yourself on your own feet... Otherwise, stick to the
> stateful approach.

Just updated the wiki to add this information:

https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)#Stateless_NAT
https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
