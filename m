From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Packet dumping or mirroring
Date: Wed, 18 Feb 2004 17:34:12 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040218173412.525f2012@mgalepc.utilitran.com>
References: <20040218135436.309837c7@mgalepc.utilitran.com>
	<200402182153.40283.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402182153.40283.Antony@Soft-Solutions.co.uk>
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

Hello,

	My mistake ... according to the documentation it is libcap that can not keep
up. 

Michael.


On Wed, 18 Feb 2004 21:53:40 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Wednesday 18 February 2004 8:54 pm, Michael Gale wrote:
> 
> > with traffic that is faster then 100MB HD.
> >
> > So anything 10MB FD and slower is ok, but anything over that limit ntop can
> 
> > Solution 1:
> > First you create a "tmpfs" .. for example in your NTOP home directory call
> > it tmp (/home/ntop/tmp). Now make this directory a RAM drive that gets
> > mount everytime we boot up, about 50MB (maybe).
> 
> If your problem is not being able to keep up with >10Mbps FD or 100Mbps HD, 
> then 50Mbytes is going to fill up pretty quickly...
> 
> 1. If you capture full packets, assume network is running at 50Mbps on 
> average; that's 6.25Mbytes per second - your ramdisk fills up in 8 seconds.
> 
> 2. If you just capture headers, assume network is again running at 50Mbps, 
> with 1500 byte packets one way and empty packets (headers only) the other, 
> also assume headers are 48 bytes.   50Mbps / (1548 x 8) = 4038 packets / sec. 
>  
> 4038 x 48 = 190kbytes / sec.   Your ramdisk now lasts for 258 seconds (or a 
> bit more than 4 minutes).
> 
> Of course, if your network traffic is not running at 50Mbps then your ramdisk 
> will last longer, but then ntop would have been able to keep up on its own 
> anyway....
> 
> Regards,
> 
> Antony.
> 
> -- 
> If builders made buildings the way programmers write programs, then the first 
> woodpecker to come along would destroy civilisation.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 
> 
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

