From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Performance losings with iptables
Date: 20 May 2003 09:50:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053417001.1964.86.camel@kermit.spenneberg.de>
References: <007d01c31965$fe099ce0$3a51a8c0@memmingen>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c31965$fe099ce0$3a51a8c0@memmingen>
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
To: Michael Albrecht <michael@crypta.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Die, 2003-05-13 um 17.40 schrieb Michael Albrecht:
> Hello,
> i use iptables with Debian-Linux (2.4.20).
> Wenn i install 150 Input-Chains like this:
> iptables -A input -s 192.168.81.xxx
> i will lose a lot of perfomance (for example: apache take a lot of time, =
ssh ...)
> Wenn i show the perfomance with vmstat - vmstat says that 99 % is idel...
> Wer is the Problem ???
I doubt that iptables itself is responsible for the performance loss. I
rather suspect name resolution.
Can you post you rules or at least some timing information?

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                   =20
http://honeynet.spenneberg.org

