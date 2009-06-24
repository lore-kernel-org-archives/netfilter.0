From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 18:00:03 +0200
Message-ID: <33be4bb30906240900i4eeaac53sde1ad8cfff7356a9@mail.gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
	 <200906241320.13779.christoph.paasch@gmail.com>
	 <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
	 <200906241347.41841.christoph.paasch@gmail.com>
	 <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
	 <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
	 <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=4Aat4BoOpAZuX8aC9BRBeFZMc5UPJUkOKnOuAIs7ZPY=;
        b=HNeP89nXS+fjyKUHEB4A7+PyboXxBxGt4esjabya5naa3jeS+PWtvaAk9I+cOnxLNr
         T1lEDZ23O4gHXzh/KcWbOuBN0a3TXM10N3C/wEuA1LY7kRf6+K+YPDG8aAmyIw6Zfi1t
         tlvBlzP6MuHSLMWo5hJyKyJh16dGZ8/Xtyk8Y=
In-Reply-To: <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

2009/6/24 Jorge Bastos <mysql.jorge@decimal.pt>:
>> You are always advised to make the default rule (Ie policy) drop wit=
h
>> any firewall then only explicitly allow traffic you wish allow:
>>
>> (I am assuming here you want to allow connections *to* port 22 on th=
e
>> external network from your internal network, for my example the
>> internal network has an ip address of 192.168.0.0/24)
>> iptables -t filter -F FORWARD =A0# Clear out what exists already
>> iptables -t filter -P FORWARD -j drop # Set default to drop
>> iptables -t filter -A FORWARD -s 192.168.0.0/24 -d ! 192.168.0.0/24 =
-p
>> tcp --dport 22 -j ACCEPT
>
>
> cisne:/etc/rc.d# iptables -t filter -P FORWARD -j DROP
> iptables v1.4.4: -P requires a chain and a policy
> Try `iptables -h' or 'iptables --help' for more information.


So did you try iptables -h for more information as it suggests? This
simple typo is easy to resolve by reading the top few lines of the
help message. :-)

/Oskar
