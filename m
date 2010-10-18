From: Bob Miller <bob@computerisms.ca>
Subject: Re: xtables-addons ACCOUNT
Date: Mon, 18 Oct 2010 09:32:33 -0700
Message-ID: <1287419553.13167.237.camel@laplaplian>
References: <201010181712.03160.maarten@ba.be>
	 <1287418703.13167.231.camel@laplaplian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1287418703.13167.231.camel@laplaplian>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org

>  loaded, I created the following rules for my
> networks:
> 
> gatelian:/usr/lib# iptables-save | grep tname
> -A POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tname wan
> -A POSTROUTING -j ACCOUNT --addr 192.168.25.0/24 --tname computerisms
> -A POSTROUTING -j ACCOUNT --addr 192.168.24.0/24 --tname
> computerisms-public

This is in the mangle table...

Bob Miller
334-7117/660-5315
http://computerisms.ca
bob@computerisms.ca
Network, Internet, Server,
and Open Source Solutions

