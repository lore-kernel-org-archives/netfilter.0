From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 12:24:05 +0100 (WEST)
Message-ID: <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
    <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt>
    <001d01c9f4ba$316a3c30$943eb490$@info>
    <200906241320.13779.christoph.paasch@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200906241320.13779.christoph.paasch@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Paasch <christoph.paasch@gmail.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org

> On Wed June 24 2009 wrote Rob Sterenborg:
>> $ipt -P FORWARD DROP
>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>> $ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT
> Watch out, that with these rules, you will allow any traffic to pass, that
> has
> destination port 22. Thus, the outside can contact you to port 22. And the
> inside can contact any host on the Internet on port 22.

No good then, i just want to allow traffic for ports defined by me, for
the NAT'd machines.

Can you guys help on this? Sorry but i really have no idea, with the
PREROUTING it was easy for me.

