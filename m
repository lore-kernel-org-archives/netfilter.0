From: J Webster <jw.jwebster@gmail.com>
Subject: using iptables to speed limit connections
Date: Wed, 26 Oct 2011 12:28:54 +0100
Message-ID: <4EA7EEF6.4000808@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=jSAZTexJW726L1Sz4LUW2C3Q08JQF9X+jYLsbJVZo+o=;
        b=b94nkBrKEIceHQbjSza0/NLF+k/yU/PsA2N5mcCZp9oI+M7HkhdnDvjEl7GFYj5uDi
         xDtVrjqPI4a2NMFqr0bUP1+a3S7OuJ1UVwcyxcr5R5q+lKootAlySsaHikymUnPTYvrw
         50zHeAvK+20pn5ERQXcBc55dEzZVZBcz/niks=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Is there any easy way to speed limit connections on a VPN to 2 Mbps?
My server is 100Mbps but I have connections on a VPN of 10.8.0.0. so 
need to limit the outbound connection from 10.8.0.0 to 2 Mbps.
I tried reading the stuff on leaf but the tutorial doesn't seem very 
straightforward and there is not much information on this on the net.
