From: Leonardo Rodrigues <leolistas@solutti.com.br>
Subject: Re: Discriminate client requests from transparent proxy requests?
Date: Wed, 19 Dec 2012 17:05:45 -0200
Message-ID: <50D21009.50702@solutti.com.br>
References: <50D01F13.7030707@nottheoilrig.com> <50D0713D.4070800@solutti.com.br> <50D2088C.5060903@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=solutti.com.br; s=google;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=4lKV887H7rQNAC6opukeREqw6xoO2NvCkdXUnkCotfE=;
        b=t9W35NRAn4s0xqC1xosA9SphrvXGHwOGAgy+5O5Mtj+gzbEmzW9O95I/gwx0SIO/x0
         tZ9hC7cZ3siKYUuRLVDVuxrLGtm/SFDoYoDI7f56xHAwHafmri07vk9cvSXJhMs/c/KW
         lmqNTDVoViplf44VlGXnWvEkcHnP/fsctVZ40=
In-Reply-To: <50D2088C.5060903@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: netfilter@vger.kernel.org


     how about adjusting TOS values on the packets using those created=20
ACLs ?? That would probably make identification easier/possible on=20
routing layers, your routers included.

     you can specify a specific TOS value for your 'normal proxy' port=20
and another one for your 'transparent proxy'.

     but you're right, i didnt catch your idea and, maybe, my answer wa=
s=20
for a different scenario than yours. But i think that using the=20
transparent port ACL and adjusting TOS on those packets, you could catc=
h=20
that on your routers.



from http://www.squid-cache.org/Doc/config/tcp_outgoing_tos/

     Allows you to select a TOS/Diffserv value for packets outgoing
     on the server side, based on an ACL.

     tcp_outgoing_tos ds-field [!]aclname ...

     Example where normal_service_net uses the TOS value 0x00
     and good_service_net uses 0x20

     acl normal_service_net src 10.0.0.0/24
     acl good_service_net src 10.0.1.0/24
     tcp_outgoing_tos 0x00 normal_service_net
     tcp_outgoing_tos 0x20 good_service_net

     TOS/DSCP values really only have local significance - so you shoul=
d
     know what you're specifying. For more information, see RFC2474,
     RFC2475, and RFC3260.

     The TOS/DSCP byte must be exactly that - a octet value  0 - 255, o=
r
     "default" to use whatever default your host has. Note that in
     practice often only multiples of 4 is usable as the two rightmost =
bits
     have been redefined for use by ECN (RFC 3168 section 23.1).

     Processing proceeds in the order specified, and stops at first ful=
ly
     matching line.


Em 19/12/12 16:33, Jack Bates escreveu:
> Thank you, but what I want is for our *router* to be able to tell the=
=20
> difference between requests from clients to origin servers (and=20
> intercept these) and requests from our transparent proxy to origin=20
> servers (and not intercept these). I'm wondering what options there=20
> are to do this because our proxy makes "transparent" requests to=20
> origin servers, with the same source address as the request from the=20
> client.
>
> I think what you're describing instead is how the *proxy* can tell th=
e=20
> difference between requests that were intercepted and requests that=20
> were explicitly sent to the proxy.
>


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it



