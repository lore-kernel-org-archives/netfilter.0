From: "Steele, David S." <daves@xetron.com>
Subject: MARK'ing packets in user space?
Date: Mon, 21 Apr 2003 14:51:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <69B1CAEF4FC66F4D9A07B903E0265D3F01A61D@s3cin>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I need to be able to shape traffic based on internal TCP information, such
as Mime type or session length. This leads me to believe that I wish to MARK
packets in a user space program using the queue mechanism. 

Google pointed me to an old howto that showed how this could be done with
the obsolete(?) queue device construct. However, the current source code
looks like carrying the modified mark back to the kernel is not supported in
the API.

Is there some way that I can mark(/shape) packets in an environment that
supports regular expressions? Why was this removed from the current API? Any
plans to put it back?

