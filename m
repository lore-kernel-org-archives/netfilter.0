From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Handling a clients fixed IP address
Date: Wed, 29 Oct 2003 23:35:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310292335.37809.Herman@AerospaceSoftware.com>
References: <BAY10-F94NOrTemXpAJ0002af16@hotmail.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F94NOrTemXpAJ0002af16@hotmail.com>
Content-Disposition: inline
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
To: john zurowski <johnzurowski@hotmail.com>, netfilter@lists.netfilter.org

On Wednesday 29 October 2003 9:04 pm, john zurowski wrote:
> I've been using iptables without problems for almost a year now. A
> situation has however occured where I would like to allow access to users
> with fixed IP addresses onto the LAN in order to gain access to the
> internet. The situation is complicated because the client devices may be
> assigned fixed IP addresses which do not match our subnet or point at our
> gateway. Can iptables be configured in such a way that this could be
> handled
> transparently i.e. without the client having to set up dhcp client service?
>
> _________________________________________________________________
> Tired of 56k? Get a FREE BT Broadband connection
> http://www.msn.co.uk/specials/btbroadband

Hmm, as I understand it:
A visitor plugs a 'foreign' laptop into the wall in your meeting room and 
starts a browser, then he expects to connect to say www.cnn.com without 
having to change *any* settings on his machine, which may be configured to 
talk to a non-existant gateway IP address.  

We hope that your guest IP and Gateway settings do not clash with an existing 
IP address on your network.  If you are concerned about clashes, then you 
would need either a dedicated interface or a virtual LAN interface to 
separate the meeting room from the rest of the place.

Well, this clearly calls for NAT, but it won't be simple.

I think you have to look at "-m state --state NEW, ESTABLISHED, RELATED" and 
"SNAT" to cause every new previously unknown connection attempt and whatever 
follows from that, to be redirected to the External IP on the firewall 
machine.

I think the simplest case would be if you use a dedicated interface or VLAN, 
say eth3 if it is dedicated hardware or eth1.1 if it is a VLAN and then SNAT 
whatever arrives on that interface to the outside IP address of the firewall.

Since the packets would be addressed to a non-existant gateway machine, you 
would need to do DNAT too.

I have a feeling that this problem can be solved with iptables and it would be 
interesting if one of the real iptables gurus can comment.

Cheers,
-- 
Herman

