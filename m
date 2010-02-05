From: Christoph Paasch <christoph.paasch@gmail.com>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 21:51:26 +0100
Message-ID: <201002052151.27303.christoph.paasch@gmail.com>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com> <1265399439.3910.29.camel@casper.meteor.dp.ua> <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:cc:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=X2CBmBwD6pAe4wfhnQH0+JLWz51G4lzAP+fqwoIXtr4=;
        b=CJnnnut6khfviuU+KCU4kMRvS6UtJY07I93DX89MIYg+7eJDowkHAbbFWemEQPYGb6
         nHkYNCQVxv6BZu0gkDSgoMVvLegg0inGcorGs0ka3V1Ji/dEPrrTxyxPY/w2wYBwJ8l+
         Q8BozCl63v+E9drJojYOIBb2CMfRDLochbeoc=
In-Reply-To: <81ed8b881002051201x53dea5c4l3665b2036da7713@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: =?utf-8?b?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>, netfilter@vger.kernel.org


On Fri 5 February 2010 wrote Dan Daugherty:
> > Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 1521)?
> 
> Negative, but the command from sethra fails immediately with nothing
> showing in the logs
As far as I can see, your destination-machine (vlad) has it's IP ending with 
1.206 (your previous mail) .

Try a simple ping to vlad from sethra.
If this is not working show us the output of "ip route".

Cheers,
Christoph

--
Christoph Paasch

Alcatel-Lucent
IP Development

www.rollerbulls.be
--
