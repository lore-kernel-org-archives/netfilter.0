From: "David S. Ahern" <dahern@avaya.com>
Subject: location of source code for kernel modules
Date: Tue, 21 Oct 2003 13:13:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F958552.2020107@avaya.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Where can I find the source for the kernel modules that do connection 
limiting? I see a userspace library for iplimit in the 1.2.8 userspace 
source, but no corresponding module in the 2.4.20 kernel source. Has 
this module been dropped? A google search indicates iplimit may have 
changed names to connlimit, and indeed the cvs repository shows a 
connlimit userspace library. However, I cannot find source for that 
kernel module either.

Essentially what I want is a match to limit the number of simultaneous 
connections to a tcp port (from any IP address). Any suggestions?

Also, just how is the source for the kernel modules maintained relative 
to the userspace code? Can you get the kernel source from the 
netfilter.org web site (or cvs)?

-- 
david ahern
dahern@avaya.com


