From: Fabio De Paolis <fabiodepaolis@naxe.it>
Subject: NAT Port Forward problem in a not so simple network
Date: Tue, 27 Jan 2009 20:10:16 +0100
Message-ID: <497F5C18.8010703@naxe.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi to all,

I'm sure this thread is quite old,
but I would like to ask to this nice mailing list what is best way to
achieve a bandwidth limit with IpTables/NetFilter

I have several server with Debian Sarge stable
Linux 2.6.18-6-686 #1 SMP i686 GNU/Linux

And with IpTables v1.3.6

The bandwidth of the network is 10Mbit
I would like to limit the network traffic for each server to 250KByte/sec
This limit should be for upstram and dowstream

I searched around and have read a lot about:
shaper, wondershaper, tc, qdisc, etc.
And also about monitoring to see if it work:
ntop, sntop, iptraf, etc.

But I'm not sure what are pro and cons of each method.
I'm sure you can tell more!

Thanks in advance.


