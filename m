From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: difference between proxy server and NAT???
Date: Mon, 20 Oct 2003 11:59:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310201059.h9KAxX728289@onyx.rockstone.co.uk>
References: <83055D4B014C9E478D2F04624B9E82CF39E829@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CF39E829@noveldc.novelgmt.mu>
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

On Monday 20 October 2003 11:45 am, Gilles Yue wrote:

> Dear all,
>
>                         What's the difference between somebody using a
> proxy server such a squid to share the internet and someone using NAT/IP
> Masquerade?

Packets don't get routed through a proxy server - the request is handled by 
the proxy, and a new request to the true destination machine is generated.   
There are two independent network connections involved - client to proxy, and 
proxy to server.

NAT is simply a router which fiddles around with the source (and perhaps 
destination) address in the IP header.   Packets go through the machine, so 
there's only a single network connection involved - client to server (through 
the NAT machine).

Antony.

-- 

If builders built buildings the way programmers write programs,
then the first woodpecker that came along would destroy civilisation.

