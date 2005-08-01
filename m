From: Robert Vangel <vangelr@rfgt.net>
Subject: Re: Rules for squid via ssh tunnel
Date: Mon, 01 Aug 2005 10:16:34 +0800
Message-ID: <42ED8602.5060807@rfgt.net>
References: <42EAE51A.3080400@ieee.org>
Reply-To: rob@zilla.id.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EAE51A.3080400@ieee.org>
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

Gus Collins wrote:
> I believe this is suppose to be easily done, but I sure can't seem to
> make it work.  Here's my setup.
> 
> I setup a squid proxy on my firewall machine to allow http traffic from
> my wlan to be encrypted through a ssh tunnel (i.e., ssh -L
> 3128:squid_server:3128 ...).  Worked great until I added iptables to
> that setup.
> 
> My question is: what rules do I need on the server to allow my local
> wlan to access the web via the proxy running on the firewall?

You shouldn't need any rules to do with the port squid is running on. To
the firewall on the interface you are connecting through, it's all
looking like port 22.

The box you are ssh'ing to, is this the same box that squid is running on?

If so, try `ssh -L 3128:localhost:3128 [...]' (as long as squid is
listening on localhost).
> 
> I tried the rule below w/o success:
> 
> iptables -A INPUT -p tcp --dport 3128 -m state --state
> NEW,ESTABLISHED,RELATED

What did you join it to?

> 
> On the client, I have the default output policy of accept, so it should
> be ok?

Yes, but if you have still added any rules they will obviously override
the default policy.

> 
> Any help greatly appreciated!
> 
> Gus Collins
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFC7YYCV63eDkW7v4cRAnDyAJ0bg8/jiRmDUuQ2lTPKYx1BEp/aHwCfYmK+
Ne+lhWEkMVBG6Ceh5qEXX20=
=/Ad7
-----END PGP SIGNATURE-----

