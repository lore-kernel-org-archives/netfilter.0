From: "Srinivas Murthy" <codevana@gmail.com>
Subject: kernel space check on user-defined chains
Date: Tue, 20 Nov 2007 11:39:22 -0800
Message-ID: <df1bdeb10711201139idc5189fu97bc5b1cb871354f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=j297T6z0CQwSAjXn/85mb39fnf29pRrPmCWVKsduNLA=;
        b=pajjRCywiNs6xDhNCkrMAon03UA5zo2AqyWTARxLO9AY4v9dNIuMQc8hifTsACu1MtTCXON1btVDFmydgxm5cmfDzZL4RmaGEo+Pxn4fyYinH137uGxnuG7nbyzik/pzjnEioRrfl/RvOTscNfVJSF5uSj8FeIYQPL7astG+hgs=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

 I need to check the policy (NF_ACCEPT, NF_DROP, etc.) for an skb from
the prerouting hook by running it through a dynamically created
user-defined chain.

 The ipt_do_table() routine takes a hooknum (one of the pre-defined
hooks) but doesnt allow me to specify a user-defined chain name.

 The key part of the problem here is that I need to do this in kernel
space (wo involving the user-space iptables program). For this, I
thought of setting a jump target to the user-defined chain from one of
the predefined chains and then running the skb through the predefined
chain but that doesnt work since setting the jump target (again
directly using the do_ipt_set_ctl, do_ipt_get_ctl, etc.) involves
using mutex locks and that doesnt work in the prerouting hook (in the
softirq context).

 Can you suggest a good way of doing this?

Thanks.
