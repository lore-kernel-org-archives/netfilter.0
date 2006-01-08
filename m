From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: [LARTC] routing decision based on sorce port
Date: Sat, 7 Jan 2006 20:39:50 -0400
Message-ID: <65aa6af90601071639s2b302b40weabe6632345e86b1@mail.gmail.com>
References: <1136557846.10545.42.camel@sehe-c4.berlin.teles.de>
	<20060108030453.04c6ad7f.linux@pilot.org.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060108030453.04c6ad7f.linux@pilot.org.ua>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Why not? mark them on OUTPUT

On 1/7/06, Denis Ovsienko <linux@pilot.org.ua> wrote:
> There is a small, but important issue with outgoing packets policy
> routing. Locally originating packets don't hit PREROUTING chain of
> mangle table
> (http://www.faqs.org/docs/iptables/traversingoftables.html), so you
> generally can't policy route such traffic.
>
> --
>     DO4-UANIC
> _______________________________________________
> LARTC mailing list
> LARTC@mailman.ds9a.nl
> http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc
>

