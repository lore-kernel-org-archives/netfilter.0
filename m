From: Florian Boelstler <euphoria@web.de>
Subject: Re: icq
Date: Wed, 16 Jun 2004 20:25:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D09089.7010704@web.de>
References: <17e501c453c9$a9b83490$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <17e501c453c9$a9b83490$49caa8c0@caris.priv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Cc: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Peter Marshall wrote:
> what do I need to do to allow ICQ to work through my firewall

For plain ICQ messages I use the following rules in my iptables setup
script:

$IPTABLES=`which iptables`
ICQ="205.188.0.0/16 64.12.0.0/16"	# subnets for ICQ servers

[...]

# if you use iptables on your desktop
for icq in $ICQ
do
        $IPTABLES -A OUTPUT -o <YOUR EXTERNAL IF> -m state NEW \
	-p TCP --sport 1024:65535 --dport 5190 -d $icq -j ACCEPT
done


# if you use iptables on your gateway
for icq in $ICQ
do
        $IPTABLES -A FORWARD -i <YOUR INTERNAL IF> \
	-o <YOUR EXTERNAL IF> -m state --state NEW -p TCP \
	--sport 1024:65535 --dport 5190 -d $icq -j ACCEPT
done

[...]

Of course you'll need default rules(ESTABLISHED,RELATED) for all
subsequent packets and the way back to your clients or desktop.


  Florian




- --
Public PGP key is available on common key servers.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Debian - http://enigmail.mozdev.org

iD8DBQFA0JCJwT2gPfZm6tURAlJgAKCGIhQP0bHpyIazISLz8Oamk3QUBwCguDbL
Op02A+6Cu5uy7yUUvGLg4e0=
=7naS
-----END PGP SIGNATURE-----

