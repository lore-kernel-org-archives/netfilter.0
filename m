From: Scott MacKay <scottmackay@yahoo.com>
Subject: Bridge + mangling; any similar experiences?
Date: Tue, 15 Apr 2003 05:04:37 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030415120437.69926.qmail@web13904.mail.yahoo.com>
References: <1050401128.1440.37.camel@raylinux.internal>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050401128.1440.37.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hiyas, sorry to bother this list, but the ebtables
mailing list is kinda quiet (plus the bridge feature I
think is integrated into 2.5 kernel...).

I have been having a problem, and was wondering if
anyone had similar experiences.  I am using 2.4.20;
RedHat distro + recompiled kernel with the latest
ebtables + br thing patch.  The sole, only, and
probably ever only reason is so I can be in bridge
mode and have prerouting & postrouting hooks (so if a
non-ebtables approach is known, please let me know).

I have a custom userspace module which I am using to
mangle packets.  I mangle the contents of TCP/UDP
payloads, recalcing the IP and TCP/UDP headers.  I
basically mangle the packets between 2 bridge boxes,
demangling packets on each side's 'intranet'.  No
firewall denial rules or nothing; just the pre/post
routing.  When I do not mangle (just pass in/out my
userspace), it works fine.  When I reconfigure in a
router mode (as opposed to bridge), my mangling works
fine.  In bridge mode, though, with mangling, by
traffic crawls to tens of bytes/second.  If I turn off
the mangling, it picks back up to happy 10mbit rates.
The payload, when finally delivered (in my testing, I
use a simple TCP push/receive pair of applications),
is valid, so it does  mangle/demangle OK.  

Does anyone have any ideas why this could be
happening?  
Any pointers, thoughts on the
netfilter/ebtables/whatever would help me greatly. 
Thanks!!!

-Scott



__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

