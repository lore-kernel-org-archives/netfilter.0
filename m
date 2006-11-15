From: =?ISO-8859-1?Q?Magnus_M=E5nsson?= <ganja@0x63.nu>
Subject: Re: iptables promisc mode
Date: Wed, 15 Nov 2006 21:27:48 +0100
Message-ID: <455B7844.1010506@0x63.nu>
References: <455B6DC7.4010904@0x63.nu>
	<Pine.LNX.4.64.0611152006150.24515@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0611152006150.24515@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org
Cc: magnusm@massive.se


>
> As long as the firewall machine that runs iptables is the gateway from 
> the lan to the internet and vice versa, this is already happening, 
> iptables sees all the traffic in both directions, and can act on it 
> was well, layer 4 and above.  Nothing to add, no patch required.  But, 
> to have details in the logs of what is passing requires that you build 
> and configure your rules properly, with log statements in your case 
> being well defined and covering a number of common protocol ports.  
> One issue you will face is that most of the traffic you are trying to 
> monitor, is not well defined nor restricted to any common ports, which 
> is whyyou have faced issues in preventing the traffic and even with a 
> layer 7 module.
>
> Plan on having at least one person devoted to nothing but monitoring 
> traffic and logs for sometime to get a handle on what your users are 
> abusing.
>
> Of course common theory is that this kind of abuse is best handled at 
> the HR level, a frewall is not the best place to hadle this kind of 
> policy issue.
>
> Thanks,
>
> Ron DuFresne
But since my firewall are two redundant Cisco Pix 515E I dont use any 
linux machine as a gateway, that's why I have the port mirroring in the 
routing switch. And the goal is not to stop the "abusing" in the 
firewall, only to detect and log it for later investigation when we feel 
like we have the need.

But thanks for the answer. .)

