From: "raman mittal" <rmittal_02@iiita.ac.in>
Subject: Problems regarding IPtables
Date: Thu, 8 Apr 2004 22:23:55 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41159.172.31.1.1.1081443235.squirrel@mail.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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


I am student graduating in Indian Institute of Technology, India.
I have a small  problem regarding IP tables.

"DOes the kernel recalculates the checksum field in the packet after SNAT
or DNAT.
If yes , does the kernel calculates the checksum right from the scratch or
does it just change the checksum due to SNAT or DNAT."

"I am changing the answer section of a dns reply packet captured at the
firewall( this updated reply is to be forwarded through SNAT), will the
kernel recompute the new valid checksum for both IP and UDP headers or
not."

"If no what should i do to correct the checksum because the packet gets
dropped at the client side. "

"Can UDP checksum be disabled at the client side by zeroing the checksum
field in UDP header."

Thanking You

regards
raman mittal
Indian Institute of Information Technology




