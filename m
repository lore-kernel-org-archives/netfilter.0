From: Donald Schlicht <dschlic1@gmail.com>
Subject: Re: Help with routing ping requests
Date: Mon, 20 Jul 2015 09:05:29 -0400
Message-ID: <CAA0NJieGe771feM-0k5nyEqzXwfrHp+hwOt9t+=yJ7rmq+ERUg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=xNRMwLLsbHEkU0lvKWRdsFERxOLQtoO0Dn9yYKHhCJ8=;
        b=XcYAJ2NyTnelL9lHl6w7RRQvq0j5r1lPzZKeGxDQCrGA+W94/bnkej2TxcV1icLwSr
         OFeTSnoJL6nmtQPLLhV9EridzbcmmzO5XGNSnJE/Ne8IFUmt2aTQ2VoaGEG4+p5TEWwG
         TiaLvEIQEJ5UpJOjfE2sMq3dcqZPnaRHN0+xv3yRthj9Y1EuFynvSuBBWi8i18YIsbpU
         D5DQXFLA6jW9tghuvhL3MigGsS5aqLYsVcCps1MdvnEFQMGkkrW92z5A3g/xDAWs63KQ
         KtueK6atUFc+Ily1dnmKni6VsvbleCRqk2XjRr6zG+EHcJdSwLOaf3KUjEZi8ehp7qsT
         9RJQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am using Wireshark to sniff IP packets on both the WAN side and the
LAN side. It is good to know that the packets are passing through the
tables correctly. Anyone have an idea why I'm not seeing anything on
the LAN side?

>> I have an application where I need to configure a router to pass through
>> ping requests (ICMP type 8) through to the LAN port. I have a Linksys
>> WRT54GS with tiny DD-WRT V24 SP2 installed. I am adding the following
>> iptables rules:
>>
>> iptables -t nat -I PREROUTING -p icmp --icmp-type 8 -s 72.64.140.50 -j DNAT
>> --to-destination 192.168.1.200
>> iptables -t filter -I FORWARD -p icmp --icmp-type 8 -s 72.64.140.50 -d
>> 192.168.1.200 -j ACCEPT
>>  iptables -t nat -I POSTROUTING -p icmp --icmp-type 8 -s 72.64.140.50 -d
>> 192.168.1.200 -j ACCEPT
>>
>>  The intent is that the first rule will change an incoming echo request
>> destination to the unit on the LAN which I want to receive the ping request.
>>
>> The second rule allows the modified echo request to pass through the
>> FORWARD table. And the last one allows the modified echo request to pass
>> through the POSTROUTING table. When I send a ping to the router with four
>> tries, I get no pings out the LAN.
>
>What do you mean exactly ? How do you know ?
>
>> Using iptables -L -v -n I can see were
>> rule #1 passes one packet (but not four), rule #2 passes four packets
>> (good!) and rule #3 passes 1 packet.
>
>This is expected behaviour. Chains in the nat table see only the first
>packet of any "connection". NAT operations applied to this packet are
>implicitly applied to subsequent packets of the same connection. A ping
>sequence is considered as a connection.
