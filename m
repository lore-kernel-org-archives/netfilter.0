From: Xiong Wu <xiong.wu1981@gmail.com>
Subject: Re: Connection tracking counters increasing
Date: Fri, 08 Mar 2013 17:08:51 +0800
Message-ID: <1362733731.16176.6.camel@xwu-ThinkPad-T420>
References: <5138BC91.9060903@amfes.com>
	 <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr>
	 <assp.0778ebbb31.5138C95B.1080405@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:subject:from:to:cc:in-reply-to:references:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=lDhwOeqpbfM3oZ+N3QOEkwuM5rhEPX59C/osuuGJz/E=;
        b=dyAViEDhr/uO7jTJd6Ac342fzgcZ7e8csailZZywbF5H0sS6JSuvCyKJRdYA8X1QIM
         9wllHP73CMVNxBFVySZKGS9A/3HMV3/LNHMdbqPV9IcveoHjpSHVWeEpXxJk4p2kDLLa
         y35dep5hV6er92Ienr873PWvbJ+F3siJPrVjb9U6A8e/CoGbMhhJBWuKWg/nSzutoJKU
         R7WQYdlNYWzzEME4meOdaiYDMOXA2oUU/qpvun/rJZqXhDgOTkLh577PBbodtqbLBC+j
         amoYx9QYUKbJW0hwcruc20KrPJVeJBaXuHdn5pnBv+5AjRHoZh6LlkMEUvUaq4kOVmvM
         JVaQ==
In-Reply-To: <assp.0778ebbb31.5138C95B.1080405@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Netfilter-Users <netfilter@vger.kernel.org>

Hi Daniel,

Do you try to turn off nf_conntrack_tcp_loose as below:

echo 0 > /proc/sys/net/netfilter/nf_conntrack_tcp_loose


Thanks,
Xiong


On Thu, 2013-03-07 at 09:07 -0800, Daniel L. Miller wrote:
> On 3/7/2013 8:29 AM, Jan Engelhardt wrote:
> > On Thursday 2013-03-07 17:13, Daniel L. Miller wrote:
> >
> >> I've noticed that my connection tracking counters keep increasing -
> > Which counters?
> >
> /proc/sys/net/netfilter/nf_conntrack_count
> 
> and when it reaches /proc/sys/net/netfilter/nf_conntrack_max things break.
> 


