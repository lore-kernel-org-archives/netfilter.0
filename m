From: Tom Eastep <teastep@shorewall.net>
Subject: Re: IPTABLES for dual homed machine and public IP addresses
Date: Wed, 11 Aug 2004 12:06:53 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411A6E4D.4020808@shorewall.net>
References: <1092245278.28003.8.camel@thunder.neteconomist.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1092245278.28003.8.camel@thunder.neteconomist.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lists@neteconomist.com
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Eddie wrote:
| I am trying to setup a firewall for a LAN that has more than 40 servers
| in production. All the production servers have public IP addresses. I
| have looked at several scripts available on line to build from and I
| have failed to get one that caters for this type of scenario. My
| router's internal interface is 65.x.x.1. Does anybody know of a way
| around this while keeping my external IP's or must I use private IP's
| for my internal machines? Do I have to set up the default gateway on
| production servers as my routers internal interface of use my firewall
| trusted interface as default gateway?
|
| All help and pointers will be greatly appreciated.
|

Shorewall can handle this type of setup.

	http://www.shorewall.net/

- -Tom
- --
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBGm5MO/MAbZfjDLIRAsTjAKCLyH/7a85Uw8P+Uk7k+FDsKPJqYgCggPis
G7McbyZUI/nkWbmFEmitDos=
=b6qJ
-----END PGP SIGNATURE-----

