From: Jason Opperisano <opie@817west.com>
Subject: Re: ipsec troubles
Date: Fri, 15 Oct 2004 15:33:36 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041015193336.GA7878@bender.817west.com>
References: <20041015184450.GA7688@bender.817west.com>
	<0f4001c4b2ea$fbafa460$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0f4001c4b2ea$fbafa460$49caa8c0@caris.priv>
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

On Fri, Oct 15, 2004 at 04:12:58PM -0300, Peter Marshall wrote:
> Thank you again for the quick reply ... I am not sure if your suggestion
> will work though ... my vpn server is not on my firewall .. it is between my
> internal and external ... so basically, the troubling packets will come in
> through my external firewall, hit the vpnserver, leave the vpnserver and
> head to my internal firewall.  They are then supposed to pass through to the
> server that has the webpage I am trying to get to, and then return the page
> back accross the vpn link to the remote server ....
> 
> I guess what I am getting at is there is no ipsec_if on the firewall ..as
> the vpn server is a standalone server ....
> 
> Peter

couple of things:

first--you only can control the packets that leave your network sent to
the remote network.  if they have a problem on their end as well--they
need to fix it at their side...

that being said--find the last place in your network where packets
destined for the remote VPN network are in the clear, and apply the
TCPMSS rule there.  if i'm understanding you correctly--this would be on
your internal firewall and you would identify the packets by their
destination network...maybe like:

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p tcp --syn \
    -d $REMOTE_VPN_NET -j TCPMSS --set-mss 1440

-j

-- 
Jason Opperisano <opie@817west.com>

