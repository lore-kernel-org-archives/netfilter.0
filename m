From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: How make virtual interfaces ( subinterfaces ) on linux machine
Date: Thu, 07 Dec 2006 13:41:44 +0200
Message-ID: <4577FDF8.80401@zoomnet.ro>
References: <428559.74702.qm@web56206.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428559.74702.qm@web56206.mail.re3.yahoo.com>
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
To: Elvir Kuric <omasnjak@yahoo.com>
Cc: netfilter@lists.netfilter.org

Elvir Kuric wrote:
> Hi all, 
>
> I want to know is there some manual or even better
> book how to make virtual interfaces  ( subinterfaces )
> on linux machine and attach VLANs which are
> implemented on switch to these virtaul interfaces.
>
> I just need suggestions for some good reading.
>
> Thank you in advance and regards
>
>
>  
> ____________________________________________________________________________________
> Do you Yahoo!?
> Everyone is raving about the all-new Yahoo! Mail beta.
> http://new.mail.yahoo.com
>
>   
You ned to make sure you have 8021q module loaded

# modprobe 8021q

Then use vconfig to attach 802.1q tags to ethernet frames

# vconfig add ethx 20

(x is a index of ethernet interface card)

This will create the interface ethx.20 (the naming can be change with 
set_name_type option of vconfig, check the manual) wich is similar to a 
cisco subinterface with encapsulation dot1q 20. You can add ip with 
ifconfig, or do everything else you you with a network interface in linux.

