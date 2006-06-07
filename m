From: "Diana Asnani" <sakal_woman@hotmail.com>
Subject: RE: newbie at routing !!
Date: Wed, 07 Jun 2006 19:31:18 +0800
Message-ID: <BAY19-F75E3A1484E57E5AB08E6D9E8A0@phx.gbl>
References: <001f01c68a17$c04e36b0$0101000a@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001f01c68a17$c04e36b0$0101000a@sterenborg.info>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Rob,

thanks for the reply too...sorry...i guess i just subscribe to the first 
thing i saw in the list...
yup 202.184.41.41 is configured in the same PC as 192.168.206.1
the subnet mask is 255.255.255.240
i will try teh configuration as you have mentioned...i hope it works


>From: "Rob Sterenborg" <rob@sterenborg.info>
>To: <netfilter@lists.netfilter.org>
>Subject: RE: newbie at routing !!
>Date: Wed, 7 Jun 2006 11:50:02 +0200
>
> > I need help!! My VLAN IP is 192.168.202.1. I can ping another PC with
> > the VLAN IP of 192.168.206.1 but i can't ping the 202.184.41.41
> > address in that PC. Am i supposed to do some sort of routing
> > configuration? I am using FC3 as my OS. What am i supposed to do to
> > ping 202.184.41.41? Thanks
>
>Perhaps you noticed that this is the Netfilter list, not Linux Routing ?
>
>Anyway. I'll give it a try.
>- Your IP is 192.168.202.1 and you can ping 192.168.206.1, so I'm
>guessing that your netmask is would be 255.255.0.0.
>- If I understand you correctly, you say that 202.184.41.41 is
>configured to the PC that also has 192.168.202.1.
>
>To be able to ping that IP,
>- you need, on your PC, to set the default gateway to 192.168.206.1 or
>have a specific route for 202.184.41.41 which points to 192.168.206.1.
>- on the machine that holds both 192.168.206.1 and 202.184.41.41, you
>need to enable IP forwarding, make sure that it has routes for both
>networks and check the iptables rules if they permit this FORWARD
>traffic.
>
>If the above does not help you, you should add more details about your
>setup.
>
>
>Gr,
>Rob
>
>

_________________________________________________________________
Find just what you are after with the more precise, more powerful new MSN 
Search. http://search.msn.com.my/ Try it now.


