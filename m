From: Shawn Wilson <ag4ve.us@gmail.com>
Subject: Re: Getting iptables not to reply
Date: Mon, 30 Sep 2013 13:32:48 -0400
Message-ID: <3e46767e-0e68-4512-8d9c-2b8873d536fc@email.android.com>
References: <SNT147-W156511006C6569D034DE84BF140@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=user-agent:in-reply-to:references:mime-version:content-type
         :content-transfer-encoding:subject:from:date:to:message-id;
        bh=gVDSOgZvE53KIlv3q5WLc5ROuNdYKVUNsmbU6lylmNw=;
        b=lu5E9SPleeGlEIHUEoJYX0AJMYfJ3PhOZ9iQgOlKSt3+UdBOjPSNGFQxJlzcVYH+K0
         rQZNW3d47DnCFAog2eHy1crhMwJ/Ks7/46S/4mFMrRO5aLzgxavXC8SJz3acc3D/+Wrh
         zRgVd/VMciBWKvcJnf5a/X2poZC9bvP1hckaounJreHFSk0XEBqhaF3dhZCNIeb3W6XC
         OsUIUv71sKoc4Z0tffVUwY6wsRxQ6XFMhjijtkUltk6fOrjKZ+rHON2ShhLBMsK6IFqZ
         gDrayZ3phDGAE5G/40OHCka4Fuy0A2NxfRz4SymyNOJtrhNUQHrkMgxTMrIQyN38vI1R
         G1wA==
In-Reply-To: <SNT147-W156511006C6569D034DE84BF140@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jack seth <bird_112@hotmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Do you want to respond with ACK, FIN, or RST?=20

jack seth <bird_112@hotmail.com> wrote:
>Ok, if you have an 'accept' rule for a service that is not currently
>running, is it possible to have iptables to simply not respond instead
>of reporting the port as 'closed'?=C2=A0 During a port scan at grc.com=
, if
>the router doesn't reply the port will be reported as 'stealth'. 		 	 =
=20
>		  --
>To unsubscribe from this list: send the line "unsubscribe netfilter" i=
n
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html

