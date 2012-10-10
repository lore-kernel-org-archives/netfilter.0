From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ipset] adding a fqdn and get all A or AAAA registers in the
 set
Date: Wed, 10 Oct 2012 15:25:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210101521030.8605@blackhole.kfki.hu>
References: <CAPfcJasWf=w1U=wK=ErOH+w6veOgUdjTFbp1JiqjXVYE=7Ay0w@mail.gmail.com> <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPfcJatY3XEfyE8YmBwMZQQkQ5gkVdnxdaSsm0cj1d9u3_Bz5A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Wed, 10 Oct 2012, Arturo Borrero wrote:

> I've been doing some test, and I'm unable to get all A or AAAA registers 
> of a FQDN inside a set (i.e. hash:ip).
> 
> Try it yourself:
> 
> $ host dl.dropbox.com
> [6 ips]
> # ipset create hash:ip test
> # ipset add test dl.dropbox.com
> # ipset list test
> [just 1 ip]
> 
> I took a look at the source of ipset (on git repo), but I was unable to
> determine where in the code the desition of drop (or ignore) additional DNS
> resolutions is being taken. (Yes, i'm a noob programmer)

Yes, that's right. If hostname is supplied as input, just the first 
resolved IP address is used. Look at into lib/parse.c:

/*
 * Parse IPv4/IPv6 addresses, networks and ranges.
 * We resolve hostnames but just the first IP address is used.
 */

static struct addrinfo *
call_getaddrinfo(struct ipset_session *session, const char *str,
                 uint8_t family)
{
...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
