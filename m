From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 10, Issue 74
Date: Fri, 27 May 2005 18:31:55 +0400
Message-ID: <9927912d05052707311500514d@mail.gmail.com>
References: <42971843.64531163.6abe.2deeSMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42971843.64531163.6abe.2deeSMTPIN_ADDED@mx.gmail.com>
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

> On Wed, May 25, 2005 at 02:24:17PM +0400, Visham Ramsurrun wrote:
> > What I mean by this is that the when a protocol is unknown to the
> > ip_conntrack module if you don't have or don't want to use helper
> > conntrack modules like that for TCP or FTP), connection tracking
> > adopts a default method for handling these packets. It resembles the
> > handling of UDP packets. When this default behaviour is used, even a
> > packet that is not the SYN packet is considered as NEW. A second
> > packet in the reverse direction (reply packet) will set the connection
> > state to ESTABLISHED.
>=20
> if you're asking if there's a way to modify the conntrack code to ignore
> the fact that TCP traffic is TCP traffic, and instead treat it as some
> random, unknown IP protocol; i would imagine you would have to hack the
> crap outta the conntrack code, basically removing
> ip_conntrack_proto_tcp.c from the equation.  i have no clue how you
> would go about doing this.  i also have no idea what your impetus behind
> this desire is; therefore, i can make no suggestion as to whether there
> may be an easier way to accomplish your goal.
>=20

What I actually want is that, whether it is TCP traffic or that of any
other protocol, the traffic be treated in the same way. I read in the
Iptables Tutorial that there is a default connection tracking
mechanism. There are specific protocol helper modules for handling
specific protocol traffic (TCP, FTP are some examples). So, for the
traffic of any particular protocol, either you use a a conntrack
helper module (if it exists), or you use the default connection
tracking of ip_conntrack which actually handles traffic from any
protocol in the same way.

Having said that, what I would like to know is whether when this
default behaviour is used,
1) is a packet considered as NEW even it is not the SYN packet.
2) will a second packet in the reverse direction (reply packet) will
set the connection state to ESTABLISHED.

I just don't know how to verify this..that's why I asked you for help
because you have much more experience with iptables and hence, maybe
you have come across this.

Many many thx for the reply...

Best regards,
Visham

