From: Weedy <weedy2887@gmail.com>
Subject: Re: iptables 1.4.x and xt_recent: my rules have fallen and they can't
 	get up!
Date: Tue, 05 May 2009 15:00:18 -0400
Message-ID: <4A008CC2.5080806@gmail.com>
References: <49FBFDB7.4070204@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :x-enigmail-version:content-type:content-transfer-encoding;
        bh=aqS8lbgxYwfZxQyKETPRQFFla+/vpNfZVpwQs3eMcrk=;
        b=dM1pV1Ruw7kYOprB9ZLe+ODB7Tls2THRH1S4MBNyGbsk25tBck5QL14fdPTGi1bEiQ
         /Qmx6jTRKmcCmbbnHiydV0N5DTH8wZl7RNqa6CYPBcHpGOm/srdKZU79A31SridKOTYm
         qQZXk51qnF3MesmiIhDn8rCvoZZSttkXgBCkc=
In-Reply-To: <49FBFDB7.4070204@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

So I was wondering why I didn't get a response and I noticed that I
forgot to mention I'm not subscribed to the list. :/
Anyway, I was able to fix the ssh rules but I've been trying to do the
same for the flooding rules and I've had no luck, so if someone could be
a bit more specific that would be great.
iptables -t nat -A NEW -m limit --limit 50 --limit-burst 100 -j RETURN && \
    iptables -t nat -A NEW -j DROP

ps. a: I'm subscribed now b: I hope the list software adds this to my
thread.
