From: "Ji Zhang" <jz105@ohm.york.ac.uk>
Subject: continuity of nat after nat rules deleted
Date: Tue, 13 Apr 2004 14:53:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b601c4215e$b4ca8470$68892090@grouse>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I just found an interesting issue and wish to have your confirmation:

My network setup is like the following:

PC1 and the Internet<---->PC2<---->PC3

PC2 is doing nat for PC3 and is transparant to PC3. I start transmitting a
large file using ftp from PC1 to PC3 via PC2. During the transmission, I
disable all the nat rules on PC2 (iptables -F & iptables -F -t nat), but PC2
goes on doing nat until finishing transmitting the whole file. Only after
that the connectivity between PC1 and PC3 breaks.

Could anyone tell me the reason for this phenomenon?

Cheers,
Jee


