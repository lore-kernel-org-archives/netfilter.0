From: lst_hoe02@kwsoft.de
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 30 Nov 2010 15:01:11 +0100
Message-ID: <20101130150111.13547a111e1gy5c0@webmail.kwsoft.de>
References: <C426DC428D95484BB7DF53F6DA1B34DB@gericomfx5600>
 <4CF2A686.4000309@plouf.fr.eu.org>
 <72283C9ECA07450499E7F3DDA655791F@gericomfx5600>
 <543C3E74493F496B8E7D13CA062D1FEC@gericomfx5600>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <543C3E74493F496B8E7D13CA062D1FEC@gericomfx5600>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Zitat von Secure-SIP-Server <info@secure-sip-server.net>:

> Hi Alex!
>
>> I've set up a few basic rules to throttle SMTP traffic from an
>> individual host should they make more than 10 connections in ten
>> seconds:
>>
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m  
>> recent --set
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
>> recent --update --seconds 10 --hitcount 10 -j LOG
>> iptables -I INPUT -p tcp --dport 25 -i eth0 -m state --state NEW -m
>> recent --update --seconds 10 --hitcount 10 -j DROP
>>
>> Is this the correct way to do this? I notice the seconds value can't
>> be any greater than 20. What is the reason for this? I'd like to do
>> something like permit up to 100 messages/connections over any
>> 60-second period. Is this possible?

You can't at TCP/IP level. Modern Mailserver are able to push a lot of  
messages in *one* TCP/IP session (ESMTP). You can handle the max.  
number of new connections/time (recent) and the max. number of  
parallel connections at a given time (connlimit), but not the number  
of messages with iptables or any other TCP/IP based filter.

Regards

Andreas




