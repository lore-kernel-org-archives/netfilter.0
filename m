From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Packet manipulation in user space
Date: Thu, 08 Apr 2010 22:52:10 +0200
Message-ID: <cf60659524ea8ac90afc3024108635b6@localhost>
References: <h2hb3f13ff81004081148n221e9728mb5a14944cf4ffd06@mail.gmail.com> <h2ub3f13ff81004081154tbf514844hdfb703cf81f857d2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=lnw-dkim;
	 bh=epSjVRLtIh3LuFqb9EcODxE2ptPdAGQ/wmY7NFW0+Fc=; b=rENx1swApQVj
	4IP2Ukbnl8WWa82T7jKk1TD19TW7bVSE0DvaYqYPd4sJA2zdQAsjotjDp6xfPMtr
	gQfo0yn+HSx50xgROxV9b02jpd0zWy39niWKMR/6cejPhgzeuAfUpKeNCvBMDvAb
	003NYk8X+/j3aMjp8yECwba2MgCDbhY=
In-Reply-To: <h2ub3f13ff81004081154tbf514844hdfb703cf81f857d2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hamid Nassiby <h.nassiby@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Thu, 8 Apr 2010 23:24:09 +0430, Hamid Nassiby <h.nassiby@gmail.com>
wrote:
> Capture each packet which is coming inside or going outside the
> computer in Data-link Layer.
> Create a copy of the packet and drop the original one.
> Copy of packet must be available in user space to be manipulated by
> our protocol.
> After manipulation in user space, inject encrypted/decrypted version
> of the privileged (copy of) packets to the network or upward to the
> application layer.
> 

libnetfilter_queue ?

http://www.netfilter.org/projects/libnetfilter_queue/index.html
