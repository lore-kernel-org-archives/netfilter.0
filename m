From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Unknown error.
Date: Fri, 11 Aug 2006 15:08:16 +0800
Message-ID: <01ae01c6bd14$eac34860$0100a8c0@newlife>
References: <44DB6E37.8040104@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I don't think you can perform CONNMARK on the INPUT chain
of the filter table, try doing it on the mangle table :-

/usr/local/sbin/iptables -t mangle -A INPUT -j CONNMARK --save-mark

Cheers.
----- Original Message ----- 
From: "Justin Schoeman" <justin@expertron.co.za>
To: <netfilter@lists.netfilter.org>
Sent: Friday, August 11, 2006 1:34 AM
Subject: Unknown error.


> Hi again.
> 
> I was wondering if anybody could help me.  I am using kernel 2.6.17.8 
> with iptables 1.3.5, and I get the following error:
> 
> iptables: Unknown error 4294967295
> 
> for this command:
> 
> /usr/local/sbin/iptables -A INPUT -j CONNMARK --save-mark
> 
> I see a large number of hits for the error message on google, mainly 
> related to iptables 1.3.5, but I have not seen one thread with a 
> conclusive solution.
> 
> Could anybody please give me some pointers on where to start looking? Is 
> this an iptables bug, if so, what is the last good version.  If not, 
> what else can I look for?
> 
> Thanks,
> 
> Justin
> 




