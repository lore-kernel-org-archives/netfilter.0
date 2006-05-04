From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: connbytes patch eliminated
Date: Thu, 04 May 2006 16:57:11 +0100
Message-ID: <445A2457.7000903@dsl.pipex.com>
References: <4458F4D1.1000503@contactdesigns.com>
Reply-To: andy.furniss@dsl.pipex.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4458F4D1.1000503@contactdesigns.com>
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
To: Michael McCallister <mikemc-netfilter@contactdesigns.com>
Cc: devik@cdi.cz, laforge@netfilter.org, netfilter@lists.netfilter.org

Michael McCallister wrote:
> Hello,
> 
> First, a warning - I am a newbie to netfilter, so I may ask some stupid 
> questions here.  I believe the connbytes patch offers exactly what I am 
> looking for - granted it is listed as experimental, but I am willing to 
> test it out since if offers the functionality I think I need - mainly 
> depriotizing bulk transfers.  I am concerned because it appears it was 
> dropped from the main linux kernel, the last kernel I found with it was 
> linux-2.6.15.7.  Also, it is not in pom-ng - at least I could not find 
> it in pom snapshots or cvs 
> (http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng/).  
> So I get the impression there may be plans to get rid of the connbytes 
> patch.  The latest iptables still does checks for it though "[ -f 
> $KERNEL_DIR/net/ipv4/netfilter/ipt_connbytes.c ] && echo connbytes".  
> Was there a decision that it was not suitable anymore and it is being 
> eliminated in favor of another approach?  If so, any advice as to the 
> new approach is greatly appreciated.  Also, if it was dropped from the 
> kernel/pom because it was highly unstable and caused system crashes - 
> that would be great information too :-)
> 
> Thanks for any help - my apologies if I missed something obvious.
> Michael
> 

Still there new name - the whole netfilter config has changed since I 
last did one.

[andy@amd ~]$ grep -i connbytes /boot/config-2.6.16.11
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m

Andy.



