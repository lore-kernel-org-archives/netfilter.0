From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: using NetFilter to share the SAME SINGLE IP between a Linux
	router AND a computer simultaneously
Date: Mon, 20 Jun 2005 15:02:00 +0100
Message-ID: <200506201502.00189.gdh@acentral.co.uk>
References: <00c301c5759c$6771b3e0$02c8a8c0@computer1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00c301c5759c$6771b3e0$02c8a8c0@computer1>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 20 June 2005 14:31, John Wigley wrote:
> Hi,
>
> Before anyone says that this is mad and that it can't be done, it can be
> done perfectly well and all WESTELL ADSL / Ethernet routers have this
> functionality along with some no name Far Eastern origin broadband routers
> based on a Conexant OEM reference design.

I'd just like to add weight to this call - it's certainly been done in these 
cheapy routers, usually called 'PPP Half Bridge'. The router terminates the 
PPP session, and still launches a DHCP server for the LAN, which will only 
ever give out one lease, the public address allocated by the ISP, and it does 
some majik to translate between them.

However, there is another option... 

This morning for the first time I used a Linksys ADSL2MUE device and was 
disappointed to find that it did not support port forwarding or DMZ host. 
Even in the UK with BT's PPP-over-ATM setup, what you can do is configure the 
modem in 'Bridge only' mode - you do not give the modem your ADSL username 
and password.

Then you run 'pppoeconf' in Linux (yes, PPPoE !) and give it your ADSL 
user+pass - it will give you a ppp0 device set with the public IP address so 
you can easily assign QoS and proper firewalling to it :))

Well worth a look!

Cheers,
Gavin.

