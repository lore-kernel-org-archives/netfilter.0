From: =?unknown-8bit?b?zfW6o8zO?=  <wanght@tsinghua.org.cn>
Subject: [HELP] what is the semantic meaning of find_appropriate_src()
Date: Mon, 01 Mar 2004 23:10:19 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Axp3o-0008Mo-CM@vishnu.netfilter.org>
Reply-To: =?unknown-8bit?b?zfW6o8zO?=  <wanght@tsinghua.org.cn>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have studied the netfilter/iptables code for serval months, but I can not
understand the
semantic meaning of function find_appropriate_src(), which is called by
get_unique_tuple().

I can not figure in what situation it can return TRUE and  I think even in the
situation it can return TRUE, it is still meaningless. I designed and tried some
DNAT/SNAT examples, but none of them can make find_appropriate_src() return TRUE.

So, I wonder what is the object of designing the find_appropriate_src()? 

Thx!




