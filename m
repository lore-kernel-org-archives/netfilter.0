From: Koyama Mituru <netfilter@gvelo.ddnn.jp>
Subject: Re: ssh
Date: Thu, 15 Jul 2004 00:57:59 +0900 (JST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715.005759.28779742.netfilter@gvelo.ddnn.jp>
References: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org>
Mime-Version: 1.0
Content-Type: Multipart/Signed; protocol="application/pgp-signature";
 micalg=pgp-sha1;
 boundary="--Security_Multipart(Thu_Jul_15_00_57_59_2004_817)--"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E62E89F@email1.mitretek.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

----Security_Multipart(Thu_Jul_15_00_57_59_2004_817)--
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

From: "Piszcz, Justin Michael" <justin.piszcz@mitretek.org>
Subject: RE: ssh
Date: Wed, 14 Jul 2004 11:26:10 -0400

> Should all incoming ports that relate to a service such as SSH, FTP use
> -m state --state NEW? 
> 
> I have never used this with iptables; but I remember using it with
> ipfilter.
> 
> What are the security implications (if any) of not using -m state
> --state NEW?

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT

I don't want other packets.

-- 
Koyama Mituru    netfilter@gvelo.ddnn.jp

----Security_Multipart(Thu_Jul_15_00_57_59_2004_817)--
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA9VgdRDRWsqe74JwRAqpMAKC6q7LU5kb1BCa3dQyPY9j7KdNQvwCgnjlP
6W+BfeCEDQtoLbna8bjKRz4=
=Di8w
-----END PGP SIGNATURE-----

----Security_Multipart(Thu_Jul_15_00_57_59_2004_817)----

