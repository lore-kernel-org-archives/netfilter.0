From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 16:45:28 +0100 (WEST)
Message-ID: <2989.192.168.1.3.1245858328.squirrel@webmail.decimal.pt>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
    <200906241320.13779.christoph.paasch@gmail.com>
    <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
    <200906241347.41841.christoph.paasch@gmail.com>
    <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
    <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

> You are always advised to make the default rule (Ie policy) drop with
> any firewall then only explicitly allow traffic you wish allow:
>
> (I am assuming here you want to allow connections *to* port 22 on the
> external network from your internal network, for my example the
> internal network has an ip address of 192.168.0.0/24)
> iptables -t filter -F FORWARD  # Clear out what exists already
> iptables -t filter -P FORWARD -j drop # Set default to drop
> iptables -t filter -A FORWARD -s 192.168.0.0/24 -d ! 192.168.0.0/24 -p
> tcp --dport 22 -j ACCEPT


cisne:/etc/rc.d# iptables -t filter -P FORWARD -j DROP
iptables v1.4.4: -P requires a chain and a policy
Try `iptables -h' or 'iptables --help' for more information.



