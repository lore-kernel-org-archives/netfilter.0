From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 09:49:39 +0100
Message-ID: <200901300949.39955.christoph.paasch@gmail.com>
References: <4982B7F3.4020603@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:cc:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=mp1ZWg2N6XQLVrAGfX6X7X55YLfLyZGQWdE+Kuh2+/k=;
        b=ugSx/RdTBBORgpXclqRiX603fjsi3Y6grhihemjySVmeypoggwc47rw455JebhMQ26
         6XnB2M3k2DSz++mbCpKyMiAX5b+0iygNjYch0YlOX+rS05RQVLIB5DPXjp4evJdSq3aI
         yBv8NCiK4D+az+1d3o8dx8s+MgtVobJEm6WWw=
In-Reply-To: <4982B7F3.4020603@cetrtapot.si>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Cc: netfilter@vger.kernel.org

Hi,

On Fri January 30 2009, Hinko Kocevar wrote:
> Hi all,
>
> Is it possible to 'port forward' ICMP requests?
You can match the protocol on ICMP packets with -p icmp and let the port-
specific stuff out of it, as ICMP doesn't uses portnumbers. But the problem will 
be, that your external machine won't be reachable for icmp packets. (as every 
icmp packets will get forwarded) It may be ennoying if MTU or ping packets 
doesn't reach anymore your machine. That depends on the usage of your gateway.

>
> Thank you,
> HK

--
Christoph Paasch

www.rollerbulls.be
--
