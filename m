From: "Tom Michiels" <linux@w3s.be>
Subject: Re: `Microsoft VPN and iptables
Date: Sat, 09 Nov 2002 13:30:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <WorldClient-F200211091330.AA30220011@w3s.be>
References: <1653.10.254.2.5.1036822899.squirrel@www.nobarrier.co.za>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1653.10.254.2.5.1036822899.squirrel@www.nobarrier.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan <infomail@nobarrier.co.za>, netfilter@lists.netfilter.org

Jonathan,

Is your IP47 protocol setup okay ? If you are using ms pptp to setup a 
vpn connection you need to know that the initial authentication is based 
upon communication over 1723/tcp. When the authentication is achieved 
then communication starts over an IP protocol with number 47. Your router 
then should be able to route this protocol. 

In most cases the issue is that the router is not able to forward this ip 
packets.

check this out : http://www.impsec.org/linux/masquerade/VPN-howto/VPN-
Masquerade.html#toc1


Grtz,

Tom
-----Original Message-----
From: "Jonathan" <infomail@nobarrier.co.za>
To: <netfilter@lists.netfilter.org>
Date: Sat, 9 Nov 2002 08:21:39 +0200 (SAST)
Subject: `Microsoft VPN and iptables

> Hi all
> 
> Could some help me with this or point me in the right direction.
> 
> I have a few microsoft machine in side my linux firewall and I need to
> use
> microsoft VPN to connect to a microsoft machine on the internet
> when I double click on the icon is says " Connecting to
> ???.???.???.???"
> and then says "Verifing Usernamd & Password" and then times out. If I
> dial
> into the net and bypass the firewall I can connect.
> Thank you
> Jonathan X Peers
> 
> jonathan@nobarrer.co.za
> 
> 
> 
> ______________________________________
> Mail has been scanned and protected by No Barrier Communications
> www.nobarrier.co.za


