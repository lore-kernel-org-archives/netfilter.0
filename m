From: Jason Costomiris <jcostom@jasons.org>
Subject: Re: eth0, eth1, eth2 ??
Date: Sun, 30 Jun 2002 11:17:01 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020630151701.GA20967@jasons.org>
References: <003f01c21f99$d6f0d540$5107d6d1@nebuchadnezza>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <003f01c21f99$d6f0d540$5107d6d1@nebuchadnezza>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim <twr@bellsouth.net>
Cc: iptables <netfilter@lists.samba.org>

On Sat, Jun 29, 2002 at 11:21:50AM -0700, Tim wrote:
: This question is a confirmation of what I believe I already know but not 
: totally sure about. On my firewall box, as mentioned previously, I have 
: three NICs. On PCI slot 1: video card; PCI slot 2: 1st NIC; PCI slot 3: 
: 2nd NIC; PCI slot 4: 3rd NIC. Now, eth0 would be the 1st NIC  on slot 2 ? 
: Is this correct ? I need to confirm this in order to know which NIC Iam 
: going to plug into on the firewall box from the router [location of eth0, 
: eth1, eth2], the LAN, and the DMZ and also write rules for the different 
: chains.

You can't always count on that to be constant.  For instance, when the 
Linux kernel went from 2.2 to 2.4, on certain chipsets, the PCI bus scanning
order reversed, thus doing a 180-degree flip on your interface names.

Your safest bet *ALWAYS* is to write down the MAC addresses of the cards,
and the position the card inhabits.  At that point, ifconfig is all you
need to figure out which card is eth0, eth1 and eth2.

Typically though, what you said should be true.  The card closest to the 
PCI bus controller should be eth0, next closest eth1, etc.

: 90% of networking problems are routing problems.
: 9 of the remaining 10% are routing problems, but in the other direction.
: The final 1% might not be routing, but check it anyway.

You forgot the foremost axiom of networking.  It's almost never the $100k
router/switch/firewall.  It's the $2 cable that some bozo unplugged.

-- 
Jason Costomiris <><           |  Technologist, geek, human.
jcostom {at} jasons {dot} org  |  http://www.jasons.org/ 
          Quidquid latine dictum sit, altum viditur.
                    My account, My opinions.

