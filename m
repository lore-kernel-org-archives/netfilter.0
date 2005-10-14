From: Brandon Evans <maillists@hosttuls.com>
Subject: Re: HowTo connect a Cisco 2950 switch behind iptables?
Date: Fri, 14 Oct 2005 16:57:14 -0700
Message-ID: <435045DA.6070903@hosttuls.com>
References: <434ECB83.80800@hosttuls.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434ECB83.80800@hosttuls.com>
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
Cc: netfilter@lists.netfilter.org

Brandon Evans wrote:
> Hi all,
>     I have a Fedora 3 Box with 2 nics setup up as a firewall.
> I can connect another server to the firewall and get connected to the 
> Net just fine.  This doesnt work when I connect the switch to the 
> iptables box.  Obvysly I am missing something - can someone point me in 
> the right direction?
> 
> Here is my setup
> 
> ---WAN-->[iptables box]---->[cisco switch]--->[servers]
> 
> 

This turns out to be some sort of kernel issue.  As soon as I upgraded 
to 2.6.13-1.1526_FC4, the switch started working fine.


-- 

Thanks,
     Brandon Evans

  "I wouldn't recommend sex, drugs or insanity for everyone, but they've 
always worked for me."
-Hunter S. Thompson

