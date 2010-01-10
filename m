From: vishesh <linuxtovishesh@gmail.com>
Subject: Re: sequence numbers in conntrack
Date: Sun, 10 Jan 2010 09:40:54 +0530
Message-ID: <1263096654.2614.1.camel@vishesh-laptop>
References: <4B48F146.4040303@iit.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=h0s1ld/+ks6q9af3WLbBJ1aIJ983EoydPS16SBHdlQc=;
        b=XwJHEUnsqB7lbXOAzprP5UClGY9cvCDh/HQYCGEjnfAXC1AvIBZ3Ux4wWtQqoO0nfg
         9Zd0f6AwsR89SaxJ/P+e43LJnneBwh+3/qoNEgEICC/g1mK6i7AH+mFBs8zmf5Y0dKBU
         djOgsXUuSdAw5EroER8Q+CPSmHFhZYBU98d+A=
In-Reply-To: <4B48F146.4040303@iit.bme.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nemeth Denes <nemeth.denes@iit.bme.hu>
Cc: netfilter@vger.kernel.org

On Sat, 2010-01-09 at 22:12 +0100, Nemeth Denes wrote:
> Hello,
> 
> Could someone help me to explain what does the conntack module do
> in TCP connection negotiation in the following three cases: (host N is
> behind the NAT and host P is on the other side of the NAT)
> 
> A:
> P sends a SYN to H and H replies with an SYN-ACK with an invalid
> sequence number (If this passes normally through is it possible to
> filter it out?)
> 
> B:
> P sends a SYN to H and H replies with non SYN-ACK (3-way-handshake)
> or SYN (TCP simultaneous open) package
> 
> C: If the "--random" option is given to the postrouting chain, what happens
> if the clients use up all the ports?
> 
> Many thanks,
> Denes Nemeth
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
Dear denes
 Do you mean N host where host H is mentioned ?
thnks

