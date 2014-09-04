From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: How to stop kernel TCP responses on a port
Date: Thu, 04 Sep 2014 13:16:41 -0300
Message-ID: <54089069.8010603@solutti.com.br>
References: <1409843867.3026.9.camel@l3>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=4yOTZ7DG6RI6VJlWIBHOOMSgUlHcn+W9WQIA3Q6bc74=;
        b=QRtP8Dx70HEFNFD8G2IimY2PmK+zS0wfNvGTJIV+ybOcHQRrd0nzY2NNIBHOlT3brt
         0nN0uW83sF+MFXTVOi4F4B5eiGn9uipHOhLHW9M3y4KuBajg9Ii/N9r1g9tpBV3NKHF4
         GxjDYN4jmJBfEokxtu5/ZW4Y5UMjnpjFJC+8w=
In-Reply-To: <1409843867.3026.9.camel@l3>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@vger.kernel.org


     you'll probably need to tweak the kernel itself for that. If you=20
wanna do all the 'dirty work', why not use UDP instead of TCP ??



On 04/09/14 12:17, Dale Mellor wrote:
>    I want to do TCP with raw sockets.  How can I filter away the kern=
el's
> RST/ACK/SYN response messages when I want to do this myself?
>


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



