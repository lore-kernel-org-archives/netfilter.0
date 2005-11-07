From: "Ju, Yu" <Yu.Ju@marconi.com>
Subject: ipq_mangle_ipv4 inside ipq_set_verdict
Date: Mon, 7 Nov 2005 16:25:42 -0200
Message-ID: <5551AD75D2C0BC459A85A2CEFAE4F8005DD4EB@usvissfp01.win.marconi.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi,

Could some one tells me what does the following condition checking mean and
why it is there in the ipq_set_verdict? The code is form ip_queue.c of
kernel 2.6.11.

if (vmsg->data_len && vmsg->data_len == len)    /* what does this checking
mean and why it is needed? */
     if (ipq_mangle_ipv4(vmsg, entry) <  0)
            verdict = NF_DROP;

Thanks,
Yu

