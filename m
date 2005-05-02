From: "John G. Norman" <john.g.norman@gmail.com>
Subject: Re: On vanilla Fedora 3, can't do a transparent proxy (-j REDIRECT)
Date: Mon, 2 May 2005 17:15:57 -0400
Message-ID: <df31c40405050214153124199c@mail.gmail.com>
References: <df31c4040505021142197fdcdc@mail.gmail.com>
	<427682BC.6000303@riverviewtech.net>
	<df31c40405050213556ddc65b2@mail.gmail.com>
	<20050502210104.GB12530@bender.817west.com>
Reply-To: john@7fff.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050502210104.GB12530@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Jason,

THAT'S IT. Thank you. I was making my requests from the box itself.

I will reply in a sec to Ramoni's msg.

John

On 5/2/05, Jason Opperisano <opie@817west.com> wrote:
> On Mon, May 02, 2005 at 04:55:00PM -0400, John G. Norman wrote:
> > Here's a transcript:
> >
> > [root@preview ~]# /sbin/iptables -t filter -F
> > [root@preview ~]# /sbin/iptables -t mangle -F
> > [root@preview ~]# /sbin/iptables -t nat -F
> > [root@preview ~]# cat /proc/sys/net/ipv4/ip_forward
> > 1
> > [root@preview ~]# /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --=
dport 80
> > 80 -j REDIRECT --to-port 80
> > [root@preview ~]# wget http://localhost >/dev/null
>=20
> your problem is your testing methodology.  do not try and test
> transparent proxying from the proxy machine itself--it's not a valid
> test of what you really want; which is transparent proxying of client
> requests made from machines behind the proxy.
>=20
> start testing from behind the firewall/proxy and see if you still have
> problems.
>=20
> -j
>=20
> --
> "Stewie: It rubs the lotion on its skin or else it gets the hose again."
>         --Family Guy
>=20
>

