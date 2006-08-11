From: Jeffrey Paul <jeffrey.paul@121media.com>
Subject: Re: load balancing with REDIRECT - what is the best way?
Date: Fri, 11 Aug 2006 14:13:54 -0400
Message-ID: <873D40CF-9DD9-4A1B-AFA6-4E8CCD439DC0@121media.com>
References: <OFE2B0B54F.CEEE25A8-ON832571C7.006242A1-832571C7.00636583@powers.com.br>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OFE2B0B54F.CEEE25A8-ON832571C7.006242A1-832571C7.00636583@powers.com.br>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: thiago@powers.com.br
Cc: netfilter-bounces@lists.netfilter.org, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


On Aug 11, 2006, at 13:55 , thiago@powers.com.br wrote:

> A range should be begin:end (note the : instead of -).

Hmmm, still no love.  All of the requests are going to 3128, even  
after clearing the table and using:

iptables -t nat -A PREROUTING -p tcp --dport 80 \
	-j REDIRECT --to-port 3128:3131

This leads me to my next question... what's the best way of getting a  
stable kernel and userspace that supports -m nth and/or -m random?

- -j

- --
Jeffrey Paul, 121Media - jeffrey.paul@121media.com
646-217-0598 x5333
264 W. 40th St, New York, NY 10018



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (Darwin)

iD8DBQFE3MjkdRDaRGLf2XMRArg1AJ9LUf3C/fkb/NYX6oUzIWH3affk4gCfenuK
OfKruL7QsBdoMfdFKtA3L44=
=Gw1B
-----END PGP SIGNATURE-----

