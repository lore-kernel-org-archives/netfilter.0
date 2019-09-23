From: John Mok <a9121431@gmail.com>
Subject: How is nftables + IFB
Date: Mon, 23 Sep 2019 19:08:52 +0800
Message-ID: <CALYzA8GZY1cJYsibQDOmA3DuUsV3d=KUdc6z04WgUxu-4Ya0jg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Tzsm2EIh1ygUKtH6UQgOWSp2o2tu0ZAj9Yu6gyq/MN8=;
        b=IRKs/W9TPlwtInofFp1vK76Paz0H5FTAV75B5LNnbIUiwgKVHgWykYhfPwN6ai2CrP
         Zeqj/THvfUaThkGKH7D+Ei0Ga91UwDHmAC1LY9+C4I/RzcmAeDAP286anmFS2iTb8B4b
         ggrn8oRlc0c97ZGqPIEl65X9rLQPGNT7dgiWI9HbqYy1VYdRWPwPhUVmGrJm/FAAE1B2
         ioSTFHP34M3W+ZD3Pm/Xy8+DftWx46aRdujlot2jPUTYqVLa1WwegKGZp9K2aioafs8W
         Q9NkKhkI1w1TWS/hebP7F9sWABTTB0rVukkUR2o+MfyRJCDo9AWf2O6CU8tcjAjG0FUr
         JLbw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I have been using iptales + IFB (Intermediate Functional Block) for
traffic shaping, How is the status of nftables + IFB (or its
successor) ?

Thanks a lot.

John Mok
