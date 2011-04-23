From: J Webster <jw.jwebster@gmail.com>
Subject: Re: only direct port 80 traffic from client
Date: Sat, 23 Apr 2011 18:23:00 +0200
Message-ID: <4DB2FCE4.4090606@gmail.com>
References: <4DAFE343.3070603@googlemail.com> <BANLkTi=ZpD83qOpn5FEK7dQgU27Xa2p3CQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=CV3QLGbzmitr3X1F717fwnVtcm03GvZeiXuoIRW+x58=;
        b=t96yjn0USVSy68lHLDGaUSKxraDq8ksWPcfvNe+YLGqRa2GHHnQAA9cRT4BorvNgPC
         3iWtffOhvCSkBzSwt3CZeOv4oDcoyecOYMTUTzOuyYfFFTKi6iMF1iiwhgYaklcDGTMI
         XNUkNEwLSTjJ6NR1LriNjbJGfvQ8gXFi8T7Xs=
In-Reply-To: <BANLkTi=ZpD83qOpn5FEK7dQgU27Xa2p3CQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: netfilter@vger.kernel.org


> You can use iproute2 to split your traffic.
>
> http://lartc.org/howto/
>
> follow a tip:
>
>
> 1- create a table with name bradesco
>
> echo 200 bradesco>>  /etc/iproute2/rt_tables
>
> 2- Marking the packages desirable ( 192.100.100.0/24>  branch office
> inside network, 128.2.0.0/16 head office inside network )
>
> /sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
> 128.2.0.0/16 -p tcp --dport 80 -j MARK --set-mark 1
> /sbin/iptables -t mangle -A PREROUTING -i eth0 -s 192.100.100.0/24 -d
> 128.2.0.0/16 -p tcp --dport 443 -j MARK --set-mark 1
>
> 3- Add packages have been marked with tag 1 to table bradesco
>
> ip rule add fwmark 1 table bradesco prio 20
>
> 4- Add a gateway for table bradesco
>
> ip route add default via tun0 table bradesco
>
> where tun0 it's your address VPN tunnel
>
But this is on the server isn't it?
It is the traffic from the client and all clients are outside of the 
network.
So, a client from 88.11.11.11 connects to my VPN on fixed IP 
123.123.123.123. Another client from 78.22.11.22 connects to 
123.123.123.123.
I only want them to send port 80 traffic to the server but they should 
direct all their email traffic and other apps through their normal ISP.
iptables cannot bounce the traffic back to the client because the client 
won;t know where to send it after that?
