From: "=?utf-8?q?K=C4=81rlis_Repsons?=" <karlis.repsons@gmail.com>
Subject: How to reset routing completely?
Date: Tue, 3 Feb 2009 19:43:58 +0000
Message-ID: <200902031943.58617.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=+KGuA4daF3lfhLxhGtmLIyLNXlpVeKfS2VHX64sKskA=;
        b=oOlvQEaGcu9Ca00pXKN3m0eKISS8obm7Ji6GDP2BRsbm1D0/9eSgJ01gXrXnCN9J3R
         ZZUzQRU6Daqc4ejqv+UtI5SpbkGZc7yZCGtKX/CI+hVbF9ZMR5ey/3jR7+8gzmeJ/EPz
         TlIGm3QopoavVaAIzK4tAYLmAMmvIriU626Sc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@vger.kernel.org>

While experimenting, I managed to reach a state, where I could not make my 
network functional again, even if I deleted all rules and routes with ip and 
did reset firewall.
