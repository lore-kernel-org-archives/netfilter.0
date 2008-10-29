From: Pierre LEBRECH <pierre.lebrech@laposte.net>
Subject: libpcap (tcpdump) and netfilter (iptables)
Date: Wed, 29 Oct 2008 14:20:36 +0100
Message-ID: <49086324.9060900@laposte.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

It seems that even if I drop some INPUT packets with iptables, tcpdump
still sees these packets arriving on the ethernet interface.

Could anybody explain me a bit about this?

Thanks
