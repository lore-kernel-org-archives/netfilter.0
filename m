From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: Re: Can't initialize iptables : using static kernel 2.4.25
Date: Thu, 26 Feb 2004 18:19:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040226181927.76c298d0.j.vriesman@prompt.nl>
References: <20040226164722.84320.qmail@web25202.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040226164722.84320.qmail@web25202.mail.ukl.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

just curious, why would you want to make a static kernel? The last time I did that was 4 years ago, it's easy to make some initrd with modules.

Cheers,
Jeroen.



On Thu, 26 Feb 2004 17:47:22 +0100 (CET)
Jesus Polvareda <jpolvareda@yahoo.es> wrote:

> 
> 
> Hi,
>  
> I have a problem everytime I intend to use iptables. I'm using a redhat 7.2 platform with a 2.4.25 kernel compiled without modules and including iptables components in static kernel.
>  
> I have eliminated the initial iptables 1.2.3a because it gave me the following problem:
> iptables v1.2.3 : can't initialize iptables table `filter' ...
>  
> After installing the iptables v1.2.9 ( a tar.gz and then compilated), the problem was still present. I have even tried a static compilation but same results...
>  
> After looking in this lists, I haven't found any mail related to this problem in case of a static kernel...
>  
> Problem seems that static 2.4.25 kernel (in fact above 2.4.18 I think) doesn't create the pseudo file /proc/sys/kernel/modprobe which is looked by the iptables usermode program even when it is compiled with NO_SHARED_LIBS=1...
>  
> Is there any patch to iptables which can correct this problem? Had anyone had the same problem?
>  
>  
> Thanks in advance,
>  
> Jesus Polvareda
> jpolvareda@yahoo.es
> 
> 
> 
> 
> 
> 
> ---------------------------------
> 

