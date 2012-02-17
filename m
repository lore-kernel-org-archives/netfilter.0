From: Andreas Herz <andi@geekosphere.org>
Subject: Proper ipset userspace version for 3.0.X longterm kernel
Date: Fri, 17 Feb 2012 08:35:10 +0100
Message-ID: <20120217073510.GJ23570@workstation>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i have a linux setup with the longterm kernel 3.0.X and i want to use
ipset. What i want to know is, what ipset 6.X version is the proper to
use with the 3.0.X kernel?
I saw several patches up to 2011-06-05 that are in the kernel. Then i
compared the kernelspace code from the kernel from kernel.org with the
ipset files from the ipset/netfilter page. I found out that version 6.3
has the fewest of all differences.

To be more precisely, i have 3.0.X ipset kernelspace and i want to know
which version i have to download and build to have the proper userspace
part. I had ipset 6.9.1 installed, worked fine but for example when i
tried to do "ipset create foobar hash:net,iface" the process was dead
and not killable. This one is clear, cause hash:net,iface is not part of
the kernelspace part in 3.0.X.

So is 6.3 the right ipset userspace version? And if yes, then why are
there still so many diffs like the "u32 flags" that are missing in 3.0.X
in the set files but are integrated in 6.3.

Or do you suggest to avoid the ipset kernelspace part from the 3.0.X
kernel and use the ipset for both, kernel- and userspace, from the
website?

-- 
Andreas Herz
