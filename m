From: seberino@spawar.navy.mil
Subject: Re: problems converting iptables script from eth2 ....
Date: Wed, 29 Jan 2003 15:05:23 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030129150523.A14273@spawar.navy.mil>
References: <3E37CA31.3010907@optushome.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E37CA31.3010907@optushome.com.au>; from nagajuna@optushome.com.au on Wed, Jan 29, 2003 at 11:33:53PM +1100
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
Content-Transfer-Encoding: 7bit
To: Santi <nagajuna@optushome.com.au>
Cc: netfilter@lists.netfilter.org

This firewall has 2 NICs for private LAN and 1 to connect
to Internet.  I can access Internet from firewall
fine with new DSL service if I kill iptables filtering.

I tried to modify old static ip script for DSL.
(eth2 became ppp0)

Now I have a new guess...

Does DSL/PPPoE need to open certain other ports, etc.
I don't know about?? If so that would explain why
it don't work with old static ip script that closes
all ports it don't need.

Chris


On Wed, Jan 29, 2003 at 11:33:53PM +1100, Santi wrote:
> 
> You mean you don't get any access to the Internet from any
> machines on your private network and / or from the firwall machine
> itself?
> I have the same mysterious problems until I tweaked these:
> 
> # Flushing pre-existing rules:
> iptables --flush INPUT
> iptables --flush OUTPUT
> iptables --flush FORWARD
> iptables -t nat --flush
> iptables -t mangle --flush
> 
> # Policies
> # Set the default policy:
> iptables --policy INPUT ACCEPT
> iptables --policy OUTPUT ACCEPT
> iptables --policy FORWARD DROP
> 
> # This rule affects LAN access to the Internet.
> # If DROPped access is denied.
> iptables -t nat --policy PREROUTING ACCEPT
> 
> # This rule affects the localhost:
> iptables -t nat --policy OUTPUT ACCEPT
> 
> # Specifies source changes to outgoing packets routed
> # through the box (SourceNAT, MASQUERADE). Somehow,
> # setting this to DROP denies access to X-server.
> iptables -t nat --policy POSTROUTING ACCEPT
> 
> # This rule affects packets originating from the LAN
> # and is destined for the Internet:
> iptables -t mangle --policy PREROUTING ACCEPT
> 
> # This rule affects Internet access for the host machine
> # and pings originating from the LAN: if set to drop then access is		# 
> denied!
> # A drop policy does not affect LAN access to the Internet.
> iptables -t mangle --policy OUTPUT ACCEPT
> 
> I don't know what the problem is the above settings restored my services 
> again when I had a similar settup to yours.  Right now I'm rewritting 
> FORWARD rules for eth0/eth1 pairing, INPUT/OUTPUT rules for 
> eth0(Internet connected) as well as INPUT/OUTPUT rules for eth1 (private 
> LAN connected).  My new rules may mean that I will be able to set the 
> aforementioned rules to DROP.
> 
> 
> Maybe this helps you a bit in some way.
> 
> 
> 
> 

-- 
_______________________________________

Dr. Christian Seberino
SPAWAR Systems Center San Diego
Code 2363
49590 Lassing Road, Room A339
San Diego, CA 92152-6147
U.S.A.

Phone: (619) 553-7940
Fax:   (619) 553-1269
Email: seberino@spawar.navy.mil
_______________________________________

