From: "curby ." <curby.public@gmail.com>
Subject: Re: prerouting logging
Date: Wed, 27 Jul 2005 10:58:37 -0600
Message-ID: <5d2f379105072709582a10c978@mail.gmail.com>
References: <42E79B51.1080206@eccotours.dyndns.org>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E79B51.1080206@eccotours.dyndns.org>
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
To: Brent Clark <bclark@eccotours.dyndns.org>
Cc: iptables <netfilter@lists.netfilter.org>

On 7/27/05, Brent Clark <bclark@eccotours.dyndns.org> wrote:
> I got tips for nmap blocking from someone on this list.

I think I'm that someone.  This looks like my post in the "Defeating
NMAP Null scans (and Nessus scans)" thread.

> Im trying to log the problems that logged.
> Would anyone care to recheck my rulset, just to make to I got this right.

You might consider more informative prefixes than just "PREROUTING: ".
 It's fine if some automated parser is going through and will
determine scan type by the options logged, but a human reading the log
might be helped by an indicator like "PREROUTING NULLscan: " or
something of the sort.

> P.s. If anyone knows of any other rules I can add, it would be
> greatfully be appreciated.

My original post did include a NULL scan rule, but not the ACK scan
that J=F6rg mentioned.

