From: James Lamanna <james@warp2biz.com>
Subject: Disable port translation in SNAT
Date: Thu, 24 Jul 2014 08:13:46 -0400
Message-ID: <2F6A61C9-C112-4C17-9BE7-9B6438B19893@warp2biz.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,
Is there a way to disable port translation during SNAT so that traffic
originates from the same external port as it did internally?
I realize that this might be able to be done with a separate SNAT rule for
each port, but I have a port range of 50 or so (RTP) so I'm wondering if
it's possible to do on a range basis.

Thanks.

--James
