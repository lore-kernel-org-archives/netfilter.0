From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Forward traffic between two interfaces on the same host
Date: Wed, 7 Oct 2009 07:56:01 -0700 (PDT)
Message-ID: <43743.45717.qm@web31601.mail.mud.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1254927362; bh=RvRKuw7Ah2lCF+ae3em3RAZmsTS//AXg1mU0C16uew4=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:MIME-Version:Content-Type; b=Ki+A5e53yzJU48LLdqXFLDmG9Re02JYpXGQ1fzPRuAwlg4Hi26aPvxo1jlrfQTJLJmBoR+fhjrholxW1svw6MJ0ZL3UJIelzslxOh8PnMP6VWvs4OU6+yyBPDnlEZxkh0tgnyt4NQ2EjR6tSWcp51lirRt2XWf95SPARdZHDsNQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: kpele_ntua@yahoo.com

Hi all,

I am new in using iptables so I would like to do a few questions for something that maybe many of you find easy :) 

In particular, I have a laptop with two wireless interfaces, a Wifi and a 3G.  I would like to share the 3G broadband connection available on this laptop with other machines within my home/internal network through the wifi interface.  I would like to ask if such functionality is possible to be implemented using iptables.  

Even more specific what I need is a 'relay'-like functionality.  Let's assume that laptop A has the two interfaces and laptop B has only a wifi interface.  Laptop-B will be connected with laptop A through the wifi and laptop A needs to serve all the internet requests of laptop B through the 3G usb modem interface.  

I think that I need to use rules like the following for laptop A :

(I use the names wifi0 and 3g0 for the corresponding interfaces and xxx.yyy.zzz.www for the ip of the 3G interface)
iptables -A FORWARD -i wifi0 -o 3g0 -j ACCEPT
iptables -A FORWARD -i 3g0 -o wifi0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -o eth0 -j SNAT --to-source xxx.yyy.zzz.www

Do I miss something here ?  Do I need to take care of something else as well?

Thanks a lot for the help




      
