From: Ben Russo <ben@umialumni.com>
Subject: RE: firewall machine eating lot of memory
Date: 08 Nov 2002 16:18:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036790341.4686.5.camel@ben.mis.tnsi.com>
References: <001b01c16871$64ede530$6601a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c16871$64ede530$6601a8c0@s3ac>
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
To: Rowan Reid <rreid@studio3arc.com>
Cc: 'Sundaram Ramasamy' <sun@percipia.com>, netfilter@lists.netfilter.org

On Thu, 2001-11-08 at 11:21, Rowan Reid wrote:
> I'm noticing the same problem. I have a low usage firewall (3 concurrent
> connections) with httpd, smb, and sshd. But my Memory usage is always
> close to 59Megs of physical Ram. When I us ps to print my usage per
> processs it only adds up to 50%. What is this follow script that you use
> ?
> 
> 
> > Hi,
> > 
> > Ia m using  Rdhat 7.3  kernel 2.4.18-3custom for my firewall, 
> > suddenly its taking lot of memory, after that its not 
> > releasing. I ran the following script to monitor the memory usage.
> > 
> > Morning 3 to 4  its taking all the memory.
> > 
> > please help me on this.
> > 
> > Thanks

Linux Kernels are very GOOD about dynamically allowing memory to be used
for disk buffer and cache.  This is a feature not a bug.

Basically any disk block that is read is kept in memory unless a process
needs more memory than there is free memory pages available, if this
occurs then the cached disk reads that have the oldest access time are 
overwritten when they are allocated to the process.

Anyway, what this means is that if you leave a Linux system up and
running long enough it will always stabilize around 90-99% memory 
utilization.  Because the system is always writing a few blocks of 
log messages here and there.....

"cat /proc/meminfo" will tell you all about it.
For example:

[ben@ben ben]$ cat /proc/meminfo
        total:    used:    free:  shared: buffers:  cached:
Mem:  394219520 388276224  5943296        0  7725056 237547520
Swap: 270942208 50765824 220176384
MemTotal:       384980 kB
MemFree:          5804 kB
MemShared:           0 kB
Buffers:          7544 kB
Cached:         226708 kB
SwapCached:       5272 kB
Active:         206592 kB
Inact_dirty:    110288 kB
Inact_clean:     24752 kB
Inact_target:    68324 kB
HighTotal:           0 kB
HighFree:            0 kB
LowTotal:       384980 kB
LowFree:          5804 kB
SwapTotal:      264592 kB
SwapFree:       215016 kB
Committed_AS:   361692 kB


