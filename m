From: Bluesea Yreen <big_bluesea@yahoo.com>
Subject: Does netfilter disable TCP checksum offload?
Date: Mon, 20 Oct 2003 08:08:46 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031020150846.43255.qmail@web41706.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi There,

I am trying to use TCP checksum offload under Linux. I
found that if I install the netfilter, I cannot use
TCP checksum offload feature. Because "nf_hook_slow"
is called if there is any HOOK registered in the
output path, and "skb->ip_summed" is set to
"CHECKSUM_NONE" eventually.

Am I right about that I cannot use TCP checksum
offload feature if there is any HOOK registered in the
output path? If it's right, how can I use TCP checksum
offload feature while having the netfilter installed.
Can I do it but disabling some netfilter options?

Thanks,

Bluesea

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

