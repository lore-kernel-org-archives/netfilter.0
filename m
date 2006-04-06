From: Mike Auty <mike.auty@gmail.com>
Subject: libnetfilter_queue conditions required to rewrite packets...
Date: Thu, 06 Apr 2006 04:25:27 +0100
Message-ID: <44348A27.60602@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
     I appologize if this is a bit of a daft question, but looking 
through all the documentation I've managed to locate it's never made 
explicit, and the list archives are rather difficult to use when looking 
for specific information.
     I'm trying to make use of the libnetfilter_queue module to 
intelligently mangle certain packets on their way through certain points 
in iptables.  I think I've got all the code working correctly, and I 
believe I'm modifying the packet and using a pointer to the modified 
packet in the nfq_set_verdict call with the new packet length, however 
from all the tests I've run, the original packet is continuing on, and 
the new payload seems to be ignored.  Are there special conditions under 
which packet modification will work, or should it work under all 
circumstances?
     I've read several things which might help narrow the problem.  In 
one example (for libipq as it turns out), they have a test so that 
rewriting only happens if the packet's come in from hook 0 (which is 
PREROUTING).  Does this mean that packet modification can only be done 
in certain chains (for example, PREROUTING and OUTPUT only)?  Must the 
NFQUEUE target be in the mangle table rather than the filter table to 
perform payload rewriting?  I've tried both and I still seem not to be 
sending out the modified data.  I'd also read somewhere that the kernel 
might silently ignore packets if their checksums had not been calculated 
correctly.  Does this mean invalid packets can't be sent using this 
method?  Would nfq_set_verdict fail if that were the case?  Finally if 
the packet contents can be modified no matter where the hook is, does 
anyone have any ideas how I could further debug the problem?  Last thing 
I know is I'm passing the right data to the nfq_set_verdict call and I'm 
getting back a positive response, but the data received always appears 
to be the original data sent.  Is there someway to track what's going on 
further inside the netlink?
     Any light anyone can shed on this would be greatly appreciated. 
Thanks very much...
     Mike  5:)

