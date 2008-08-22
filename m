From: Jan Klod <janklodvan@gmail.com>
Subject: Re: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Fri, 22 Aug 2008 23:40:23 +0300
Message-ID: <200808222340.23688.janklodvan@gmail.com>
References: <200808151255.44987.janklodvan@gmail.com> <200808171420.32090.janklodvan@gmail.com> <48A865A3.1010307@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-disposition
         :content-type:content-transfer-encoding:message-id;
        bh=yvNZ6u7dUOvGrlBXVLeP13ocueOPMP7iA+sjZSMKwTE=;
        b=DJiEmdNND+ktIS5XU118MdKl8rOLm9keGMA98WAisR2NiforNomabtE29eibHucRdc
         oIkkpjycojE6bwRhdYoBcSK4e0GvbSRkN81j5350t23eSxB7FGfTmGCp/5BQX7SSuXtM
         bumrrf78wRcM43z/1vvj8fdQy/ezRX0YoZXyk=
In-Reply-To: <48A865A3.1010307@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Well, I got it to work in a mode, where all traffic is going through VPN like 
this:

ip route add $IP_VPN_GATEWAY via $IP_LOCAL_GATEWAY dev eth1
ip route del $IP_REMOTE_VPN_ENDPOINT dev ppp0 src $IP_LOCAL_VPN_ENDPOINT
ip route del default via $IP_LOCAL_GATEWAY dev eth1 && ip route add default 
via $IP_VPN_GATEWAY dev ppp0

But is not as nice as I would like. 

I tried this to achieve my initial goal -- ppp0 for particular user:

	echo localIP_VPN = $1
        echo remoteIP_VPN = IP_VPN_GATEWAY = $2
        echo real interface = $3
        ip rule add from all fwmark 1 table net
        ip rule add from all fwmark 2 table net-2111
        ip route add table net default via $2 dev ppp0
        ip route add table net-2111 default via 0.0.0.0 dev $3
        ip route del $2 dev ppp0 src $1
        ip route flush cache

        iptables -t mangle -A OUTPUT -m mark --mark 1 -j ACCEPT
        iptables -t mangle -A PREROUTING -m mark --mark 2 -j ACCEPT
        iptables -t mangle -A OUTPUT -m mark ! --mark 1 -m owner --uid-owner 
articles -j MARK --set-mark 1
        iptables -t mangle -A PREROUTING -d $1 -m mark ! --mark 2 -j 
MARK --set-mark 2
        iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to-source $1

But that just didn't worked somehow. Please take a closer look at previous 
commands and give some advices about if that is what I should do...

As you see, I have two tables, so I hope to "take out" outgoing from user 
through ppp0 and forward replies back to eth1, which, I believe is listened 
to, when is default in route main table.

Jan
