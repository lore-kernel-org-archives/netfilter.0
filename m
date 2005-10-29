From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Mangling TOS, or Precedence/SecurityOpts/Compartment?
Date: Sat, 29 Oct 2005 19:19:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510291909370.5550@blackhole.kfki.hu>
References: <4882.67.100.94.26.1130540347.squirrel@www.klxsystems.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4882.67.100.94.26.1130540347.squirrel@www.klxsystems.net>
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
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: karl@klxsystems.net
Cc: netfilter@lists.netfilter.org

Hi,

On Fri, 28 Oct 2005 karl@klxsystems.net wrote:

> For the purposes of analysis, a third =93Invisible=94 Analysis machine is
> placed between Systems #1 and 2, and is cabled as shown in Figure 1, it
> has two Ethernet ports, and in general acts like a =93bridge=94 in that i=
t
> possesses a =93Bypass Card=94, which allows the Tool Server and the Contr=
oller
> Machine to pass traffic through it=92s two Ethernet ports.
>
> One of the features of the Bypass card it contains, is that it physically
> shunts the copper Ethernet connections together when, say, power is cut.

Why do you use NAT on the analysis machine if you go into the trouble to
create such a specific card to mimic a direct-connected network?

Why do you want to play with the IP predecence field if you have got TCP
sequence number problems?

Why should the analysis machine terminate/initialize the TCP connections,
if it's a bridged setup and you can shunt/unshunt the cabling as you
wish?

Sorry, but the whole purpose of the setup and what you do is totally
unclear for me.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

