From: Fabio Marcone <fabio.marcone@duet.it>
Subject: prio advanced parameter
Date: Thu, 28 May 2009 09:59:39 +0200
Message-ID: <4A1E446B.5020808@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I'm studying tc and PRIO qdisc (I know that you know it). I need to know 
if exists an advanced parameter (I didn't find anything in tc man pages) 
that configures the shaper to doesn't take packets from a queue if it 
doesn't contain at least X packets.
If exists it can be a kernel parameters rather than a tc one.

Thanks in advance,
Fabio
