From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Odd -m state Error Msg
Date: Mon, 12 Mar 2007 14:46:18 +0800
Message-ID: <45F4F73A.4010500@wildcash.com>
References: <45F4EF05.3060202@wildcash.com>
	<8764970xzi.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8764970xzi.fsf@newton.gmurray.org.uk>
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
 
Hi Graham,

Thanks but still same error msg:

iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables: Invalid argument

Some more info:

/lib/modules/2.6.20.1/kernel/net/netfilter# ls
nf_conntrack.ko  nf_conntrack_ftp.ko  x_tables.ko  xt_conntrack.ko
xt_limit.ko  xt_state.ko  xt_tcpudp.ko

Strange why I'm getting this error .... it's a standard 2.6 build and the
same firewall script/commands I use regularly on earlier kernels.

- --
Thank you.
Regards,
Rudi.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFF9Pc6gOUisCetzRYRAvp2AJkBAHi+IBwduQ/Ty4V4BPK5SKmmpgCfQYJX
HBQhcDh043BiwomvF0uDhuw=
=ucQr
-----END PGP SIGNATURE-----


