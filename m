From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Forwarding GnomeMeeting to internal network
Date: Wed, 12 Nov 2003 14:04:25 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0311121358320.26806-100000@blackhole.kfki.hu>
References: <20031112102230.M85506@tripnotik.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031112102230.M85506@tripnotik.dyndns.org>
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
To: Julien Didron <admin@tripnotik.dyndns.org>
Cc: Vigil <nvnwdfuq02@sneakemail.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On Wed, 12 Nov 2003, Julien Didron wrote:

> I wish to use GnomeMeeting, for which I assume the only port that needs
> opening is 1720.

False. gnomemeeting uses H.323, which requires quite a lot of dynamic
ports besides TCP port 1720. Unfortunately the current H.323 helper in
patch-o-matic isn't compatible with GnomeMeeting, so the only way to go is
to install a H.323 (gatekeeper/)proxy.

> Now, how can I forward all incoming traffic to port 1720 on the router, to
> one machine on the network that doesn't have a fixed IP (DHCP), but has name
> on the domain thanks to DDNS (ex : abox.mydomain.net).

No way.

> Another question regarding ip_conntrack. After 5 days of use, I get the
> following error in syslog : "ip_conntrack table full, dropping packet.". I
> then increased the value in /proc/sys/net/ipv4/ip_conntrack_max, from 3048 to
> 8192, but I think this is a quick fix that won't get me too far ... Is there
> a mean of flushing that table ? If not, how can I lower the TCP connection
> timeouts ?

Remove the ip_conntrack module and all entries will be flushed. :-)

If you have to keep track many connections it's better to tune the
maximal number by setting a proper hashsize parameter when loading in
the ip_conntrack module.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


