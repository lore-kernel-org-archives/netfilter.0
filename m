From: Jason Opperisano <opie@817west.com>
Subject: Re: pptp
Date: Fri, 15 Oct 2004 15:19:00 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015191900.GA7776@bender.817west.com>
References: <20041015063914.GA23147@plain.ev1servers.net>
	<20041015141036.GA6848@bender.817west.com>
	<20041015162541.GA23125@plain.ev1servers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041015162541.GA23125@plain.ev1servers.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Oct 15, 2004 at 11:25:41AM -0500, K. Shantanu  wrote:
> * Jason Opperisano <opie@817west.com> [041015 11:15]:
> > yes--if your are performing SNAT/MASQ for your entire internal network
> > on your gateway, it won't work.  there is a PPTP conntrack and nat module
> > in POM for this situation, but it will only compile against a 2.4 kernel.
> 
> Yes, I am performing MASQ for entire network. Is there no way I can get
> it to work against 2.6 series? I will have a lot of troble downgrading
> the kernel. It is a live server.

i wasn't necessarily recommending that you downgrade to a 2.4
kernel--just pointing out that there's a "fancy" option available, but
it is 2.4-specific.  i am unaware of any successful ports of the PPTP
modules from POM to the 2.6 kernel.

> > one option would be to give the PPTP client a dedicated public IP and
> > perform a one-to-one SNAT/DNAT for that client and allow TCP 1723 and
> > IP protocol 47 outbound from that client and IP protocol 47 inbound to
> > that client from the PPTP server.
> 
> Can you please give an example of this to be on safe side?  Is this something 
> like,
> * I add eth0:1 on Linux box and give it an public IP.
> * redirect all traffic to that IP from ouside to the client having pptp 
> client? Will something like below help,
> iptables -A PREROUTING -d <ext ip> -p tcp -m tcp --dport 47 -j DNAT --to-destination 192.168.10.99

i tried to point this out subtly in my first reply--but you are
confusing "IP Protocol Number 47" with TCP Port 47.  GRE is IP protocol
number 47, analogous to TCP being IP protocol number 6 or UDP being IP
protocol 17...

  iptables -A PREROUTING -d <ext ip> -p 47 \
    -j DNAT --to-destination 192.168.10.99

> iptables -A PREROUTING -d <ext ip> -p tcp -m tcp --dport 1723 -j DNAT --to-destination 192.168.10.99

you don't need to forward TCP port 1723 to the client--but you do need
SNAT rules as well...or rule.  i would do it like this:

  # new public IP for one-to-one NAT for PPTP client
  ip address add $PUBIP dev $OUTSIDE_IF

  # DNAT for PPTP client
  iptables -A PREROUTING -i $OUTSIDE_IF -d $PUBIP
    -j DNAT --to-destination 192.168.10.99

  # SNAT for PPTP client
  iptables -A POSTROUTING -o $OUTSIDE_IF -s 192.168.10.99
    -j SNAT --to-source $PUBIP

  # outbound filter rules for PPTP client
  iptables -A FORWARD -s 192.168.10.99 -d $PPTP_SERVER \
    -p tcp --dport 1723 -j ACCEPT

  iptables -A FORWARD -s 192.168.10.99 -d $PPTP_SERVER \
    -p 47 -j ACCEPT
 
  # inbound filter rules for PPTP client
  iptables -A FORWARD -s $PPTP_SERVER -d 192.168.10.99 \
    -p 47 -j ACCEPT

and that should about cover it...unless i've some sort of heinous
mistake that someone else would be so kind as to point out...

-j
 
-- 
Jason Opperisano <opie@817west.com>

