From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: How to loop back internal traffic?
Date: Sat, 10 Feb 2007 01:36:14 -0800 (PST)
Message-ID: <261522.7058.qm@web56210.mail.re3.yahoo.com>
References: <BAY101-F34372C92C74BBC676F0D39D9930@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY101-F34372C92C74BBC676F0D39D9930@phx.gbl>
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
To: Jorge Canas <jcanas2000@hotmail.com>, netfilter@lists.netfilter.org

Hi, 
try this
iptables -t nat -A PREROUTING -p tcp --dport 80 -i
ppp0 (or how you call it ) -j DNAT --to-destination
ip_address_of_server_in_internal_network

Regards 
--- Jorge Canas <jcanas2000@hotmail.com> wrote:

> Hi,
> 
> I have a machine configured as my gateway: nat, fw &
> dhcp server for other 
> machines inside my local network.  The gw machine
> has a public IP (assigned 
> via DHCP from ISP) and a public domain name (updated
> through ddns).
> 
> I have one of my other internal machines running a
> webserver.  The gw just 
> does port forwarding of external traffic (destined
> for port 80) to this 
> other internal machine.
> 
> How do I configure the firewall rules on the gw so
> that the port forwarding 
> also occurs when my other local network machines try
> to go to the website 
> via the public domain name?
> 
> Thanks.
> 
>
_________________________________________________________________
> Invite your Hotmail contacts to join your friends
> list with Windows Live 
> Spaces 
>
http://clk.atdmt.com/MSN/go/msnnkwsp0070000001msn/direct/01/?href=http://spaces.live.com/spacesapi.aspx?wx_action=create&wx_url=/friends.aspx&mkt=en-us
> 
> 
> 



 
____________________________________________________________________________________
Don't pick lemons.
See all the new 2007 cars at Yahoo! Autos.
http://autos.yahoo.com/new_cars.html 

