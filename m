From: Charlie Brady <charlieb-netfilter@budge.apana.org.au>
Subject: Re: DNATing back to the same network
Date: Thu, 13 Jan 2005 10:35:20 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0501131034010.2774-100000@e-smith.charlieb.ott.istop.com>
References: <Pine.LNX.4.58.0501131538030.16403@desktop.agenda.si>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0501131538030.16403@desktop.agenda.si>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: danci@agenda.si
Cc: netfilter@lists.netfilter.org


On Thu, 13 Jan 2005 danci@agenda.si wrote:

> I have a firewall with a number of DNAT rules for various ports/hosts. It 
> would be good if local users could use the same DNAT's. However, as it 
> seems this doesn't work.
> 
> My firewall has a public IP. Some ports on this IP are DNATed to different 
> hosts on the local network. DNAT works for users that connect from the 
> internet.
> 
> However, when a local users tries to connect to the public IP and DNATed 
> port, the connection fails. Which is basically logical as the server 
> receives a packet with the source IP of the actual user and it answeres 
> directly to that IP.
> 
> Is it possible to change netfilter behaviour? Any other work-around for 
> that?

Set up split horizon DNS so that the internal clients go direct to the 
internal IP, rather than to the public IP.

---
Charlie


