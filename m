From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: RE: Is this possible?
Date: Tue, 15 Feb 2005 06:20:10 +0000
Message-ID: <20050215062010.8vu1ewv400w8k44g@www.thompsonmike.co.uk>
References: <778233409EC.AAA7324@weasel.optus.com.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_7cbd4bq3qtss"
Content-Transfer-Encoding: 7bit
In-Reply-To: <778233409EC.AAA7324@weasel.optus.com.au>
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

This message is in MIME format.

--=_7cbd4bq3qtss
Content-Type: text/plain;
	charset=ISO-8859-1;
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Quoting Alex Samad <Alex@Samad.com.au>:

> If your firewall is using a proxy to allow this access, most default to
> allow 563 nntps as well, run your ssh server on that port
>
> Alex
>

<Snip>

Thanks for all your suggestions I solved it by adding a aliase to the Internet
NIC and slapping a unused IP onto it. Then I run a portforward from there to
port 22 on the system.

That way I still have HTTPS and can access 443 on a different IP, and they all
lived happily ever after.


Works well.


-- 

Mike

----------------------------------------------------------------
This message was sent for a thompsonmike.co.uk address, and may
not reflect the views or opinions of the Network owner. All Views
and Opinions are those of the author.


--=_7cbd4bq3qtss
Content-Type: application/pgp-keys
Content-Description: PGP Public Key
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.2.6 (GNU/Linux)

mQGiBEIJwKQRBADxZoxt3gO//qy57otRdB+GEbnsxCb4jVlCunknAHTV3OUCtT0h
9aIQTIKfv3g7cz1x1c3eF7/0CPRXPhJJe0tUSsuR0G2SnSXmPMKVfP0mMNxvykfY
ln2lGL36NGNQt/D3XnzDOE2hRJ6wRqbiUyn8Kwm8DqRqubEJ4RIhpLND3wCg2sCE
JmUlbHLH4sjsbUIXjVBAeMED/R7647CdXh4Fhsb02HPFfyRvmjbM3MS27IVCzjUK
emVjxYs1xxwQU9RAPYdEt9YjdXJjDQw2kRo2c9S+m0mkOkjPxx4AvvisZjyvKJSt
QJRJvTDjc8xKO38r0HpqlHV+vsRdsgEyqTECFJsqAuiqldCXlv/ZRl66FLGi/uji
AWm8A/9UjovTEmVJyR8zaPny481M5ZScbzmDQv8rw9COpx21kYQpsGpjrVr6DY7U
6awpfHVAIUb3dJjKwd47keL1rlNjXiwjlx6ZGBUOQufaxwlbmGopzKsnBTc6DwGl
ELFh7fUxF0ek7wMiOIyOO95WU2WiyapDT1nOHfeKOfN5sxZAp7QqTWljaGFlbCBU
aG9tcHNvbiA8bWlrZUB0aG9tcHNvbm1pa2UuY28udWs+iFsEExECABsFAkIJwKQG
CwkIBwMCAxUCAwMWAgECHgECF4AACgkQOqvhmfZCxDj0ZgCfdQMaYOCne3Y7kUTC
Dx5nqr8JT6gAoNZCgvMWqHQUIi3Y2F6uS42tbUSquQINBEIJwLYQCADbcNfQftLj
39ALYVguKSdvbQI0YnEohH92CJ1f3bwydvnEVnntyDGWzffJDy7ouAtx+uowDvua
ihIF7hj7LKJjLaK4n+yhfh+ga2wsGyGpUhcsuHGhbnYsHLKnNg1N2xDf4zWZg4Ov
xeyzp/akeFGYse8/liuLYn8AtOXPFHUI68Ax4verqgYK7CPyM7EQuT3LvrZAY53b
A4LWKEbF91XtwXMxNvQyHPnGkpt8eHZU0N+g/Bp9jd54ZJYh+c7lDEEygDINZEda
JQoZOUXEHW2iwyYGAym9IlBiDz/AW+56Syim5BReWJnvNHJpR/cCLXXdQxHSIltw
L6bWqIPW6PprAAMFCADVKWEqrb46a3IZ80Js/PI0A+XztE9XcWEPkAiuBNbcuanF
oQ3BXpAfngq52UzLzFUa7/lMD6vw+vWfV07R02n9jclwnQBLvNHcKc6WCoaxU/rB
E5z3Je8RxHy8Mt0QnOZIZpP4e9xLKydqMx8QzYKQ71G3PtePtWUbFSjbIEmWZQJy
1RUTIAp3lEwoTLOw1jYmeYKbZMzZBA1QrgL9DDi7SG1gWHGsr2XJtY0U6WMoZY3I
DLQkZI72osuV3XkzG24tKT48pfUwgTrCm2+KwTVNJV9mfLbON59wvRjLs+n5i9ee
TucuGWghP7bRztWjWKHl8j2nXUO1daqBI+zdNXSgiEYEGBECAAYFAkIJwLYACgkQ
OqvhmfZCxDjx8ACdGqWUrC1zzGWzz9HCN4SC0jc2FRwAnRW8NV8UfjeA7B/YiOJU
CEVK1PS8
=Cnzw
-----END PGP PUBLIC KEY BLOCK-----

--=_7cbd4bq3qtss--

