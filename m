From: Dimitris Zilaskos <dzila@tassadar.physics.auth.gr>
Subject: Re: Counter Strike FOWARDING?
Date: Sun, 9 Mar 2003 00:24:10 +0200 (EET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303090018450.26659-100000@tassadar.physics.auth.gr>
References: <20030308203434.17890.qmail@web40209.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030308203434.17890.qmail@web40209.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sat, 8 Mar 2003, SBlaze wrote:

> iptables -t nat -A PREROUTING -p TCP --dport 27015 -j DNAT --to-destination
> 192.168.1.25:27015
>
>
> I'm trying to route incoming attempts into my internal windows machine to host
> a Half Life Counter Strike game every now and then. This is what I come up
> with! Could everyone take a look and see if this is correct? Thanks Muchly
>

	Replace TCP with udp . Countertrike also uses ports 6003 , 7002 ,
27005 , 27010 ,27011 , 27012 , though forwarding 27015 usually is enough .


	Best Regards ,
--
=============================================================================

Dimitris Zilaskos

Department of Physics @ Aristotle Univercity of Thessaloniki , Greece
PGP key : http://tassadar.physics.auth.gr/~dzila/pgp_public_key.asc
          http://egnatia.ee.auth.gr/~dzila/pgp_public_key.asc
MD5sum  : 4f84f3f53cb046008b4abcb2a092d28d  pgp_public_key.asc
=============================================================================



