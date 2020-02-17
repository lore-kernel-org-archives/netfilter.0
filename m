From: Mathew Heard <me@mheard.com>
Subject: Resetting SKB CT
Date: Mon, 17 Feb 2020 18:43:06 +1100
Message-ID: <CAE5sJtRXcVLQNFN01kABy8cz3pXXQ+aPB+tu6zkNWOak_A+kew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mheard-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=rHyYoEBCwTj72cvClTC/yjAW53s+u52mtUGNoxbXa64=;
        b=hDRN7jf45jO1eFUkRjnrCJUCtnOBQ67ing5X3TYMV+iBEKyQQVieEFQauc5n8hOSwq
         r2H0dJibW9pm6OEi1131nSh8rtBb/gS0rS8WdwI8Mj8gIAjJ9CSrIeaFghbOmN2EyCZC
         U4UnU+fNL4NFW+UyS9O9JGus30B3BIe3V5orY79NMDupOAB/cjRUMykYZm12ul1lAyzf
         qc86lcrceyQuQL57TTiw5gLza2bXnIZjvEDsa9yYX26Wj0JPZV+qHG+c6WZn9zwg+hQq
         EjZ72+ShONInwpSe6avvhhQqaPYjstCYWqxfecBw2CHl5tsEgIsd+LsmA6DZZ6Lskdem
         ZSFQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm developing a GPL module, normally kernel modules arent that hard
to debug. But this error has me stumped.

What the correct way to clear the CT from a SKB (i.e make it
UNTRACKED), and remove that CT from the conntrack DB.

I tried the following code:
/*
Reset any conntrack connection (removing from db)
*/
static void ts3ct_reset(struct sk_buff *skb){
    struct nf_conn *ct;
    enum ip_conntrack_info ctinfo;

    ct = nf_ct_get(skb, &ctinfo);
    if (ct && ctinfo != IP_CT_UNTRACKED){
        nf_ct_set(skb, NULL, IP_CT_UNTRACKED);
        nf_ct_kill(ct);
        nf_ct_put(ct);
    }
}


I can't see the issue, can you?
