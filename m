From: Georgi Georgiev <chutz@gg3.net>
Subject: Re: PPPoE on a bridge, nat sees bridge as incoming interface
Date: Fri, 7 Mar 2008 09:49:18 +0900
Message-ID: <20080307004918.GB31248@possum.gg3.net>
References: <20080306172218.GA14566@possum.gg3.net> <47D069BF.9080208@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <47D069BF.9080208@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

maillog: 06/03/2008-16:01:35(-0600): Grant Taylor types
> On 3/6/2008 11:22 AM, Georgi Georgiev wrote:
>> I am having trouble understaning how bridging and iptables fit together. 
>> The situation that bugs me is: if I do a PPPoE connection over a bridge 
>> with a single physical port, my nat table will see any incoming packet as 
>> coming from the bridge interface, and not the ppp interface. Why?
>
> With out going any further in your email (I've read the rest but IMHO this 
> takes precedence).  Is your kernel configured to have IPTables see your 
> bridged traffic?  Is "CONFIG_BRIDGE_NETFILTER" enabled in your kernel?  
> Here is a quote from help from menuconfig about Bridge Netfilter:
>
> "Enabling this option will let arptables resp. iptables see bridged ARP 
> resp. IP traffic. If you want a bridging firewall, you probably want this 
> option enabled.  Enabling or disabling this option doesn't enable or 
> disable ebtables."
>
> If you turn this off your bridging will be a purely layer 2 operation that 
> IPTables (and ARPTables) will be completely oblivious of.  If you wish to 
> filter bridged traffic you will have to use EBTables. Incidentally I have 
> had better luck turning this off (unless I had to have IPTables filtering 
> of bridged traffic) and using EBTables to filter bridged traffic.  I 
> consider this to be use layer 3 filtering (IPTables and ARPTables) for 
> layer 3 traffic and use layer 2 filtering (EBTables) for layer 2 traffic.  
> In other words don't use layer 3 filtering for layer 3 and 2 traffic which 
> is what this does.  Granted you can use IPTables to filter layer 2 traffic, 
> however you have to be aware of the ramifications and account for them in 
> your firewall and logic in your head.

I agree. I thought the bridge was supposed to behave like a switching
hub. And it probably does, but I had misconfigured it.

I have applided the sysctl fix from the other post in the thread for
now. I'll test your suggestion when I get home.

-- 
(    Georgi Georgiev   (  Q: Why did the lone ranger kill Tonto? A:  (
 )    chutz@gg3.net     ) He found out what "kimosabe" really means.  )
(  http://www.gg3.net/ (                                             (
