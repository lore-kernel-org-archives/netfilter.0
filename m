From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: ipt_netflow
Date: Wed, 20 Jun 2012 10:59:25 -0300
Message-ID: <CAMTjHryR_fh4AfC9eKmgj+s6x5xxHjSsgNGMEJ1rXY7CzBAgBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello people, I think my issue doesn't has many mach with this
maillist but maybe anyone can help me.....so go ahead.

I have installed ipt_netflow module on my firewall Red Hat 5.6 to
control package flow forward it. sometimes appear many error messages
as follow


Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 181 pkt, 92107 bytes
Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 249 pkt, 148217 bytes
Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 225 pkt, 311729 bytes
Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 89 pkt, 24367 bytes
Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 248 pkt, 299891 bytes
Jun 19 15:22:46 fw4 kernel: netflow_send_pdu[0]: sendmsg error -1:
data loss 252 pkt, 48311 bytes

I wonder what are this messages ? there is any problem with my
ipt_netflow module ?

any tip is welcome.
