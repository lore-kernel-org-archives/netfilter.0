From: "mark smith" <markcs@wildmail.com>
Subject: problems using FTOS extension
Date: Thu, 5 Feb 2004 11:42:43 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <598558C21D078804AB348529E476E840@markcs.wildmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I need to use the FTOS target. Took me quite a
while to figure out how to get it 'available' for
use. (I added 'FTOS' to the PF_EXT_SLI field of
the Makefile in the extensions directory of the
1.2.9 distro and that seems to have done the
trick. After running make and make install the
libipt_FTOS.so file gets copied into
/usr/local/lib/iptables).

I'm having trouble using the correct syntax for a
rule though. This rule,using TOS, works fine:
iptables -I OUTPUT -t mangle -j TOS --set-tos 0x02

Trying the same thing with FTOS:
iptables -I OUTPUT -t mangle -j FTOS --set-ftos 0x02
Produces the error message:
iptables: No chain/target/match by that name

Looks weird. Interestingly, if I don't provide
the --set-ftos argument I get a logical error
message:
iptables v1.2.9: FTOS target: Parameter
--set-ftos is required
So it looks like FTOS can be used but I'm doing
something wrong with the --set-ftos argument.

I'm running a 2.4.20-8 kernel on RH9.

Thanks,

Mark.


&#8216;The ideals which have lighted my way, 
and time after time given me new 
courage 
to face life cheerfully, have 
been kindness, beauty, and truth. The 
trite subjects of life &#8211; possessions, 
outward success, luxury &#8211; have always 
seemed contemptible.&#8217; 

Albert Einstein
------------------

Protect your right to breathe clean, smoke-free air:
http://www.care2.com/go/z/11238/1043

