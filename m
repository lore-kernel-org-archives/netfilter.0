From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: port redirection *without* nat
Date: Mon, 6 Jan 2003 19:35:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301061935.13614.netfilter@newkirk.us>
References: <20030106141753.A12922@infinity.rhythm.cx>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030106141753.A12922@infinity.rhythm.cx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: sm@rhythm.cx, netfilter@lists.netfilter.org

On Monday 06 January 2003 02:17 pm, sm@rhythm.cx wrote:
> I'm trying to figure out how (if possible) to do port redirection with
> iptables on my linux router. This router is is not doing NAT, all
> connected networks have real, public IP addresses. There is tons of
> information out there about doing port redirection with NAT, but I
> can't find anything for without NAT. I just want to make the router
> take traffic destined for address A port x and change the destination
> address to send it off to address B port x instead. A and B are on the
> same (directly attached ethernet) network. I looked into the DNAT and
> REDIRECT targets, but those only seem to work in the nat table.

What you say you are trying to do IS DNAT.  A packet reaches the machine=20
addressed to one destination, but you want to send it to another address=20
instead, changing the Destination IP.  Destination NAT.  And yes, such=20
targets only work in the nat table's chains, and for DNAT you want to=20
use the PREROUTING chain.  The REDIRECT target is for picking traffic=20
out of the stream that would normally be forwarded and DNATting it to=20
readdress it to the local box as INPUT instead. =20

The most frequently mentioned use of DNAT is for packets addressed to an=20
IP of the box itself, but this isn't necessary.  DNAT is simply changing=20
the destination IP, regardless of what it originally was.=20

j


