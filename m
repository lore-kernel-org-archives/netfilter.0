From: "Kevin G. Currie" <kevin.currie@wmich.edu>
Subject: want:  logical OR for the MARK target
Date: 27 Oct 2003 11:53:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067273626.955.13.camel@localhost.localdomain>
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

Hello,

I have a need to mark packets with several different flags for later
processing in my iptables rules.  Some of these flags could be used in
combination.

I'm looking into implementing a logical OR for the "-j MARK --set-mark"
target such that the value given to --set-mark would be logically OR'd
with the current mark value of the packet.

I've looked around in the iptables source code a bit, but an (at this
point) hopelessly confused.  Could someone tell me if this is a
modification that needs to be made in iptables, the kernel modules, or
both?


Kevin


-- 
phew, for a minute there i lost myself.



