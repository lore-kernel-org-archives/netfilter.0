From: aksingh@hss.hns.com
Subject: Re: ipq_read and NF_ACCEPT
Date: Tue, 1 Jun 2004 21:06:12 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF4EF850DA.FCF7B184-ON65256EA6.0055AF77@hss.hns.com>
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
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org





Hi Jee

 As far as I understand, they will "NOT" hit NF_IP_LOCAL_IN, i.e any packet
coming from the local host, even if its ipddrr==that of the machine, hits
NF_IP_LOCAL_OUT, then NF_IP_POST_ROUTING and then goes out, so when it gets
caught back again by NF_IP_PRE_ROUTING and then NF_IP_LOCAL_IN its
altogether a new skb ... thats the way it happens as far as i know.
Someone pls correct me if i am wrong.

regards
Amit


