From: "Nikolay S. Rybalov" <nowhere@hakkenden.ath.cx>
Subject: Re: torrent client traffic shaping question
Date: Wed, 11 Mar 2009 13:40:00 +0300
Message-ID: <613D287C978A4801B3C3F0C890C7E29B@compot>
References: <49B77ABF.4020406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Brent Clark <brentgclarklist@gmail.com>, netfilter@vger.kernel.org

If you read from socket at fixed rate, it's TCP receive buffer is emptied at 
same rate. TCP announces free buffer in receive window field, so congestion 
window on sender side is also adjusted, thus limiting send speed to the rate 
you read from socket on receiver side.

----- Original Message ----- 
From: "Brent Clark" <brentgclarklist@gmail.com>
To: <netfilter@vger.kernel.org>
Sent: Wednesday, March 11, 2009 11:47 AM
Subject: torrent client traffic shaping question


> Hiya
>
> I got this question to ask, and I was hoping the TCP/IP gurus would be 
> able to help me understand this.
>
> K you know how with traffic shapping you can control only the traffic 
> leaving you, how it is that torrent clients say they can control the 
> download as well as the upload. I would think the client can only control 
> the upload.
>
> TIA
>
> Brent Clark
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

