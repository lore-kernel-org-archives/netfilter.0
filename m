From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: denying local traffic
Date: Tue, 11 Feb 2003 20:28:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211202837.1225ac17.arnt@c2i.net>
References: <000101c2d1df$3166fb60$bb00a8c0@DOUG1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c2d1df$3166fb60$bb00a8c0@DOUG1>
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
To: netfilter@lists.netfilter.org

On Tue, 11 Feb 2003 10:06:40 -0500, 
"Doug Yeager" <doug@aircomwireless.net> wrote in message 
<000101c2d1df$3166fb60$bb00a8c0@DOUG1>:

> I'm using nocat as a wireless gateway w/ the hostap driver. This is 
> Great because I should be able to use iptables firewall rules to 
> Administer things. I've had some success w/ these rules as I'm new to 
> iptables.
>  
> What I can't figure out is how to block local traffic between clients 
> on the LAN. Basically, I want them to be invisible to each other but 
> be able to get to the internet through the gateway.
> Right now they can get to the internet but can see each other's shares
> and so forth.
  
> What should be the iptables commands for doing this.
>  
> My lan is 192.168.19.0/255.255.255.0

..ascii art figure?  We use vpn (poptop) tunnels, but your net 
is likely different from ours.  

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



