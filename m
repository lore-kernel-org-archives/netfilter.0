From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Transparent proxy requirement
Date: Sun, 21 Dec 2014 11:47:08 +0100
Message-ID: <m768fd$cqt$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi everybody,

I've this scenario:
  internet <--> proxypgm <--> serverpgm

whith these requirements:
  1) only ipv4 is used
  2) protocol is tcp
  3) proxypgm and serverpgm are one the same host (linux with recent kernel)
  4) serverpgm is reachable only thru the proxypgm
  5) serverpgm needs to know the originating ip:port of the client
  6) serverpgm cannot be modified (it does not know of TPROXY or 
IP_TRANSPARENT socket option etc.)
  7) proxypgm needs to be developed (in C/C++)

And now the question:
  Can TPROXY be used for this?

Are there other alternatives? What about doing this with raw sockets?

Thx

