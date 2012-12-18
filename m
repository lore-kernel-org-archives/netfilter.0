From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Tue, 18 Dec 2012 11:35:57 -0200
Message-ID: <50D0713D.4070800@solutti.com.br>
References: <50D01F13.7030707@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=cxsE8QwfzfM0+YAhpxmt3/c1P9+tKQenH841e7vN678=;
        b=iHR+qNJmohqftI8YHokU3j7M8z9Dy+ictGXUg0HLNVEUHk0qBO+fe9gA8Cxxzcj/sL
         MEvPS9vH9wSwkbtTqOrywNZg7xlkT/UOQWwE9HCDe2o6xWheWQ22Lq7yQ15bCs++xSbR
         PBRzNKcLA/eWR2BJrLnPv8j55gmls6ZstvM/U=
In-Reply-To: <50D01F13.7030707@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org


     How about configuring two ports, one for transparent proxy and=20
other for your 'normal' proxy? Doing that, you could create ACLs for=20
matching your normal and transparent ports

     Changing the port on your transparent proxy rule will be absolutel=
y=20
transparent to your users ...

http_port 12345 transparent
http_port 3128

acl transparent_access myport 12345
acl normal_access myport 3128


     i cant think on any easier way of discriminating normal and=20
transparent-intercepted traffic ...


Em 18/12/12 05:45, Jack Bates escreveu:
> Do you have any advice how to discriminate traffic from clients from=20
> traffic from our transparent proxy?
>
> Our proxy sends requests to origin servers with the same source=20
> address as the request from the client, so we can do per-host traffic=
=20
> shaping on our router. But consequently I wonder how to discriminate=20
> client requests from proxy requests, and route the former to the=20
> proxy, but not route the latter. What options are there?

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



