From: koen.news@koca.be
Subject: Re: multiple external IP's - virtual NIC - DNAT problems
Date: Fri, 29 Jan 2010 18:22:52 +0100 (CET)
Message-ID: <62981.81.165.168.224.1264785772.squirrel@webmail.priorweb.be>
References: <47b63751ecb9bdee2ada1d1be9deb980@mail.priorweb.be>
    <4B62F4B7.80701@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B62F4B7.80701@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> The command you seek is "ip".  Here's an example of adding an address to
> an interface:  "ip address add 1.2.3.4/8 dev eth4".
>
> Happy hacking!
> Mike Wright
>
Thx for the reply. That's indeed what I seek!

I guess I can put that command (or the debian variant) in the pre-up
command for the interface?

Koen Linders

