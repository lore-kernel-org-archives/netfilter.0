From: Michael Gale <mgale@utilitran.com>
Subject: Re: Leaky ip_conntrack_ftp in Red Hat kernels
Date: Fri, 12 Dec 2003 11:51:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031212115147.58d95778.mgale@utilitran.com>
References: <1071251376.6079.22.camel@smoogen1.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071251376.6079.22.camel@smoogen1.lanl.gov>
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

	Why not use another distro ... one that does not all the stable running linux kernel.

Since this only seems to be a problem with RH ... who ... well lets face it. 

May not be around much longer ...

Michael.


On Fri, 12 Dec 2003 10:49:36 -0700
Stephen Smoogen <smoogen@lanl.gov> wrote:

> I am working on tracking down a 'leak' in ip_conntrack_ftp in the RHL
> 7.x kernels that we are seeing on several FTP servers. The leak seems to
> occur with some servers that have automated cron jobs that get updates
> every hour. What happens is that as time goes on, we see a larger
> disconnect between /proc/slabinfo and /proc/net/ip_conntrack.
> ip_conntrack will state that it has only 2-4 entries in it, but the
> kernel will state that it has run out of entries and looking at the
> /proc/slabinfo we see it has filled up and isnt releasing any entries. 
> 
> By various testing of putting all the rules to ACCEPT and keeping the
> modules in, and then removing a module at a time, I have gotten it down
> to something in the ip_conntrack_ftp. Having the module in the system
> will eat up the standard number of entries within 20 hours. I am trying
> to figure out where to proceed next in order to help fix:
> 
> 1) Try a recompiled kernel with POM-20030912 and see if it works?
> 2) Try some sort of flag to get more info?
> 3) Anything else?
> 
> The kernel is Red Hat's patched 2.4.20-24.7
> 
> Thanks (and thankyou all for your work).
> 
> -- 
> Stephen John Smoogen		smoogen@lanl.gov
> Los Alamos National Lab  CCN-5 Sched 5/40  PH: 4-0645
> Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
> -- So shines a good deed in a weary world. = Willy Wonka --
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

