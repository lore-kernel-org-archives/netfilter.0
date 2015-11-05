From: Bernhard Thaler <bernhard.thaler@wvnet.at>
Subject: OpenDPI and Netfilter
Date: Thu, 5 Nov 2015 19:09:39 +0100
Message-ID: <563B9B63.4060303@wvnet.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: 1734097.89bsIlettF@nb003
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

have a look at this:

-> https://github.com/betolj/ndpi-netfilter

It seems to be one of the most recent / active netfilter-ndpi
implementations and as far as I see does not require patching of the
Kernel for using it...at least in my tests it worked without patching
the Kernel on a Debian Jessie box if I remember correctly.

Also have a look at this one:

-> https://github.com/vel21ripn/nDPI

It seems to be recent/active as well but unfortunately I did not have
time to test it yet.

Regards,
Bernhard
