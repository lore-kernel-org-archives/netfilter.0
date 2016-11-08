From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: matching process
Date: Tue, 8 Nov 2016 12:07:52 +0300
Message-ID: <CAEzD07+0edc391W8uq=xHjYUSRaQJEuhZSvV8H0PF-+SWdNbnw@mail.gmail.com>
References: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ie76LJDPTpbIIhfEwdoShSSAgZu9or18WAEKbHLix5k=;
        b=HymWMdcPndG71lJ699+2OZJCxQGlQiLg3eJCnFp6cgpn1JHY4EMRGg1EPd60p6yrLR
         vR9jxWwhY9KKESMtvVU4l9wP44umoMq8j5PZZBJTUawKW25Vq5z3rhVl6brGSSzr/UES
         x66k9PUQ1u4tgPu1TUWliljscIuHODEePdeozupbIB7cOu2TOjOP71d0pjLygsInmnL5
         Td5yZdjhPTUU44nZFo4tzd7SLvFHHiOVnFBPD9DGccaCxenuOW0K9GKbKD4vYlkoystE
         kN7GC9eDeywiwma56bTjABfSbelMnsEvTLg9n6c9ys72dl0+5bcsJ89+3bvXUdMP2YEP
         9IvA==
In-Reply-To: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Emius <art@emius.ru>
Cc: netfilter@vger.kernel.org

> Does criteria number matter? Two example rules are written below.
> iptables -t filter -A FORWARD -i eth0 -p icmp -j ACCEPT
> iptables -t filter -A FORWARD -i eth1 -s 10.10.10.10 -d 10.20.20.20 -p
> icmp -j ACCEPT
> Will it take same time to match packet by these rules, or first rule
> will take less time?

Both rules take the same time: addresses, interfaces and protocol
matches will be checked.

> How does matching process exactly happens?
> Let's say we have a rule like:
> iptables -t filter -A FORWARD -i eth0 -s 10.10.10.10 -d 10.20.20.20 -p
> udp --dport 123 -j ACCEPT
> And packet with
> iif=eth1
> src=10.10.10.10
> dst=10.20.20.20
> proto=udp
> dport=123
>
> Will netfilter match packet with all criteria specified and make
> decision in the end, or it will jump to next rule when first criteria
> mismatch happen?

In this case will be checked addresses at first place, and match
process will be break
after interface mismatch.

> And third question. Is it all fair if using ipset? Will packet be
> matched with SET2 if it doesn't match SET1?
> iptables -t filter -A FORWARD -m set --match-set SET1 src,src -m set
> --match-set SET2 dst,dst -j ACCEPT

It fairs for any type of matches. A packet will not be matched with
SET2 - after SET1
checking there is a jump at next rule.

>
> --
> Regards,
> Emius
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
