From: Alessandro Rizzati <alessandrorizzati@yahoo.it>
Subject: alter packet length
Date: Tue, 16 Feb 2010 09:16:03 +0000 (GMT)
Message-ID: <129802.80232.qm@web25706.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.it; s=s1024; t=1266311763; bh=XCBNFBxu0mPjVHvZItpgSkj/RRzK1LlY5ML6sSxxsQ0=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=ygIJZF5W7HKzKD4m9HMMBE/HHxowa7qImWp2PuKnnUNSy5r4R+HUkl9pf9Ycofl4SAGaWtWIPr+Jl8DKW1+XBlCQUpmsNjAe0adDL3lBn6GrdcUkkB2WKc0Mrv2guf84UTHHazTWMSUkJ/4pd7bWTXaM8AOPXZZFW0zvQ/cVCuc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone!!
I am using ip_queue (I know, it is deprecated...) and I want to modify the payload of the packet I get with ipq_get_packet().
My question is: how can I modify the length of the payload (altering ipq_packet_msg_t structure)? The use of realloc() end up at runtime with a
"glibc detected....  realloc() invalid pointer..." when I execute my program...
Any hint?
The environment is ubuntu karmic 64 bit + gcc.

Thanks in advance!!
Alessandro


      

