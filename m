From: Daniel Ivanov <sertys@supportivo.org>
Subject: I'm facing a simple 2-way decision.
Date: Wed, 14 Dec 2005 06:59:27 +0200
Message-ID: <439FA6AF.3060902@supportivo.org>
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

My choice is between ipt_CLASSIFY and ipt_MARK . I've modified both in a 
way, so they return NF_ACCEPT as a verdict, when a special knob is 
placed and am "identifying" my client connections and thus getting them 
into the right class.

However, i thought CLASSIFY would be way too faster than MARK, because i 
don't have e filter in tc thus. But that just ain't the case.
Is ipt_CLASSIFY slower than ipt_MARK in terms of getting the packets 
into the right queue class?

