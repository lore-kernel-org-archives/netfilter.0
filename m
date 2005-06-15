From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: How to log everything with iptables
Date: Wed, 15 Jun 2005 13:18:46 -0500
Message-ID: <200506151318.46380.rob0@gmx.co.uk>
References: <00ec01c571d2$7878ca20$ec0211ac@PIVT>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00ec01c571d2$7878ca20$ec0211ac@PIVT>
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
To: netfilter@lists.netfilter.org

On Wednesday 15 June 2005 12:48, Sebasti=E3o Ant=F4nio Campos (GWA) wrote:
> How can I do to log everything is passing thru my firewall on eth0
> and eth1 and lo?? Using iptables??

What did you try? Are you serious? What do you expect to do with all=20
those logs?

Anyway, it's quite simple. Put a -j LOG rule before any ACCEPT rules=20
which you may have in INPUT and FORWARD chains. If either default=20
policy is ACCEPT, put a -j LOG rule at the end of that chain too. See=20
"LOG" in the "TARGET EXTENSIONS" section of iptables(8) for options.

You might also find the ULOG target of interest as well as the "limit"=20
match extension.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

