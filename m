From: Julien Vehent <julien@linuxwall.info>
Subject: SpamHaus DROP list in Netfilter
Date: Tue, 16 Dec 2008 15:27:52 +0100
Message-ID: <57c616a9d26d450a7cda0fa3d52a191d@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

I was wondering how I could integrate the spamhaus drop list
(http://www.spamhaus.org/drop/drop.lasso) into my Netfilter rules.

The list is not too long, so I thought putting it directly into a new chain
would be doable without degrading too much the performances. Somebody also
told me to use a chains tree, but I wonder if this is necessary considering
the size of the list...

Has anybody done this before ?

Thanks,
Julien

-- 
www.linuxwall.info
