From: nowhere <nowhere@hakkenden.ath.cx>
Subject: Timestamping in nfqueue
Date: Fri, 13 May 2011 18:32:36 +0400
Message-ID: <1305297156.9902.41.camel@compot-mob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

What is the purpose of nfq_get_timestamp() in libnfnetlink_queue if
skbs, entering nfnetlink_queue, are not timestamped?

