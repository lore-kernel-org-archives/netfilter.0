From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: ssh overflow blacklisting not working properly
Date: Tue, 30 Mar 2010 09:23:47 +0100
Message-ID: <56378e321003300123j2c2dbc51ld8513483a7ee9753@mail.gmail.com>
References: <4BB0574A.2060106@infoservices.in>
	 <56378e321003290118i2fd96c99l29f2590743e5fb36@mail.gmail.com>
	 <4BB08644.1060009@infoservices.in>
	 <alpine.LSU.2.01.1003291303410.16683@obet.zrqbmnf.qr>
	 <4BB08D76.9010006@infoservices.in>
	 <56378e321003290454k3e39a5afo525579d7138c1f40@mail.gmail.com>
	 <4BB1AB4F.4060200@infoservices.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:received:message-id:subject:from:to:cc:content-type;
        bh=QxQyTsZieTWZY46bCZu3xW6AFIa4YbWVjtJtnmbOSgI=;
        b=n1+icJOJzim0mPg9jB/a8vZmcKFQ2W8IYpbEDfxg0g4RG57ijXYBNmaCEykiWkiYBU
         +jjGb0qJayxuQmjKDUm+Xo7WlIPC3GmdVwEpY8NX+IXbh1Mb5dSmgv4z4R9nJ31lesOD
         A9RVvg1N7fOHXv1i2ZA47maAQSzd1o7g/fPVI=
In-Reply-To: <4BB1AB4F.4060200@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

My bad... you still need a rule to accept ssh traffic...

so add a fourth rule

-A INPUT -p tcp --dport ssh -m state NEW -j ACCEPT

and a fifth
-A INPUT -p tcp -m state ESTABLISHED,RELATED -j ACCEPT

The fourth rule accepts SSH which hasn't been dropped by the first 3
rules, the fifth just allows established sessions and related.

You'll need to tighten the fourth rule as appropriate but you don't
need to add the rate limiting stuff as that's delt with so just
tighten allowed addresses,ports etc.

(Tip: unless you've moved a service from its usual port you can use
the name from /etc/services for the port number, and for the -p
<protoocl> you can use the names from /etc/protocols)


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
