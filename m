From: Marco <marco.nicoloso@fastwebnet.it>
Subject: Re: Iptables fails on -m state --state!
Date: Fri, 18 Feb 2005 21:47:17 +0000
Message-ID: <42166265.5080201@fastwebnet.it>
References: <4214DD69.50903@fastwebnet.it>	<49063.142.169.215.10.1108661774.squirrel@142.169.215.10>	<42165B25.3010800@fastwebnet.it>
	<20050218201623.GA432@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050218201623.GA432@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Jason Opperisano wrote:

>On Fri, Feb 18, 2005 at 09:16:21PM +0000, Marco wrote:
>  
>
>>cat /proc/net/ip_tables_matches | grep state doesn't return anything but 
>>the contents of ip_tables_matches are:
>>
>>tcp
>>udp
>>icmp
>>    
>>
>
>it sounds an awful lot like you compiled your kernel without:
>
>  CONFIG_IP_NF_MATCH_STATE=y
>
>and you would obviously also need:
>
>  CONFIG_IP_NF_CONNTRACK=y
>
>in there as well...
>
>-j
>
>--
>"When will I learn? The answer to life's problems aren't at the bottom
> of a bottle, they're on TV!"
>         --The Simpsons
>
>  
>
Of Course I did, as I said in the previous post! But I think I'll try 
with a different kernel version (maybe the vanilla sources for 2.6.10). 
Thanks.

Marco Nicoloso


