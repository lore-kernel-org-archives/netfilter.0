From: Payam Chychi <pchychi@gmail.com>
Subject: Re: best approach for blocklist
Date: Fri, 5 Mar 2010 09:11:42 -0800
Message-ID: <f08c15d11003050911r206f5e4by567776596948b108@mail.gmail.com>
References: <4B912EA0.1060604@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=C9LyszhbF2EIdUpG6VnQEMXNkSWLjUk9jZ/4rHPJYkU=;
        b=wDJnBSZsINxgvi7LT9eHAJM19sPKvK3MxjFg/o2q7FMRAwK5pTgfDsi2JVYsOVR+Qx
         CYc2EU2N2ZKI1MeC4BBdyTBe5UqOh/Bbq7HsckSgTjVrvOW6N4rWHbNd17RMX7dd41X1
         XEyr1tQqKDk1cpYWWgs9sddLDsHtjZ2akwSGs=
In-Reply-To: <4B912EA0.1060604@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Dennis J." <dennisml@conversis.de>
Cc: netfilter@vger.kernel.org

anytime where you can use chains to jump from and not have to go
through a massive list its a good thing... id take the later option


--=20
Payam Tarverdyan Chychi
Network Security Specialist / Network Engineer

On Fri, Mar 5, 2010 at 8:17 AM, Dennis J. <dennisml@conversis.de> wrote=
:
> Hi,
> I'm wondering what the most efficient way to implement a blocklist is=
=2E We
> are basically talking about blocking a few thousand IPs. Does iptable=
s do
> some internal optimizations when blocking based on a source address o=
r would
> it be better to, say, create a chain for each class A net (e.g. 83.0.=
0.0/8)
> and then add the IPs in that range to that class to make the matching=
 more
> efficient?
>
> Regards,
> =A0Dennis
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
