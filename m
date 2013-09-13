From: Alexis Salinas <alexis.salinas@inmotiontechnology.com>
Subject: clarification on the use of --state parameter within  conntrack
 command
Date: Fri, 13 Sep 2013 17:00:17 +0000
Message-ID: <FC9EDC96CA021943AB23AE4C96151F620DC4D5@van-mail14-n4.exchange.electric.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi All,
Could someone help me understand the correct use of the protocol filter parameter "--state". I figure it would be something like this " conntrack -L -p TCP --state ESTABLISHED" but 2 different versions of conntrack-tools give the same error (conntrack v1.2.1 (conntrack-tools): unknown option `--state'
Try `conntrack -h' or 'conntrack --help' for more information.)

Is ts a deprecated parameter? What I'm trying to do is to selectively delete entries that are in a particular state. For instance TCP SYN_SENT, or UDP UNREPLIED.

Thanks,
Alexis.


