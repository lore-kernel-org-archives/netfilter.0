From: Michael Gale <mgale@utilitran.com>
Subject: Re: Running other commands / scritps
Date: Tue, 9 Dec 2003 11:03:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209110308.22685c54.mgale@utilitran.com>
References: <20031209101100.7dd37e4e.mgale@utilitran.com>
	<1070990830.18225.72.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070990830.18225.72.camel@kermit>
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
To: netfilter@lists.netfilter.org

Hello,

	Thank you to all who reply to my post :)

I now have one file with all my variables :)

Michael


On 09 Dec 2003 18:27:11 +0100
Ralf Spenneberg <lists@spenneberg.org> wrote:

> Hi,
>=20
> Am Die, 2003-12-09 um 18.11 schrieb Michael Gale:
> > Does anyone know how I could make a set of global variables that the fi=
rewall scripts can access when they start up.=20
> Put all your variables into one script: init_variables.
> Source this script at the beginning of your scripts:
> . /path-to/init_variables
>=20
> > 2. -- Is there a way to have iptables run a command or execute another =
script based on a rule :)
> No, not that I know of. You could generate a rule which would log an
> event. This event could be parsed by swatch or logsurfer. They would
> then start the command.
>=20
> Cheers,
>=20
> Ralf
> --=20
> Ralf Spenneberg
> RHCE, RHCX
>=20
> Book: VPN mit Linux
> Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
> IPsec-Howto				     http://www.ipsec-howto.org
> Honeynet Project Mirror:                     http://honeynet.spenneberg.o=
rg
>=20


--=20
Michael Gale
Network Administrator
Utilitran Corporation

