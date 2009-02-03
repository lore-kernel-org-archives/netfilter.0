From: "=?utf-8?q?K=C4=81rlis_Repsons?=" <karlis.repsons@gmail.com>
Subject: Forward packets from one interface to another?
Date: Tue, 3 Feb 2009 17:53:59 +0000
Message-ID: <200902031753.59283.Karlis.Repsons@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :content-disposition:message-id;
        bh=6wlqUI7qYhVzEKsDPDeIIzkj1dqnBESSmE/dq4KXsM8=;
        b=mADXWdLi3lgJqihMrHNBJIGu6lEs4cb/QesaFTcfzpqYQPI8A56mWHdtpU1CTBPyha
         cbYUW/tGvLHX+rQ3KTL9vkFyzk2cmDPSD+l+6YNeT8px2xY036aKtf/LiG16kUoNGa3e
         Rt/sXni8EOX/JFnUh90iQO/jYhwnBjJChzlkQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hello,
maybe someone here can help with this problem: I have two NIC ports (for RJ45 
I mean) on my PC (pH) and it is necessary to attach another PC (pB) to the 
spare port similarly to like it was attached to switch. pB has static IPv4 
just like pH.
But. I want to do it with routing and iptables! Please, please, I have always 
failed using two interfaces, I would appreciate an example of how can I 
change it!
