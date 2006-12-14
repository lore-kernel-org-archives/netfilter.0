From: Bernardo Vieira <bernardo.vieira@terra.com.br>
Subject: Re: Allowing hosts to bypass transparent proxy (squid+netfilter)
 to port 80 for a specific netmask
Date: Thu, 14 Dec 2006 20:06:08 -0200
Message-ID: <4581CAD0.3070604@terra.com.br>
References: <4581B8A6.4080504@terra.com.br>
	<1166131570.6534.33.camel@andybev.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1166131570.6534.33.camel@andybev.localdomain>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andy,
Thanks for your reply. That rule did allow me to bypass the proxy, the
java app I'm supposed to run still doens't work, but now I'm conviced
It's not my gateway messing it up.

That diagram really kicks ass! :)

Thanks!

Bernardo

Andrew Beverley wrote:
> Sorry for the top posting but it's a big message...
> 
> How about trying
> 
> -A PREROUTING -i ! eth0 -p tcp -m tcp --dport 80 -d \
> 200.201.160.0/255.255.240.0 -j ACCEPT
> 
> directly *before* the rule to direct hosts to squid.
> 
> The other rule you noted is a FORWARD rule which is processed *after*
> the PREROUTING rule you use for squid, so by the time the packets get to
> that rule they've already been grabbed by squid.
> 
> The following link is an excellent diagram to appreciate the routing
> order - it would be nice to see this on the netfilter homepage!
> 
> http://www.docum.org/docum.org/kptd/
> 
> Andy Beverley
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFgcrQ2QVs8jsa1mQRAjRkAJ41dcrz2nApIuNGXHObr6hJlw5JrACfS0Is
yW/TDJciO/9bLdH6og3ESc4=
=ygI0
-----END PGP SIGNATURE-----

