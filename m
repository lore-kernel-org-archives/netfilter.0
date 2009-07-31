From: "Mitchell Warden" <wardenm@wardenm.net>
Subject: Re: IPTables forward before redirection
Date: Sat, 01 Aug 2009 09:40:48 +1000
Message-ID: <20090731234048.65b90795@mail.wardenm.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: a32a580b0907231014r21946493mabe5e31e58aeae8d@mail.gmail.com
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Orzechowski <jamie.orzechowski@gmail.com>, netfilter@vger.kernel.org

Hi,

I don't see any responses to this, but I'm sure this can be done with just a few simple rules.

# Send all traffic that we might want to proxy to TPROXY
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j TPROXY

# Return this traffic so that other PREROUTING rules can be applied
iptables -t nat -A TPROXY -d 10.0.0.0/24 -j RETURN

# Everything left will be passed to the proxy
iptables -t nat -A TPROXY -j REDIRECT --to-ports 3128


Mitchell


----- Original Message -----
From: Jamie Orzechowski
[mailto:jamie.orzechowski@gmail.com]
To: netfilter@vger.kernel.org
Sent:
Fri, 24 Jul 2009 03:14:34 +1000
Subject: IPTables forward before
redirection


> I am running Squid Cache with TPROXY Support ... the problem is my
> iptables rules are passing all port 80 traffic to squid.  I want to
> add a rule to bypass a local subnet so it is not intercepted and goes
> direct to the destination ... here is my rule but it's not working ..
> it's still being intercepted.  All traffic occurs on eth1 ... any
> ideas?
> 
> iptables -t mangle -N DIVERT
> iptables -t mangle -A DIVERT -j MARK --set-mark 1
> iptables -t mangle -A DIVERT -j ACCEPT
> 
> #Bypass This destination
> iptables -t mangle -A PREROUTING -p tcp -m tcp -i eth1 --dport 80 -d
> 66.78.96.0/255.255.255.0 -j ACCEPT
> 
> iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
> iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY
> --tproxy-mark 0x1/0x1 --on-port 3129 --on-ip 66.78.102.2
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
