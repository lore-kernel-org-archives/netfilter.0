From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Running other commands / scritps
Date: 09 Dec 2003 18:27:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070990830.18225.72.camel@kermit>
References: <20031209101100.7dd37e4e.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209101100.7dd37e4e.mgale@utilitran.com>
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
To: Michael Gale <mgale@utilitran.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Die, 2003-12-09 um 18.11 schrieb Michael Gale:
> Does anyone know how I could make a set of global variables that the fire=
wall scripts can access when they start up.=20
Put all your variables into one script: init_variables.
Source this script at the beginning of your scripts:
. /path-to/init_variables

> 2. -- Is there a way to have iptables run a command or execute another sc=
ript based on a rule :)
No, not that I know of. You could generate a rule which would log an
event. This event could be parsed by swatch or logsurfer. They would
then start the command.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

