From: Martin Schaffner <schaffner@gmx.li>
Subject: [BUG] compile failure for linux-2.6.6
Date: Fri, 28 May 2004 21:05:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0DFFBB11-B0DA-11D8-8EBC-0003931E0B62@gmx.li>
Mime-Version: 1.0 (Apple Message framework v618)
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
To: netfilter@lists.netfilter.org

Currently, netfilter relies on the headers from a previous linux 
version being installed on the system.
If I try to compile netfilter from linux-2.6.6 with only the 2.6.6 
headers installed in /usr/include,
then net/ipv4/netfilter/ipt_ECN.c doesn't compile, because it uses 
struct ipt_ECN_info,
which isn't declared anywhere in the source tree of linux-2.6.6.
The same holds for IPT_ECN_OP_* macros.

--
Martin Schaffner


