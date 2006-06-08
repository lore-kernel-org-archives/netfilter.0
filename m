From: "Feng Xian" <alex.xian@gmail.com>
Subject: a question about netfilter/ipt matcher
Date: Thu, 8 Jun 2006 14:47:49 -0400
Message-ID: <e16b711f0606081147m6f53cbe8qf145bdd32bbd8375@mail.gmail.com>
References: <e16b711f0606081146t3d6f8893ld10096a5836236a1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e16b711f0606081146t3d6f8893ld10096a5836236a1@mail.gmail.com>
Content-Disposition: inline
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

I have a question about implement a ipt matcher in kernel space. upon
receiving a packet, i want to ship this packet to a hardware pattern
match accelerator to do some scan. when the scan result come back from
the accelerator(after a while) then I tell the ipt/netfilter if i got
a match or not. I am not sure if the current netfilter/ipt_match
infrastructure support this kind of non-blocking matcher or if  it
does suport, how can i do it in practical. Thanks in advance and
please CC me on reply since I am not subscribed to the list.

regards,

Alex

