From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Forward ?
Date: Mon, 24 Nov 2003 09:42:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC218D9.9080705@Loudoun-Fairfax.com>
References: <200311240918.30949.Zoup@zoup.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311240918.30949.Zoup@zoup.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Zoup wrote:

>Hi list :)
>
>im got a cache server with two nic , which way is the best way to say packet 
>come from one of this interface ( which connected to switch ) and go out from 
>nic2 ( which connected to modem ) :) 
>
>thanks in advance .
>
>  
>
I don't understand your question exactly, but the packets that come in 
one NIC and go out the other will cross the FORWARD chain. Any traffic 
going to and from the firewall host crosses the INPUT and OUTPUT chains. 
If you're trying to identify which interface the modem is on, try 
running ifconfig and check the output. In your ruleset interfaces are 
identified by the -i switch (i.e. -i eth0, -i ppp0).

Hope this helps,

Jeff



