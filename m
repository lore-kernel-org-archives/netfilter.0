From: "it clown" <suse@mailbox.co.za>
Subject: Re: bind 9 and iptables
Date: Fri, 27 Aug 2004 23:10:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-420511790@mail01.infosat.net>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F6@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512F6@asimail2.alphanumeric.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi

Thanks this seemed to have done the trick.I had to add
another rule for tcp aswell. Is it possible for these rules
to slow my browsing abit? Because it seems asif my browsing
is abit slower now since i used the rules?

Regards

On Fri, 27 Aug 2004 16:16:41 -0400
 "Jason Opperisano" <Jopperisano@alphanumeric.com> wrote:
> > Hi All
> >
> > I have a dns with a forwarder to my isp on the iptables
> > box. I am having trouble on getting dns to work
> properly.
> >
> > When i comment:
> >
> > iptables -P INPUT DROP
> > iptables -p OUTPUT DROP
> >
> > DNS will work fine and all the pc's can browse the net.
> >
> > I have tried the following with out any luck:
> >
> > iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> > iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> > iptables -A INPUT -m state --state ESTABLISHED,RELATED
> -j
> > ACCEPT
> >
> > what rule do i need to add to make things more secure
> to
> > get my dns working properly, thanks?
> 
> # allow internal machines to contact the DNS server
> iptables -A INPUT -p udp -i $INSIDE_IF -s $INSIDE_NET -d
> $INSIDE_IP --dport 53 -j ACCEPT
> 
> # allow established an related packets out
> iptables -I OUTPUT -m state --state ESTABLISHED,RELATED
> -j ACCEPT
> 
> normally the "established" rule appears first in your
> chains, if you are using connection tracking.
> 
> -j
> 

_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote

