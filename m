From: a.ranu@ugrad.unimelb.edu.au
Subject: keeping track of ack no
Date: Wed, 24 Sep 2003 01:17:16 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309231517.h8NFHGsx029764@cassius.its.unimelb.edu.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

hi,

i am writing a module that clamps the tcp receiver window size... 
i need to be able to tell when slow start ends, but at the receiver... so 
i need to be able to keep track of when 3 duplicate acknowledgements 
are sent out by the receiver...

what info in the kernel do i access to do this...
skb->h.th->ack???

i need to know asap and any help will be greatly appreciated...
thanks

Asmeet.

-- 
a.ranu@ugrad.unimelb.edu.au

