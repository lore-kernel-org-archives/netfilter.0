From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: INPUT or FORWARD;;
Date: Tue, 21 Dec 2004 01:36:48 -0500
Message-ID: <200412210136.48681.Alistair@nerdnet.ca>
References: <20041220132421.DAE032F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041220132421.DAE032F42A@kshira.sterenborg.info>
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

On December 20, 2004 08:24 am, Rob Sterenborg wrote:
> netfilter-bounces@lists.netfilter.org wrote:
> >> A multi-homed firewall having at least two interfaces, is known, at
> >> least to itself by those IP/hostnames combos assinged to its
> >> interfaces.  <i.e. ppp0 and eth0>  So say rules coming from the ppp0
> >> interface into the firewall <INPUT rules> are directed to it's other
> >> name/interface
> >>
> >> -i /dev/ppp0 -d /dev/eth0
> >
> > well--those values make no sense whatsoever, but if you're
> > asking if the following is valid:
> >
> >   iptables -A INPUT -i ppp0 -d $IP_OF_ETH0 -j ACCEPT
> >
> > then yes.  the INPUT chain is traversed by packets destined
> > for a local process (IP addresses).  the input interface is
> > just a tag attached to the packet.
>
> I'm not sure I understand this :
> I agree it's a valid rule (syntax), but I don't think it will ever match
> a packet.
>
> If -i and -d are specified, they both have to match to accept a packet,
> right ?
> Because <ip_eth0> is not assigned to ppp0, how can -i ppp0 -d <ip_eth0>
> ever match for the INPUT chain ?
>

 In weird cases where one has dual routes to the host.
 *cough* like when I first setup my dual routes and was sending stuff out 
 interfaces with the wrong IP .... one ISP dropped the martians, the other
 didn't.  It took me a couple of hours to get the wiring correct
 *cough* IP_NAT_LOCAL *cough*

 Legitimately, one might have two pipes from the same provider, with
 different delivery methods, thus different IPs.  However in THAT case, one
 would drop the interface specification.

 Alistair Tonner

>
> Gr,
> Rob

