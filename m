From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: messages in /var/log/message file
Date: Wed, 09 Oct 2002 12:33:42 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA3D4CE.9050407@inbox.lv>
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
To: netfilter <netfilter@lists.netfilter.org>

hi all,
im using RH7.3 with kernel 2.4.19 and have migrated to iptables 1.2.7a.
earlier it was kernel 2.4.19 with iptables 1.2.6a..
everything went ok but since using the newer version of iptables am 
getting this messages in /var/log/message file...

Oct  9 12:25:24 ICG kernel: NET: 5 messages suppressed.
Oct  9 12:26:31 ICG kernel: NET: 1 messages suppressed.
Oct  9 12:26:31 ICG kernel: ip_conntrack: max number of expected 
connections 1 of ftp reached for <ipA> -> <ipB>, reusing
Oct  9 12:27:12 ICG kernel: ip_conntrack: max number of expected 
connections 1 of ftp reached for <ipA> -> <ipB>, reusing

these messages are piling the message file.
am cusrious now why so ?.. what does this message signify ?
earlier verion of iptables never gave any error & the only difference in 
compling new iptables(1.2.7a) is that this time its compiled for using 
module ip_nat_h323.o
Awaiting a reply very anxiously
A.H


