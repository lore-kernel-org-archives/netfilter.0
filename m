From: "Jee J.Z." <jz105@york.ac.uk>
Subject: NF_DROP and NF_STOLEN
Date: Mon, 19 Apr 2004 19:09:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f401c42639$72dd3eb0$68892090@grouse>
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

Could anybody let me know what actual difference the targets NF_DROP and
NF_STOLEN make to the kernel? As far as I know, both of them tell the kernel
to forget the packet. In "Linux netfilter Hacking HOWTO", it says NF_DROP
tells netfilter to drop the packet, and NF_STOLEN tells netfilter that the
registered module has taken over the packet. I don't fully understand what
the module can do to the packet by taking over it and how.

Can anyone be kind enough to explain this or show me an example that a
module takes over packets and does something to them?

Thanks a lot in advance!

Regards,
Jee


