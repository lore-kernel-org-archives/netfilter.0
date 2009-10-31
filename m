From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: correct net fitler rule
Date: Sat, 31 Oct 2009 23:44:54 +0000
Message-ID: <56378e320910311644t1b265f34kf3e06ea88c07613d@mail.gmail.com>
References: <4AE7C1CF.2070807@gmail.com> <4AE820AF.70109@chello.at>
	 <4AE83DCE.5080102@gmail.com>
	 <56378e320910280553o7e7f246fk8f3dbe5f6f7fb5c8@mail.gmail.com>
	 <4AEC91DD.7040009@intrex.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=qJ/Pi2PdwcOzkM/7vIk/Mq0EsLc0Hl9DQhJ6yK5PNHQ=;
        b=lgr9LLMUKZF6KvizKmm1C8H3Qr94G6PwykJZQ/wCKX1l371yHlt+kwajgtEkVFOTX1
         l22JqUZfkIpzxWIps2HdlR60QXjqayMfrlnPGSULd9e/kcruECYBVFy29rUdRs/YVYzu
         21aa8IM2qcTqJ2aQQTFlrGS5BrcX0F3Tc/vBw=
In-Reply-To: <4AEC91DD.7040009@intrex.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ralph Blach <rblach@intrex.net>
Cc: netfilter@vger.kernel.org

2009/10/31 Ralph Blach <rblach@intrex.net>
>
> I am not so good at writing what I wish to accomplish
>
> I am often not at home and wish to access my system. =A0That means wh=
en I ssh into my machine, it will be from
> a ip address of a hotels or other ISP network.
>
> Internternet =A0 =A0 =A0 =A0 =A0 =A0 linksys =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A010.0=
=2E0.0/255.255.255.0
> -------------------| firewall with portt 22 forwarded | -------------=
---|linux server|------------
>
> For my home machine, I wish to block traffic from network which I see=
 in my /var/log/secure file have attached my machine.
> ( By now I have a long list, I anybody wants it)
> But for certain well know address, like the 10.0.0.0/255.255.255.0 an=
d the nameserver addresses, I just wish to accept those
> There seens to be a never ending stream of break in attempts.
>
> in sshd, I have all =A0dened all uses =A0except a 2 users with Comple=
x names and passwords.
>
> so allow the internal local network.
> allow the nameservers.
> deny attacking networks.
>


iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -N ALLOW
iptables -A ALLOW -s <internal network> -j ACCEPT
iptables -A ALLOW -d <internal network> -j ACCEPT
iptables -A ALLOW -s <dns> --sport 53 -j ACCEPT
iptables -A ALLOW -d <dns> --dport 53 -j ACCEPT
iptables -A INPUT -j ALLOW
iptables -A INPUT -j LOG --log-prefix "FW DROP >" --log-ip-options
--log-tcp-options

Repeat the last two rules for the OUTPUT and FORWARD chains as well.

The last (log) rule is only if you want a record of whats going on.

***ANY*** traffic not explicitly added to the ALLOW user-defined chain
will get dropped.





--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Fo=
rest Cats
http://www.pbase.com/arimus - My online photogallery
