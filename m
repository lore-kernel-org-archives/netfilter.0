From: "prince" <prince@resoftcorp.com>
Subject: Re: iptables v1.2.7a: can't initialize iptables table `filter'
Date: Mon, 12 Jan 2004 17:25:37 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040113012537.M74352@resoftcorp.com>
References: <20040113001933.M22372@resoftcorp.com> <40033D65.8010408@lintelsys.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40033D65.8010408@lintelsys.com.au>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Alex!,
Please find the output of 'uname -a'

Linux dev9.my-comp.com 2.4.20-28.9BOOT #1 Thu Dec 18 13:27:13 EST 2003 i686 
i686 i386 GNU/Linux

Tim:
I don't think I have ipchains running. 

% rpm -qa | grep ipchain retuns nothing.

% rpm -qa | grep iptables
iptables-1.2.7a-2

Note: Recently there was an security alert from RedHat (forwarded by the 
hosting provider) to upgrade the kernel to the latest version. so, I did 
upgrade the kernel. Probably this might have reomved something else. But, I 
don't know how to verify this. Even if it is the case, how do I get the 
iptables working again?

Thanks,
Prince.

On Tue, 13 Jan 2004 11:35:49 +1100, Alex Satrapa wrote
> prince wrote:
> > How do I get this resolved? It seems the problem is after I upgraded the 
> > kernel. I am running RH 9.
> 
> What does 'uname -a' return?  perhaps you've upgraded the modules 
> but booted the wrong kernel?
> 
> Alex





