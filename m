From: Andrey <andrey@cs.dal.ca>
Subject: iptables in promiscuous mode
Date: Tue, 5 Jul 2011 13:05:10 -0300
Message-ID: <CAPR6_RB_BnxGoozDoQzyNS+Un3pERyYjpxgFHe1orMhMfj7DqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have traffic that was captured in promiscuous mode, therefore it is
not destined to my computer.
From what I understand netfilter/iptables does not work in promiscuous
mode therefore it will not see the traffic when I replay it.
My question is can I make iptables work in promiscuous mode, if I can then how?

Regards,
Andrey
