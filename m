From: Lists <lists@sapience.com>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied
 to eth1.
Date: Wed, 11 Sep 2002 14:19:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7F8925.7050102@sapience.com>
References: <87sn0g4p8o.fsf@prium.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Erik:

I dont know if this does exactly what you want, but have you tried 
putting a

HWADDR=xx:xx:xx:xx:xx:xx

line into each /etc/sysconfig/network-scripts/ifcfg-ethx
This should tie ethx to the specified mac address. Remember to update if 
you change hardware.

Regards,

gene/


Erik Enge wrote:

>Hi all.
>
>I have a question about how ethernet cards work.  I send it here because
>I'm thinking that this community probably has dealt with it before, as
>it seems to me to be an obvious problem (with no apparent solution to
>me; hence this email).
>
>
>
>  
>




