From: Security <security@ezsm.net>
Subject: Re: ip_conntrack
Date: Mon, 15 Sep 2003 19:40:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309151940.20342.security@ezsm.net>
References: <000801c378a1$f6c24360$243902c4@weatherman>
Reply-To: security@ezsm.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c378a1$f6c24360$243902c4@weatherman>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: Warren P <weatherman@webmail.co.za>, netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Just simply remove the mod ip_conntrac and any dependices and re-apply it.

**Warning** this will require you to drop iptables while you do it...which may
not be a good option depening on your network configuration. **/Warning**

NH

On Thursday 11 September 2003 4:19 pm, Warren P wrote:
> hi
>
> does anyone know how to clear/flush the ip_conntrack table. Every 4 to 6
> months i need to reboot my server because it drops packets and complains
> that the table is full ...
>
> Regards,
> Warren P
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE/Zk3jPEfiOMhBaIMRAqjlAJ4wemLaeC1n/MjvJnANCT4jDJUHgwCfdldB
Dvk62MF2dxCx2uNilvCp13Y=
=vmrB
-----END PGP SIGNATURE-----

