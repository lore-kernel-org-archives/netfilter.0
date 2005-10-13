From: Brandon Evans <maillists@hosttuls.com>
Subject: Re: HowTo connect a Cisco 2950 switch behind iptables?
Date: Thu, 13 Oct 2005 14:50:35 -0700
Message-ID: <434ED6AB.80108@hosttuls.com>
References: <200510132115.j9DLFDaU018407@virt20t.secure-wi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510132115.j9DLFDaU018407@virt20t.secure-wi.com>
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
To: edvin.seferovic@kolp.at
Cc: netfilter@lists.netfilter.org

Seferovic Edvin wrote:
> Maybe you have forgotten to configure your cisco switch? Wrong VLAN maybe? 
> 

> ---WAN-->[iptables box]---->[cisco switch]--->[servers]

Your probably right, I'm not very fluent in cisco.
The switch works fine when I hook the WAN directly up to the switch 
though.  Which leads me to believe I'm missing a iptables setting somewhere.


-- 

Thanks,
     Brandon Evans

  "I wouldn't recommend sex, drugs or insanity for everyone, but they've 
always worked for me."
-Hunter S. Thompson

