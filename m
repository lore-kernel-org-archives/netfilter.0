From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: Problem with Rulesets
Date: Sat, 12 Feb 2005 19:32:59 +0000
Message-ID: <20050212193259.weas89x5sg80okc8@www.thompsonmike.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_2d9ozkjesg00"
Content-Transfer-Encoding: 7bit
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

--=_2d9ozkjesg00
Content-Type: multipart/signed; boundary="=_2cryxvydev40";
	protocol="application/pgp-signature"; micalg="pgp-sha1"
Content-Transfer-Encoding: 7bit

This message is in MIME format and has been PGP signed.

--=_2cryxvydev40
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

I have a problem with a few rules, that I need some help with.

Here is my setup,

I have two IPs, 81.174.224.69 and 81.174.224.70.

69 is the main IP, 70 is used only for SSH access, specificly over port 443.
This is done via Portmapping to port 22.

The Problem is this section of code

/sbin/iptables -A INPUT -p ALL -i $LO_IFACE -j ACCEPT
/sbin/iptables -A INPUT -p ALL -i $LOC_IFACE -j ACCEPT

#This section is for the Internet facing sections!
/sbin/iptables -A INPUT -p ALL -i $WAN_IFACE -m state --state
ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A INPUT -i $WAN_IFACE -d ! $EXT_IP  -j DROP
/sbin/iptables -A INPUT -p TCP -i $WAN_IFACE ! --syn -m state --state NEW -j
DROP-INPUT
/sbin/iptables -A INPUT -p TCP -i $WAN_IFACE --tcp-flags SYN,ACK SYN,ACK -m
state --state NEW -j DROP-INPUT

/sbin/iptables -A INPUT -p UDP --dport bootps -i ! $LOC_IFACE -j DROP
/sbin/iptables -A INPUT -p UDP --dport bootpc -i ! $LOC_IFACE -j DROP
/sbin/iptables -A INPUT -p UDP --dport domain -i ! $LOC_IFACE -j DROP

/sbin/iptables -A INPUT -p ALL -d 81.174.224.70 -j LOG
/sbin/iptables -A INPUT -p ALL -i $LOC_IFACE -j REJECT --reject-with
icmp-host-prohibited
/sbin/iptables -A INPUT -p TCP --dport 22 -s hilton.bath -d 81.174.224.70 -j
ACCEPT
/sbin/iptables -A INPUT -p TCP --dport 443 -s hilton.bath -d 81.174.224.70 -j
ACCEPT
/sbin/iptables -A INPUT -p ALL -d 81.174.224.70 -j DROP-INPUT

As I understand it, this line should drop anything that comes into the interface
that is connected to the internet

/sbin/iptables -A INPUT -i $WAN_IFACE -d ! $EXT_IP  -j DROP

ie, if it is not destined for 81.174.224.69 it gets dropped. However it does
not.

Traffic that is destined for 81.174.224.70 gets passed that, however, it does
not even reach the first log statement for that IP.

I know that the block is in the wrong place, it was put there as a test. I am
just confused as to why it is being allowed at all.

If any one can help me understand what is going on, and how the packet is
traversing this rule block would be helpful!

So what I am trying to achive is that all traffic to 81.174.224.70 is dropped,
with the exception of port 22 and 443 TCP.


--

Mike

----------------------------------------------------------------
This message was sent for a thompsonmike.co.uk address, and may
not reflect the views or opinions of the Network owner. All Views
and Opinions are those of the author.

--=_2cryxvydev40
Content-Type: application/pgp-signature
Content-Description: PGP Digital Signature
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBCDlnrOqvhmfZCxDgRAqYBAJ4w+UAYo5cwHVFuayqop58/vj9oEQCdHCdy
jQkDJbC7gIwUd+2uJlYP1tA=
=46o0
-----END PGP SIGNATURE-----

--=_2cryxvydev40--

--=_2d9ozkjesg00
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

--=_2d9ozkjesg00--

