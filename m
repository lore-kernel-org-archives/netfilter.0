From: Simion Onea <simionea@gmail.com>
Subject: Re: Forwarding packets over the same LAN
Date: Wed, 15 Jul 2009 10:38:10 +0300
Message-ID: <1247643490.11785.4.camel@TestField.intranet.bem.md>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
	 <1247494451.25529.52.camel@enterprise.ims-firmen.de>
	 <1247558286.7214.16.camel@TestField.intranet.bem.md>
	 <1247574465.30915.31.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:cc
         :in-reply-to:references:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=CjYt0aN6ym1pUbkVtZQ0aA19QPsvscQ30Qoz79ioCzo=;
        b=WyQSJftjkwcbLZw1uJ18vD0hm3Uu375Nczs2z67VSs2W1TwsBEffwwm01YHR7k8M1s
         wWm+FNm4AiKvH1mFPRH3ZK28lSMlxE0Q+GzU0UPlN9o+SaXTC97+G2vvKYw4SdeFo2+9
         RL+WkiIkWUC1aog9pbWAwKlopDcC1fkGc8yt4=
In-Reply-To: <1247574465.30915.31.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Tue, 2009-07-14 at 14:27 +0200, Thomas Jacob wrote:
> > > You need DNAT+SNAT for this:
> > > 
> > > # Redirect to IP:Port
> > > iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 \
> > > 	 -j DNAT --to-destination 172.20.1.254:25
> > > 
> > > # Ensure that the replies come back to us
> > > iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 25 \
> > >          -d 172.20.1.254  -j SNAT --to-source 172.20.1.245

Finally I managed to set it up correctly!
The problem was with another rule blocking forwarded traffic to port 25.
After I corrected the rules everything worked fine.

Thank you for your time and expertise!

Best regards,
Simion.


