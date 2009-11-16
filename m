From: Karl Hiramoto <karl@hiramoto.org>
Subject: connmark expire after X bytes
Date: Mon, 16 Nov 2009 11:59:47 +0100
Message-ID: <4B0130A3.4080505@hiramoto.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Is there anyway to connmark a connection for X amount of bytes of TCP 
payload, then remove the mark bits?  Perhaps some kind of byte counter 
that counts down, and when it is <=0   It's removed.

Is this in the patches welcome category?


Thanks.

karl.
