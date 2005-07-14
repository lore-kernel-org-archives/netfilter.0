From: "curby ." <curby.public@gmail.com>
Subject: Re: dnatting
Date: Thu, 14 Jul 2005 09:42:28 -0600
Message-ID: <5d2f379105071408426a506986@mail.gmail.com>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711151830.GA26670@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On 7/11/05, Payal Rathod <payal-netfilter@scriptkitchen.com> wrote:
> Hi,
> I have a rule on my friend's broadband connection to redirect traffic
> from outside to an internal machine like,
>=20
> iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 80 -j DNAT  \
> --to-destination 192.168.10.10:80
>=20
> But she complained that people from inside the network cannot do
> http://1.2.3.4 in their browser and see the site. Is she correct?
> What is wrong with my rule because I can see the site from outside?

The problem is only the initial SYN will go through the expected route.

1) Client 192.168.10.53 > Server 1.2.3.4
2) Router 192.168.10.1 DNATs packet to 192.168.10.10
3) Server 192.168.10.10 sees request from 192.168.10.53
4) Server sends response to 192.168.10.53
5) Client expects response from 1.2.3.4, receives from 192.168.10.10, drops=
 it

Instead you want

1) Client 192.168.10.53 > Server 1.2.3.4
2) Router DNATs packet to 192.168.10.10, SNATs packet to 192.168.10.1
3) Server sees request from 192.168.10.1
4) Server sends response to 192.168.10.1
5) Router uses SNAT to relay response to 192.168.10.53
5) Client gets expected response from 1.2.3.4

See here for implementation details:=20
http://netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

