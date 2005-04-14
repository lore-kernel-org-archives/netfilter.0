From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with DNAT from localhost to LAN via loopback
Date: Thu, 14 Apr 2005 13:18:47 -0400
Message-ID: <20050414171847.GA2040@bender.817west.com>
References: <1113492519.425e8c27488ab@imp1-q.free.fr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1113492519.425e8c27488ab@imp1-q.free.fr>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 14, 2005 at 05:28:39PM +0200, Charles Delorme wrote:
> Hello list...
> 
> I've read a lot in the archive about DNAT/loopback and redirect, but I still
> haven't found what I'm looking for (ok, I had some U2 in my mind at that time.
> Don't you now ? :-)
> 
> My configuration can be simplified as this (configuration is far more
> complicated, but I assume you only need revelant informations) :
> - a linux routeur/firewall/sshd/squid/etc with two interfaces (LAN -RFC1918 -
> and WAN static official IP)
> - a LAN machine hosting a P2P service (PixVillage photo sharing - nothing
> illegal)
> - the P2P protocol only knows about the WAN IP of the linux box.
> 
> I've configured PREROUTING entries and associated POSTROUTING which works
> perfectly from internet or another machine on the LAN. A simple extract :
> 
> $IPTABLES -t nat -A PREROUTING -d $FW_INTERNET -p tcp --dport 3739 -j DNAT
> --to-destination 192.168.38.9:3739
> $IPTABLES -t nat -A POSTROUTING -s $LAN -d $LAN -p tcp --dport 3739 -j SNAT
> --to-source $FW_INTERNET
> 
> My problem is from the linux box when trying "telnet [official WAN IP] 3739"
> which replies "connection refused". "tcpdump -nt -i lo" shows a simple SYN then
> RST. I've add LOG to chains (INPUT/FORWARD/OUTPUT/PREROUTING/POSTROUTING) and
> found this telnet connection does not go via the PREROUTING chain. So it
> doesn't find any local 3739 port listening so it is not redirected to the
> LAN... When I fire up a netcat listing on the port, I can get the connection -
> off course (but as I said before, configuration is more complicated and this
> test was mandatory)
> 
> I've read in the archive this might be the normal behaviour, PREROUTING chain
> being used only for external and not loopback connection. Is that true ?
> 
> Is there a solution via iptables to solve this ?

your kernel needs to be compiled with:

  CONFIG_IP_NF_NAT_LOCAL

in order to DNAT locally-generated packets.

IIRC you then put the DNAT rule in the nat table OUTPUT chain to modify
the destination of local packets.

-j

--
"Quagmire: Hey there little lady. Why don't you turn around and show
 me your Lower East Side.
 Woman (in deep voice): Sure.
 Quagmire: Whoa. Transvestite, back off. Wait a minute... pre-op
 or post-op?
 Woman: Pre-op.
 Quagmire: Whoa. Transvestite, back off."
        --Family Guy

