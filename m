From: Tiago Alves <alvesfonseca@ibest.com.br>
Subject: Assigning multiple marks to a packet
Date: Wed, 31 Mar 2010 10:22:59 -0300
Message-ID: <u2xd99c4e221003310622h70e761au368f0361dee9c382@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

I was wondering about assigning multiple marks to a packet. I have an
iptables firewall that already mark some packets according to certain
patterns. However, I would like to assign another mark to the packet
without overwriting the previous marking.

Does iptables allow this kind of setup?

Thanks in advance,
Tiago
