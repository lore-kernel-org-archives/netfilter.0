From: "Jee J.Z." <jz105@york.ac.uk>
Subject: about ipq_set_verdict()
Date: Thu, 15 Apr 2004 01:17:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <036e01c4227f$1611e900$68892090@grouse>
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

I am using the libipq library to do userspace programming on netfilter. I am
having some problems understanding the return values of the function
ipq_set_verdict():

When I set verdict (either NF_ACCEPT or NF_DROP) without modifying the
packet, the return value of ipq_set_verdict is 28 and everything works well;
however, when I set verdict trying to modify the packet, ipq_set_verdict
returns 88, and the packet seems always to be dropped even when I set
NF_ACCEPT.

Does anybody know what these return values mean? Moreover, could anybody
tell me how I can successfully modify a packet using libipq? Thank you very
much in advance!!

Regards,
Jee


