From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: Conntrack full, but not really
Date: Wed, 24 Mar 2004 15:57:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080169030.8520.122.camel@smoogen2.lanl.gov>
References: <4061FA01.4050604@drzeus.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4061FA01.4050604@drzeus.cx>
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
To: Pierre Ossman <drzeus@drzeus.cx>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-03-24 at 14:13, Pierre Ossman wrote:
> Hi!
> 
> I'm having the standard problem of the connection tracker running out of 
> space, but this time with a twist. If I check how many connections it is 
> currently tracking it is nowhere near the upper limit. I've searched 
> through the archives and haven't found anything like this.
> 
> The machine is a P-2 333 MHz with 96 MB of RAM doing nothing but 
> routing. It's running Red Hat 9 with kernel 2.4.20-28.9 (although the 
> problem exists with other Red Hat kernels). The problem appears after 
> about a month of uptime. After that the machine needs to be rebooted to 
> recover (flushing out the connection tracker might work aswell but that 
> doesn't really make the problem less severe).
> 

The problem is with a conntrack patch that Red Hat is including from an
old Alan Cox tree. It seems to leak memory somewhere so that if you look
in /proc/net/ip_conntrack it is 'empty' but if you look at
/proc/slabinfo it is full. 

The problem can show up pretty quickly if the ip_conntrack_ftp is loaded
on a heavy server. My fix has been to get a 2.4.25 kernel and compile it
as an RPM and use it. 

Beyond that, maybe RH will offer a fixed kernel for RHL-9, but I am
doubting it.

-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Lab  CCN-5 Sched 5/40  PH: 4-0645
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


