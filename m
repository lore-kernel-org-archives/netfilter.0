From: doug arro <doug_arro@yahoo.com>
Subject: IP header mangling
Date: Thu, 23 Dec 2010 14:38:24 -0800 (PST)
Message-ID: <437954.32088.qm@web111108.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1293143904; bh=xPBeqvTy6/rDEawETqdHm70qk5nfrIMZxmEzlpK4vx8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=a8xwSK5evBBTABWt2ypSatHsUp+i/OxfKa9BYpq1KbrMsYe3jIIZv2w9jqloZ5XC1VD9nnx4JEFJMvRDCC0xJQ+J4nNEex5E09Nr0+pwwH9cy2N4qCZJdizes5aGHfQXJAk3ocDdAH4aNY1zHe32o97VZSNVdZOVy5XGTsO1rMM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am looking at writing a new xtables extension to add/drop IP Option headers for outgoing packets.  Is the mangle table and the prerouting chain the best places for this task?  Is there an existing module doing similar things that I can model after?  I noticed this so-called IPV4OPTSSTRIP patch.  Is there a similar kernel module that allows adding an Option header to the IP packet?

Thanks,
doug



      
