From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPMasq denying localhost connections
Date: Wed, 4 Aug 2004 07:49:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408040749.54305.Antony@Soft-Solutions.co.uk>
References: <pan.2004.08.03.19.44.16.29288@wlt.com.br>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <pan.2004.08.03.19.44.16.29288@wlt.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Tuesday 03 August 2004 8:44 pm, Leandro Guimar=C3=A3es Faria Corsetti =
Dutra=20
wrote:

> I have a 2.6.7 Linux kernel system on Debian testing, with an
> Ethernet interface to the cable modem and another to the internal
> network.
>
> 	With Linux 2.4 IPMasq worked OK, but with 2.6 I can=E2=80=99t anymore
> reach localhost 127.0.0.1.  This hinders me from using the squid proxy
> cache, for example.
>
> 	I never fooled around with routing, and was intimidated by
> IPMasq=E2=80=99s /etc files.  Couldn=E2=80=99t find specific troublesho=
oting
> information for IPTables.  Any hint is welcome=E2=80=A6

We need to see your ruleset in order to be able to help.

Post the output of "iptables -L -nvx; iptables -L -t nat -nvx" and also t=
ell=20
us basic things about your network, such as:
 - name and IP address of firewall external interface
 - name and IP address of firewall internal interface
 - internal network address range
 - location and IP addresses of DNS servers

Regards,

Antony.

--=20
Late in 1972 President Richard Nixon announced that the rate of increase =
of=20
inflation was decreasing.   This was the first time a sitting president u=
sed=20
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


