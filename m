From: Kirk <whereisgui@gmail.com>
Subject: Re: rules to allow a machine to join a windows domain
Date: Tue, 3 May 2005 13:37:37 -0700
Message-ID: <48be50bb05050313376f73d0d8@mail.gmail.com>
References: <88088357DF0F2B4DA8AA6B8826B21BDC5069E6@mailrj.drive.com.br>
Reply-To: Kirk <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <88088357DF0F2B4DA8AA6B8826B21BDC5069E6@mailrj.drive.com.br>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: Fabiano <Fabiano@drive.com.br>, netfilter@lists.netfilter.org

Thanks Fabiano. I'll try it.

We have the following servers.
Windows 2000 -DC
Windows 3000 server -DC's backup
NT4

On 5/3/05, Fabiano <Fabiano@drive.com.br> wrote:
> Hi Kirk,
>=20
> Windows 2000 AD Authentication uses LDAP, so u need to open another ports=
 too, like LDAP: 389 UDP/TCP and 3268 TCP, kerberos: 88 UDP/TCP and maybe a=
nother ones, like 135 TCP (RPC Service).
> What version of Windows r u using?
>=20
>=20
> -----Original Message-----
> From: Kirk [mailto:whereisgui@gmail.com]
> Sent: ter=E7a-feira, 3 de maio de 2005 15:07
> To: netfilter@lists.netfilter.org
> Subject: rules to allow a machine to join a windows domain
>=20
> Hello everyone,
>=20
> I need to start moving three windows servers behind a firewall. Could
> someone tell me what ports I need to open so that the servers can join
> a windows domain?
>=20
> I already allow access to DNS( udp 53, tcp 53)  and WINS(tcp 137)
> servers but the test server still can't join the domain. The error I
> get is "a domain controller could not be contacted".
>=20
> I should point out that I'm able to connect to websites from the test
> server and I can connect to the web server I installed for testing
> incoming connections. Also, I'm able to join the domain when I take
> the machine off the firewall.
>=20
> Any hints will be appreciated.
> Thanks,
> -K
>=20
>

