From: Nicole <nicole@cats-muvva.net>
Subject: Connection Tracking
Date: Mon, 03 Sep 2012 17:35:56 +0100
Message-ID: <5044DC6C.1070806@cats-muvva.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone,

I would be grateful for some advice. Am writing a target using xtables.
This target saves and restores a field in the IPv{4,6} header to/from
the connection mark.

I have read Jan Engelhardt's booklet (3 July 2012), but remain unclear
on how to ensure that connection tracking is turned on.

My difficulty arises in the following code snippet:

        const struct nf_conn *ct;
        ct = nf_ct_get(skb, &ctinfo);
        if (ct == NULL) {
                return false;
        }
	/* use ct-> */

ct is always false and therefore I cannot do the save and restore.

Any suggestions?

Many thanks

Nicole
