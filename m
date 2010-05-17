From: senthilkumaar2021 <senthilkumaar2021@gmail.com>
Subject: kernel panic
Date: Mon, 17 May 2010 14:25:00 +0530
Message-ID: <4BF10464.2020207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=/EsTzPEQjWDDpb7QbKqXieZAfQGkUHZBPY/G/bF1ObY=;
        b=cpHn1qs83Mp1KBHYX0GLY62+LkEpbVA02DN5rjcC1d9D3X/7y8RKcmKw2Oa0zXBlzk
         4UkDRCrI6Hj3hLWWf2Q0ACeymCaRA0cYM657MctaWqzgHnAXi+/+rKoKos+vP5ggpoQt
         jeXj2X58XVnWnY9/++AJLHGdIwrJWFBT6Ww90=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

HI


I am using iptables version 1.43 and getting the following error in 
machine while using squid in tproxy.we are using Linux machine as bridge too

i was able to capture part of the error only please help me in solving 
the issue


  [<ffffffffa03933c2>] ? nf_nat_fn+0x138/0x14e [iptable_nat]
  [<ffffffffa0393585>] ? nf_nat_in+0x2f/0x6e [iptable_nat]
  [<ffffffffa027edaa>] ? br_nf_pre_routing_finish+0x0/
0x2c4 [bridge]
  [<ffffffffa027edfa>] br_nf_pre_routing_finish+0x50/
0x2c4 [bridge]
  [<ffffffffa027edaa>] ? br_nf_pre_routing_finish+0x0/0x2c4 [bridge]
  [<ffffffff81339a50>] ? nf_hook_slow+0x68/0xc8
  [<ffffffffa027edaa>] ? br_nf_pre_routing_finish+0x0/0x2c4 [bridge]
  [<ffffffffa027f616>] br_nf_pre_routing+0x5a8/0x5c7 [bridge]
  [<ffffffff813399ab>] nf_iterate+0x48/0x85
  [<ffffffffa027a931>] ? br_handle_frame_finish+0x0/0x154 [bridge]
  [<ffffffff81339a50>] nf_hook_slow+0x68/0xc8
  [<ffffffffa027a931>] ? br_handle_frame_finish+0x0/0x154 [bridge]
  [<ffffffffa027ac36>] br_handle_frame+0x1b1/0x1db [bridge]
  [<ffffffff8131d54b>] netif_receive_skb+0x316/0x434
  [<ffffffff8131dbfb>] napi_gro_receive+0x6e/0x83
  [<ffffffffa0125bfe>] e1000_receive_skb+0x5c/0x65 [e1000e]
  [<ffffffffa0125de8>] e1000_clean_rx_irq+0x1e1/0x28f [e1000e]
  [<ffffffffa012730e>] e1000_clean+0x99/0x24a [e1000e]
  [<ffffffff813bcfc5>] ? _spin_unlock_irqrestore+0x2c/0x43
  [<ffffffff8131ba62>] net_rx_action+0xb8/0x1b4
  [<ffffffff8104ed43>] __do_softirq+0x99/0x152
  [<ffffffff8101284c>] call_softirq+0x1c/0x30
  [<ffffffff81013a02>] do_softirq+0x52/0xb9
  [<ffffffff8104e969>] irq_exit+0x53/0x8d
  [<ffffffff81013d1a>] do_IRQ+0x135/0x157
  [<ffffffff81011f93>] ret_from_intr+0x0/0x2e
  <EOI> [<ffffffff81017e20>] ? mwait_idle+0x9e/0xc7
  [<ffffffff81017e17>] ? mwait_idle+0x95/0xc7
  [<ffffffff813bfd20>] ? atomic_notifier_call_chain+0x13/0x15
  [<ffffffff810102f4>] ? enter_idle+0x27/0x2>

  Regards
senthil
