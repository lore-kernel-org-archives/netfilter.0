From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 02 Feb 2005 11:28:03 +0100
Message-ID: <4200AB33.1010308@imag.fr>
References: <61246.57.66.65.39.1107336931.squirrel@57.66.65.39>
	<4200A1F3.8030609@imag.fr>
	<5172.57.66.65.39.1107338261.squirrel@57.66.65.39>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5172.57.66.65.39.1107338261.squirrel@57.66.65.39>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Herv=E9?= <herve@lucidia.net>, netfilter@lists.netfilter.org

Herv=E9 wrote:
>>having 2 interfaces on the same box with the same IP address
>>
>>repeat after me :
>>
>>WILL NOT WORK
>=20
>=20
> Well, I can't see why not. Can you explain?

uh, because that's how routing in the server PC works. you have to have=20
a different address for each interface.
your best bet is to either use the same interface (and change one of the=20
client's IP to something else (like 192.168.100.3) like so :

server             |         __________         client 1
eth0:192.168.100.1 |--------| ethernet |------| 192.168.0.2
                    |        |  switch  |
                             |__________|------| 192.168.0.3
                                                 client 2

or... change one of the subnets to use a different prefix, like so :

Server             |         | Client 1
eth0:192.168.100.1 |---------| 192.168.100.2
                    |                              | Client 2
eth1:192.168.101.1 |------------------------------| 192.168.101.2

