From: Felix <credzba@gmail.com>
Subject: Packet performance impact of using netfilter
Date: Thu, 13 Dec 2012 09:23:17 -0600
Message-ID: <CAOZ=-EUJEWuXN7o3YZpwhq5EiooOzttB2+MAMiOxb=uYN1w0aw@mail.gmail.com>
Reply-To: credzba@gmail.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
        bh=qTXCheifpcDf8Glx/5oqe40qxTnS7BAJonecIzS1Sjg=;
        b=lWohXpga/9aXxvj0pkQYBsJnOTBixHSg2+kvoQa884lUS/11VMgIbJxDAnmto7NqBC
         bTA9sYzeNoQhy7gp78h/TmocmD+eOvA6WQxup0dwud3syBsrXA6ZArHWeB/bCF4cYD9W
         4wlbyOiVjnqppBzg+Z86z3qgRTX0a3V42TxH5tTEvHaf0YA8kc4QsddOAXw67Reat3Hy
         cbmb21FxqaXY3D96KJvNp/yR1J8VdmspzdrfAXMz6c5MX4jAxBdBNuS/2S6RGKQQG9TN
         mXmMk/e2hyPBjKuvlbhSK8fIHVI9t/gbUMUWNqBXjAeWvshcv/mpKsZeUp1ctERfbQbB
         gzKw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a load balancing implementation using neighbor discovery packet
control, and I used nfqueue to route the neighbor solicitation packets
to user space. In user space I make the decision of which real vip
should answer, and generate the appropriate neighbor advertisement.  I
then use the nfqueue disposition to drop the solicitation packet so
linux doesn't respond.

During my design review, a concern was raised as to the performance
impact using netfilter has on the non-selected packets.
By that, I mean the performance of answering the neighbor solicitation
is not a concern, but if the implementation of netfilter in the kernel
causes a performance problem for the other packets being processed on
that same nic and/or ip then it is a serious concern.

Does anyone have ideas on the performance impact of netfilter on
non-selected packets?

Thanks,
Credzba
