From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Re: Problem with routing decisions, and multihop (solved)
Date: Tue, 5 Jul 2005 09:46:29 +0200
Message-ID: <45219fb005070500469fee3c9@mail.gmail.com>
References: <45219fb00507040715442f52cf@mail.gmail.com>
	<200507041133.35774.rob0@gmx.co.uk>
	<45219fb005070409543f229ddd@mail.gmail.com>
	<200507041306.08626.rob0@gmx.co.uk>
	<45219fb00507042252343deced@mail.gmail.com>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb00507042252343deced@mail.gmail.com>
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

Argh. Stupid me..............
The tables 201 and 202, who decide the route for packets with already
defined source addres were in the rules that way:
The routing rules are:
0:      from all lookup local
50:     from all lookup main
201:    from 192.168.17.0/28 iif eth2 lookup 201
202:    from 192.168.16.0/28 iif eth1 lookup 202
222:    from all lookup 222
32766:  from all lookup main
32767:  from all lookup default

Look at the terrible "iif ethx"!!!!!!!!! The packets were routed _at
random_ by the 'equalizing routing decision', even if with decided
address. Argh.
Solution: there should not be "if ethx" in the routing rule matching

Now it works.

Even though, I'd prefer to get the Julian's patches working. When I
try them, all packets go to the same interface (the first hop). I'll
keep on working...

Always, always, there is the deadly "user fault". :)))

Thanks for your support!

