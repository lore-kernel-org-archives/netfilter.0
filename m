From: Lopsch <lopsch@lopsch.com>
Subject: Re: SNAT Question
Date: Tue, 14 Dec 2004 18:51:53 +0100
Message-ID: <41BF2839.4050001@lopsch.com>
References: <20041214173955.BA009410721@mailroute.thevine.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature";
	boundary="------------enig180D80E2808B28C2947152F1"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041214173955.BA009410721@mailroute.thevine.net>
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
To: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig180D80E2808B28C2947152F1
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Burton schrieb:
> I need help setting up a server I am working with.
>  
> I am not very knowledgeable in regards to Linux. 
>  
> With that in mind I have read several HOWTO's and I am convinced that SNAT
> is what I need to do this.
>  
> What I am trying to do is I have to servers on two different T1's located on
> the same switch.
>  
> I would like server1 (my Linux Server) to accept an incoming connecting via
> its IP address on T1(1) 12..22.81.18 on port 10025 and forward that request
> to server2(my Windows Mail Server)  on T1(2) 204.250.113.2 on port 25
>  
> I have tried several combinations of 
> iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --dport 10025 --to
> 204.250.113.2:25 
>  
> What am I doing wrong or am I looking at the wrong tool.
>  
> 
> 

You need DNAT not SNAT ;). And you need a apropriate FORWARD rule if 
your default policy is DROP.

iptables -t nat -A PREROUTING -i ethx -p tcp --dport 10025 -j DNAT --to 
204.250.113.2:25

iptables -t filter -A FORWARD -i ethx -d 204.250.113.2 -o ethx -p tcp 
--dport 25 -j ACCEPT


-- 

PGP-ID 0xF8EAF138

--------------enig180D80E2808B28C2947152F1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (MingW32)

iQIVAwUBQb8oPyXe0Lt4Z4FpAQG+1w/+KeWfa+lCJSKqPvdcfbn+GBRHxEruG5BF
8ZViap+rWRr5Yj013AMs9GsjoB6/Rfz0ipxzBDQE0e4RD3rKuNXWJXkUaawcvcg4
Gw2k1zyyHgMf4Dz0r1BPBZjZsSlrI5YsTFs2pI7b0LuYoOtIc8cjXhRM4xEmUvME
EkG5Bo6scjIMX70+FYFd0chCAerR7rVNEudZnw+WwOc5qiXk7HgmjitHRY9iq9vZ
iT4G6RHnV/0qOKvSPMoZwpNTJcbEeakirY4j9wPLIOG6xTmHt5T3XJxsj9ZUVOQl
NFHTk7ycuYzsY3yQwCtEKKdbhPdH0hSiggxmTPvZrhHFFwn0wQHr6V7+tASXVtSz
Ka5s/fmqMrQg8NcUhJDlKT4sDgPcf0I4fU791SvhHMCswScbkDS6G082oyJ5T9ly
zFouCM4LmRyFP+uSFtz5y6HQs5DZzGQ9eRTqjZJjGQ7fYDKoVZrVMTrTkU3zmcm1
tTK14zHtevkf7BqPThqeKjfvZZNKjDlog8rzSJ94L8RxG5ivlRn4jc2eIDi5ZEKZ
jIpoZS9v8AJqxq3xNkbfX/5PMT6gvBJRB1ullfQR+80E/mQvoqHsLAQRnMfAnI4g
qoM6lPqT10FFxnbN6HGqfmeK1j2hGzUVWHy9bNrj072IfeUcwbW8yV6wyybptTjb
5IWS2M39arU=
=gIe9
-----END PGP SIGNATURE-----

--------------enig180D80E2808B28C2947152F1--


