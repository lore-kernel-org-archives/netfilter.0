From: Blair Vessey <vessey@upei.ca>
Subject: Looking for ipt_connlimit.so
Date: Thu, 25 Sep 2003 16:24:57 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F734109.1020703@upei.ca>
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

I'm trying to get to the point where I can use the connlimit feature to 
limit per-host connections.  I must be missing a step (or several) 
because when I try to add a rule that uses the connlimit match, I see 
the following message:

iptables v1.2.8: Couldn't load match 
`connlimit':/lib/iptables/libipt_connlimit.so: cannot open shared object 
file: No such file or directory

I've scanned source trees and such looking for this file or its source, 
and have come up empty.  I'm hoping someone could suggest what I need to 
try next.

Here's some background on how I got here:
  - Debian woody with a sprinkling of sarge
  - Downloaded kernel-source-2.4.22
  - Did a make oldconfig, and make dep
  - Grabbed patch-o-matic from CVS
  - Use p-o-m to apply base/connlimit.patch
  - Continued with make modules, make bzImage
  - Used Debian make-kpkg utility to produce a kernel package
  - Installed newly minted kernel package on machine in question
  - Rebooted
  - modprobe'd ipt_connlimit

I noticed someone else back in August asking the same question (looking 
for ipt_connlimit.so), but didn't see a response.

Can anyone point me in the right direction?

Thanks for the read,
Blair
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Blair Vessey                         VESSEY@UPEI.CA
Systems Manager, University of Prince Edward Island
Charlottetown, Prince Edward Island, Canada C1A 4P3
=-=  Voice: (902) 566-0388 Fax: (902) 566-0958  =-=
"An ounce of perception, a pound of obscure" - Rush



