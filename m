From: Rudi Starcevic <tech@wildcash.com>
Subject: Re: Port-forwarding Perfomance
Date: Thu, 24 Feb 2005 08:09:09 -0800
Message-ID: <421DFC25.5010000@wildcash.com>
References: <421D2F04.8090100@wildcash.com>	<1109156169.11713.2.camel@nostromo.bgsecm.com>	<421DE4AF.6040702@wildcash.com>
	<20050223211053.GA12107@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050223211053.GA12107@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

>1 - you have a speed/duplexing mismatch between the internal interface
>of the firewall and your internal switch...or the windows box and the
>internal switch (but you should notice that slowing internal
>transfers)...or both.
>  
>

Thanks, am checking on this one now ..

>2 - your internet connection is ppp/pppoe and you have an MTU problem.
>since the linux gateway is directly connected, it knows to lower the MTU
>of the external interface, but machines behind it would continue to
>assume an MTU of 1500; and in the absence of functioning PMTU
>discovery, would suffer from significant packet loss due to the need for 
>fragmentation.
>  
>
This is on a 100MB link at choopa .com.
The windows machine being forward to is on a Gigabit network.

>3 - you're using some traffic shaping script (like the wondershaper) and
>it is misconfigured.
>  
>
Only using Iptables.

Thanks for these leads, am following up now.

Cheers
Rudi


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


