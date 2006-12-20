From: "Asfand Yar Qazi" <ayqazi@gmail.com>
Subject: Re: ip6tables problem
Date: Wed, 20 Dec 2006 16:37:01 +0000
Message-ID: <79328ea80612200837q45d7bbd5y1723904880f6d90@mail.gmail.com>
References: <79328ea80612191634s1ffbb494ge96c56c771a05d66@mail.gmail.com>
	<slrneoifta.ln3.xpisar@album.ics.muni.cz>
	<79328ea80612200756i538b3f4fp38192730a8518fc5@mail.gmail.com>
	<slrneoinkj.miu.xpisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <slrneoinkj.miu.xpisar@album.ics.muni.cz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Petr Pisar <xpisar@fi.muni.cz>
Cc: netfilter@lists.netfilter.org

On 12/20/06, Petr Pisar <xpisar@fi.muni.cz> wrote:
> On 2006-12-20, Asfand Yar Qazi <ayqazi@gmail.com> wrote:
> > On 12/20/06, Petr Pisar <xpisar@fi.muni.cz> wrote:
> >> On 2006-12-20, Asfand Yar Qazi <ayqazi@gmail.com> wrote:
> >> > I have an ipv6 tunnel on the device 'tunbt6', and another interface on
> >> > eth0 to the rest of my network.
> >> >
> >> > When I enter the following commands:
> >> >
> >> > ip6tables -N filter6
> >> > ip6tables -A filter6 -m state --state NEW -i ! tunbt6 -j ACCEPT
> >> > ip6tables -A filter6 -m state --state ESTABLISHED,RELATED -j ACCEPT
> >> > ip6tables -A filter6 -j REJECT
> >> >
> >> > ip6tables -A INPUT -j filter6
> >> > ip6tables -A FORWARD -j filter6
> >> >
> >> >
> >> > It doesn't work!  I can't even ping6 the machine over eth0 from my
> >> > other computer connected to the same ethernet segment!
> >> >
> >>
> >> IP6 uses ICMP6 for link level address resolution (like IP4 uses ARP).
> >> Therefore you need to accept NEW icmp6 packets. At least some types.
> >> Read draft-ietf-v6ops-icmpv6-filtering-bcp-01.txt (can be found on IETF
> >> FTP server) for more detailes.
> >>
> >
> > I'll just let in all icmp6 packets.  Now to figure out how to do that...
> >
> ip6tables -I filter6 -p icmpv6 -j ACCEPT
>

Yep, figured that out, thanks :-)

