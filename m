From: "Matt Grogan" <mattgrogan@nyc.rr.com>
Subject: RE: DHCP related problem
Date: Tue, 17 Jun 2003 07:24:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306171130.h5HBUUWF027705@nycsmtp3out.rdc-nyc.rr.com>
References: <001001c334aa$bcef4d30$c80da8c0@pisic>
Reply-To: <mattgrogan@bigfoot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c334aa$bcef4d30$c80da8c0@pisic>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: "'PiSiC...'" <pisic@service.agress.ro>, netfilter@lists.netfilter.org

You could set up DHCP with a smaller set of addresses, for example
x.x.x.100- x.x.x.110 if you only have 10 workstations. Then drop =
everything
accessing the Internet except for those source addresses.=20

If you want to go further than that, like stop someone from getting =
their
information from DHCP and then statically defining it and keeping that
address, it gets a little more involved. Maybe reducing the lease time =
and
scripting to check that all the stations in the DHCP range are also in =
the
list of DHCP clients on the server would help.

Matt Grogan

________________________________________
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of PiSiC...
Sent: Tuesday, June 17, 2003 4:31 AM
To: netfilter@lists.netfilter.org

Hi all,
=A0
I want to ask you something... You know a possibility to drop outgoing
traffic of clients who define their address staticaly instead of using =
my
DHCP server ?
I also want to allow outgoing access to those who have their IP address
given by my DHCP server.
=A0
Thank you in advance,
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Danila Octavian


