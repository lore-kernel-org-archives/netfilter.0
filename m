From: Curby <curby@cur.by>
Subject: chain/table traversal for loopback packets
Date: Thu, 13 May 2010 12:19:33 -0600
Message-ID: <AANLkTikgvzyLOesxU5RNb3MmEPPMsnotOj-oZcWGlkuT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I'm trying to understand
http://www.frozentux.net/iptables-tutorial/images/tables_traverse.jpg

Would a packet created locally and sent over the loopback interface
traverse the POSTROUTING and PREROUTING hooks as implied by the
diagram, or does the last Routing Decision notice that it's bound for
the local host and send it straight to the beginning of the INPUT
hook?  Thanks!

--Mike
