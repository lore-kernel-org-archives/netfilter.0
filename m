From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: come back the traffic on same interface which it input
Date: Tue, 14 Jun 2011 23:31:43 -0300
Message-ID: <BANLkTimf7nTztsuo2ov1QuUN=ACKHsBsvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

hello everyone, I have two ISPs in my firewall that are ADSLs lines. I
wish that all trafic input in wan1 ( ISP1 ) come back on it. but this
isn't happening because the firewall gateway is ISP2 ( wan2 ) so all
input traffic by ISP1 ( wan1 ) doesn't work because the firewall
forwards all traffic as it as your gateway wich is ISP2

for exemplo, I have a http service on this firewall and when I attempt
 access it from Internet doesn't work because it's on my ISP1.

how I can do for all input traffic on wan1 come back on it and not on
wan2 wich is the firewall gateway ??

any tips are welcome
