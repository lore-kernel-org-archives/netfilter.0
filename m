From: Jaco Kroon <jaco@uls.co.za>
Subject: nlif_index2name bug?
Date: Sat, 17 Nov 2007 14:53:51 +0200
Message-ID: <473EE45F.8040008@uls.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys,

I've seen an error in nlif_index2name, specifically, if an interface
comes up _after_ I've opened the nlif_handle (using nlif_open()) then it
won't resolve the index of that device to a name.

Is this a known issue, a bug or simply me not understanding how nlif
works?  Currently I need to kill and restart my application in order to
make it work again, which is obviously non-ideal.

Jaco

