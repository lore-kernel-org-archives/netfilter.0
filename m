From: Jan Klod <janklodvan@gmail.com>
Subject: Re: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Fri, 15 Aug 2008 19:14:21 +0300
Message-ID: <200808151914.21997.janklodvan@gmail.com>
References: <200808151255.44987.janklodvan@gmail.com> <48A5A0ED.8010502@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=HS3zkVAckrryK95ujzKGkdAzAbY2+oI7Mnf7YDBaYqs=;
        b=UkjBD4HC34JqEYcKPJKe9VzkZ9f4nEMbGfeF7jrpXv9KKxBUexiYoJYImn3u+3Tn0Q
         gPJljWefTH6z+RN3qlxTEvDsnqCOnfx2YRuM0Xltc6B0Z2WOi6nCJDD13FmES3Uxpagu
         fPx4Xb9aJaOvKGlUl5GDQD4Ayj6dHXtavQeM0=
In-Reply-To: <48A5A0ED.8010502@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

May I ask some commands?
Say, I have eth1 with address 192.168.2.34, router (and nameserver) address 
192.168.2.1 and I've connected to VPN through ppp0 with local  IP address 
215.155.114.16 and remote IP address 215.155.115.254! (VPN's gateway is 
194.12.33.1 for connecting) (VPN or PPTP)

At least, what are those command line entries, so I can browse network through 
VPN?
Hope, I explained better...

On Friday 15 August 2008 18:29:49 you wrote:
> > (all user's traffic through ppp0, while other users can still go
> > through eth1!)
> >
> > Also this created an extra question: how web browser "knows", which
> > interface should be used, if there are multiple?
>
> (With out having even looked at the links you provided I'm going to take
> a stab in the dark.)
>
> I believe you are wanting to have your traffic go through the VPN as a
> default rather than through your existing default gateway.  (Presuming
> that this is the case.)
Not really. My intend was, that linux user myuser1 is using VPN, but all 
others use LAN directly. So all users have network access, but only myuser1 
is connected through VPN!

Jan
