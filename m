From: Klaus Wacker <klaus_gr_W_kl_Acker@web.de>
Subject: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 13:44:48 +0200
Message-ID: <1530165788@web.de>
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

On Tuesday 31 July 2007 11:24, Klaus Wacker wrote:
> Yes, did that and then I try to run it but it only says "cannot execute
> binary file"
>What machine were you using to compile the iptables binary?

>You mentioned, your target machine is a PPC, if you compile iptables on an x86 
>machine without cross compiling option for PPC, you will end up with an Intel 
>binary that will not run on Power-PC architecture.

>Frank
>I compile on a PC linux box, my target is a PPC 85xx. I use a denx distro.
>First I thought this goes into the kernel and the KERNEL_DIR takes care of that. 
>I did have set my CROSS_COMPILE to my target and did set the PATH as well. I've just tried again with ARCH=ppc and CROSS_COMPILE=ppc_85xx-  
>;this doesn't work either.
>Klaus

My tool chain does not work. I used "readelf" and it does tell me the file is been compiled for a 80386 
So I will dig more into that direction. Cheers
Klaus
_____________________________________________________________________
Der WEB.DE SmartSurfer hilft bis zu 70% Ihrer Onlinekosten zu sparen!
http://smartsurfer.web.de/?mc=100071&distributionid=000000000066


