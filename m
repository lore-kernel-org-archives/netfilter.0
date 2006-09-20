From: Alan Ezust <alan.ezust@presinet.com>
Subject: patchomatic runme script bug - using backup files?
Date: Wed, 20 Sep 2006 15:25:39 -0700
Message-ID: <200609201525.39890.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

I just ran into this bug in runme script from patchomatic - I was writing a 
patch file called linux-2.6.16.29.patch but there was a BACKUP file
called linux-2.6.16.29.patch~ and another one called linux-2.6.patch~
and it seems to be finding the BACKUP files and using them in favor of the 
actual patch files I am developing. Since the output doesn't tell me which 
file it is reading, I couldn't tell what was wrong, and wasted quite a lot of 
time looking at a file that wasn't even being read by runme.




