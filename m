From: "Giacomo" <delleceste@gmail.com>
Subject: detect tcp fragmented packets
Date: Fri, 9 Sep 2005 14:00:13 +0200
Message-ID: <005601c5b536$0b87fc90$0300a8c0@giacomino>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Good morning.

does iptables' option  "-f" reveal ip fragments or also tcp fragments?

My network does not work very well and i would like to discover if it is due
to
fragmentation in tcp header.

How can i detect tcp fragmented arriving packets to my machine?

If the problem was this, how could i find an example in linux kernel where
reassembling of fragments takes place?

Thanks a lot!
Giacomo 


