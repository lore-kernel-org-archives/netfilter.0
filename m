From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: The differences between hash:ip and hash:net.
Date: Wed, 14 Oct 2015 09:41:49 +0200 (CEST)
Message-ID: <alpine.DEB.2.10.1510140940001.2716@blackhole.kfki.hu>
References: <mvkvmi$7k2$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mvkvmi$7k2$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hongyi Zhao <hongyi.zhao@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 14 Oct 2015, Hongyi Zhao wrote:

> From the ipset manpage, I can see the following depictions:
> 
> hash:ip
>   The  hash:ip  set type uses a hash to store
>   IP host addresses (default) or network addresses.
> 
> hash:net
>   The hash:net set type uses a hash to store different
>   sized  IP  network addresses.
> 
> So, it seems that both types can be used to store the network addresses.
> 
> Hence, my issues are:
> 
> 1- Since the hash:ip can be used to store both host addresses and network 
> addresses, why the developer design another set type hash:net?
> 
> 2- It's well know that any host addresses can be written into the form of 
> the 32-bits cidr prefix form. Since the ipset type hash:net should also 
> can be used to store the host addresses and network addresses.
> 
> In one word: what's the differences between hash:ip and hash:net?

hash:ip can store same size network addresses only (for example all of 
them are /24) while hash:net supports all kind of netblocks (except /0).

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
