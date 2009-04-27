From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 09:46:35 +0300
Message-ID: <d39744a20904262346p41c1b5fcy2f754a9263d09df3@mail.gmail.com>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com> 
	<3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt> 
	<000001c9c703$2d3cabf0$87b603d0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=NDx2ZPxNViPniDO5wWfadoYjd2t6szN5CQB2Aco6avo=;
        b=XxGJ1Sk8h7pylw0TSYfK8e22qt1dfBNVhBkqJA6T+Gk2EmNljgWz/kgnryokRjw1kF
         8gdik2k3nSgpjEI99/tw78xe0CfOd+ln1EKLyT07bbAFZ0eI4lV9XJreC6ssQa9b346g
         Yfv0/ytJITHIak/QzDUmYGi9854ySDspi0sWM=
In-Reply-To: <000001c9c703$2d3cabf0$87b603d0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lists@sterenborg.info
Cc: Netfilter <netfilter@vger.kernel.org>

> If iptables would have to perform a DNS lookup everytime a packet
> passes, I think it would be terribly slow and probably not usable for
> packetfiltering.
Actually the DNS lookup is performed only once - in the time the rule
is inserted/appended. If the DNS returns more than one IP per name, a
number of rules is inserted with each IP returned.
