From: Ralf <rm@amitrader.com>
Subject: Forwarding a TCP connection request
Date: Sun, 08 Feb 2009 11:58:38 +0100
Message-ID: <gmmdsv$rgq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is this possible to do:
a TCP connection request to a specific port
on this machine comes in. Can this request
be forwarded to another machine to handle it directly
with the client (ie. accepting the session and so on),
but without this machine doing NAT for them
(except forwarding the initial SYN packet)?



