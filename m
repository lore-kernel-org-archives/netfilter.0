From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting DNS Not Working
Date: Fri, 15 Feb 2013 16:35:03 +0000
Message-ID: <1360946103.2251.2.camel@andylaptop>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1360946127;
	bh=QFogwOQQ5ee/L7Q0SO+B6VTahkOUm9E9AGAvRpmrMtw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=JrZpd6m5HZSTVa6td7geevaYf56mw/6jLQhGAv8QeZsisxSvRQhumUWKhaiqqzlSN
	 wI7teLrXob09U/vofgJGXdav1TADOkMDr24TeQGlH+iOR/Wp1PPRbogGPLZ7ZuxWiJ
	 kkZGAyD93bqYkXVbLZBbaAdVH5ZBM8mS2r7pqiZM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Corps <envoys@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, 2013-02-15 at 11:24 -0500, John Corps wrote:
> Hello All,
> 
> I am having issues with redirecting DNS requests to the internal dns
> server. I have a very simple setup, if someone is put into vlan 1000
> then they do not get internet access at all. If they keep the DNS
> server assigned by DHCP, which is the IP of the gateway in vlan 1000,
> every request they make to a website is resolved to this IP and served
> up the webpage stating no internet is available. If they are clever
> enough to set there own DNS servers, when they open a browser, they do
> not get anything at all, just page can't be displayed. I have not done
> anything with iptables yet as the internal dns server is just
> resolving everything to the local IP address. What I want to do is if
> they set there own DNS, redirect them anyways back to the internal
> DNS. Here are the only 2 rules I have tried but they do not work at
> all, maybe i am missing something? Any help would be greatly
> appreciated!
> 
> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dport
> 53 -j REDIRECT --to-ports 53
> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dport
> 53 -j REDIRECT --to-ports 53

If you want to redirect the requests to the local server, then you'll
need to use the DNAT target instead. All you're doing in your rules is
changing to port 53 a packet that is destined to port 53 (so nothing at
all).

Andy


