From: "curby ." <curby.public@gmail.com>
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Sat, 2 Jul 2005 11:13:41 -0600
Message-ID: <5d2f379105070210137e0af6ca@mail.gmail.com>
References: <42C0F7E4.4060805@riverviewtech.net>
	<004801c57e70$1fad3890$4206a8c0@loki>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004801c57e70$1fad3890$4206a8c0@loki>
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

On 7/1/05, Marius Mertens <marius.mertens@gmx.de> wrote:
> Add a host to a special whiltelist after doing something special, like
> connecting to a certain port, which would lower the risk of a DOS (they c=
an
> still try, but you can override it)

I've been considering this too.  It's actually a simple form of port
knocking that can be implemented exclusively in iptables (without the
need of extra tools).  The primary goal of port knocking is to foil
port scans, but it could be applicable here.

To protect against DoS, is there any easy way of requiring that three
packets be transferred in an SSH connection before it triggers a
recent update?  Since someone spoofing source IPs to DoS would be
unlikely to continue the connection with the server, such DoS attacks
might be foiled more effectively this way than using rttl (which the
attacker can just exhaustively try all values for).

