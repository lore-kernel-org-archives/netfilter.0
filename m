From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT not working
Date: Fri, 22 Dec 2006 22:14:37 +0100
Message-ID: <458C4ABD.6010507@plouf.fr.eu.org>
References: <458BF3C2.4050700@initon.com> <458C4254.4060007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <458C4254.4060007@riverviewtech.net>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Hello,

Grant Taylor a =E9crit :
> Balazs Fulop wrote:
>=20
>> If I telnet 192.168.3.1 25 on the firewall, an SMTP session starts. If=
=20
>> I telnet from outside (coming on eth0), it waits until timeout.

I am not surprised that telnet to a private address from the outside=20
fails. ;-)

> It does not look like you are SNATing / MASQUERADing your traffic back=20
> out to the internet.

You do not need to SNAT/MASQUERADE return traffic. The NAT code does it=20
implicitly. However, the target host must have a (default) route back to=20
the outside via the NATing gateway.

