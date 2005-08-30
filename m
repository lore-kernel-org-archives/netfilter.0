From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: FQDN filtering
Date: Tue, 30 Aug 2005 09:54:00 -0500
Message-ID: <200508300954.00355.rob0@gmx.co.uk>
References: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
	<43145D94.40707@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43145D94.40707@solutti.com.br>
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

> rockey dada escreveu:
> >Is there any way one can use IPTABLES to filter traffic based on
> > "Fully Qualified Domain Names".
> >
On Tuesday 2005-August-30 08:22, Leonardo Rodrigues Magalh=E3es wrote:
>     Anyway, filtering FQDNs seems to be nice on application level and
> not always on IP level. Are you thinking on web filtering ??? Why not
> using a http proxy (squid) for doing that ?? Are you thinking on SPAM
> fighting ?? Why not using your MTA capabilities for that ??

A more basic and cross-protocol approach would be to intercept and=20
redirect all DNS traffic into a transparent proxy, and have your=20
nameserver be authoritative for the [un]wanted FQDN's. Definitely, the=20
OP must be more explicit about the goal, if a useful answer is wanted.
=2D-=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

