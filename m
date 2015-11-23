From: Shaun Savage <savages@savages.com>
Subject: Re: iptables and policy based routing together
Date: Mon, 23 Nov 2015 10:51:05 -0800
Message-ID: <56536019.5080701@savages.com>
References: <56535BE4.9020504@savages.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=savages.com;
	s=151110; t=1448304638;
	bh=UcSys/95rFZFSN4My7K2wPuxK8rwA76xps6ZC0AA+3Y=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=JMes30JRAgfLSlX3hl+BJ9eXTujAWocuKrQTa8OnhS1qJ7hYDR/pgTRArMFNfEWBq
	 iy7EXevTnNAndLQkFdbctje5o8HLvn7T/iVl+e+/mzSYg2lJVt/YkLAyq9GrIzLzjv
	 4JZOwTtLihKWCAjEQ38FnV4gLplDR4SmGWk0zVDw=
In-Reply-To: <56535BE4.9020504@savages.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, linux-net@vger.kernel.org, netdev@vger.kernel.org


> My problem is I have Virtual Private Servers, VPS in different 
> locations around the world.  I have created a mesh by using openvpn.  
> Each VPS phones home and sets up a TCP connection  to my RT-AC68U 
> running Tomato Shibby 128. I want to route, without thinking, to the 
> different VPS depending upon the country.  Then that VPS is now my 
> exit node.  I also run Tor on each VPS.
>
> The VPNs are setup and working. I have added a filter on INPUT that 
> only allows sessions to initiate from home.
>
> # iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>
> This prevents someone who accesses the VPS to get in to my home network.
>
> Next I have setup marking packets according to country
> CN = 86
> IN = 91
> RU = 7
> so on
>
> # iptables -t mangle -m geoip  --dst-cc CN,HK -j MARK --set-mark 86
> # iptables -t mangle -m geoip  --dst-cc IN -j MARK --set-mark 91
> .....
>
> * BTW how do I debug what fwmark is set?
>
> Now I start adding rules
>
> # ip rule add fwmark 86 table CN
> # ip rule add fwmark 91 table IN
> ......
>
> Now type
>
> # ip rule show
> 0:    from all lookup local
> .....
> 32763:
> 32764:    from all fwmark 0x5B lookup IN
> 32765:    from all fwmark 0x56 lookup CN
> 32766:    from all lookup main
> 32767:    from all lookup default
>
> Now I get lost, to me this states only if fwmark == 0x56 use table CN 
> else do not use table CN
>
> I have played with adding routing to the tables
> # ip route add <gw> dev <tunxx> table CN
> # ????
