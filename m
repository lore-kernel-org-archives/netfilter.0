From: Jason Opperisano <opie@817west.com>
Subject: Re: icmp unreachable - need to frag
Date: Sun, 24 Oct 2004 11:08:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098630525.9024.19.camel@hubcap.ljm.dom>
References: <1865.172.16.3.2.1098597006.squirrel@172.16.3.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1865.172.16.3.2.1098597006.squirrel@172.16.3.2>
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

On Sun, 2004-10-24 at 01:50, John Wells wrote:
> Gentlemen,
> 
> I'm having a perplexing problem with icmp unreachable packets.  I'm
> running TaoLinux with kernel 2.4.21 and iptables v.1.2.8.
> 
> I have a network setup that includes a DSL connection to the internet, and
> internal lan, and an wireless lan that can connect to the internal lan via
> a PPTP VPN (due to lack of a good ipsec client for Mac OSX).

huh?  OSX has the BSD IPSec stack in its kernel.  if you don't wanna
edit text files to configure it--try:

        http://www.lobotomo.com/products/IPSecuritas/
        
        http://www.afp548.com/Software/VaporSec/index.html

> It essentially looks like this:
> 
> All wireless clients (after authenticated with PPTP): 192.168.0.0/24
> All internal LAN clients: 172.16.0.0/16
> 
> A VPN server/router sits between the wireless and internal lan, with two
> interfaces enabled...one that has a 192.168.0.1 address, and one that has
> a 172.16.3.2 address.  The router takes traffic from the wireless clients
> and masquerades it into the internal network.  If the traffic from the
> wireless clients is destined for the Internet, the packets are again
> MASQ'd on that outbound connection from the internal lan.
> 
> This has worked for some time with only one eMac (MacOSX) connecting from
> the wireless network.  No problems whatsoever.  However, this past week, I
> added a Windows XP laptop to the mix.  It appeared, at first, to be
> working, and indeed it is for most sites.  However, accessing certain
> sites from the laptop...slashdot, wikipedia, amazon.com, cause icmp
> unreachable messages to be sent.  For example, here's an attempt to
> connect to slashdot:
> 
[ snip ]
> 
> I'm no expert regarding this sort of stuff, but logic suggested that the
> problem was with the mtu somewhere on the path.  I did note that the MTU
> on the ppp0 (pptp) interface was 896, so I tried increasing this value. 

ACK!  don't do that.

> No luck, same behavior.  This was also true if I tried to lower it.
> 
> I'm at a loss for what to try, and my research hasn't run across anything
> substantial.  Scrapping the XP laptop is not an option, unfortunately. 
> The eMac continues to function fine on these sites, and I haven't run
> across anything glaringly obvious on the Windows side.
> 
> Is this likely a misconfiguration on my part?  Has anyone experienced
> anything similar?
> 
> I appreciate any insight you can provide.

what you need to do is lower the MSS that is being advertised by the
Windows XP machine.  on the VPN Server/Router:

        iptables -A FORWARD -p tcp --syn -s $WINXP_BOX \
          -j TCPMSS --set-mss 1400
        
if the problem continues--lower that 1400 until the problem disappears. 
i have had to ratchet it down as low as 1330 on IPSec + WiFi setups. 
with your addition of the ppp0 (pptp) MTU of 896--you may need to use
"--set-mss 850" before the Windows XP box will work properly.  another
option that may or may not work, would be to allow the VPN Server/Router
to figure this automatically (which depends on proper PMTU discovery,
which is certainly not a given these days):

        iptables -A FORWARD -p tcp --syn -s $WINXP_BOX \
          -j TCPMSS --clamp-mss-to-pmtu
        
-j

-- 
Jason Opperisano <opie@817west.com>


