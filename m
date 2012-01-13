From: Andrew Beverley <andy@andybev.com>
Subject: Re: Dual WAN set-up
Date: Fri, 13 Jan 2012 07:25:45 +0000
Message-ID: <1326439545.2182.17.camel@andrew-desktop>
References: <201201121651.18887.dyioulos@onpointfc.com>
	 <op.v7zujutux1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1326439546;
	bh=PCtrBDB6ebg/1xcG5xkIeCUvMTdRoZcplDLGNL+Z+Fg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=TImW8dqjnIWMs+eqiG/zNJZBQDuq3p6xo+pW+o1/5KpnnYVt3A2ljfuQAA67jIHNd
	 ESwm7byKHEP1WQq4I4IahfC+hCXHr6nskhpEEvJrIHoGpCuLVUWCvN6VaZs+hrtm9+
	 bIJPV0M8Y1TyrIqPQknvuqML7Nm89BO+e2zWkniE=
In-Reply-To: <op.v7zujutux1lyi3@debiandesk2.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks for the comprehensive answer Lloyd. A couple of minor points:

> 2. You would set up a custom routing table for the special DMZ traffic.
>   Use the info in the above link to do that.  Suppose it is called
> "DMZSPECIAL".  You will set up routing to the new DMZ interface using
> the MYDMZ table, something like this:
> 
> 	ip route add 10.x.x.x/8 dev ${DMZinterface} src ${wan} table DMZSPECIAL
> 	ip route add default via ${gateway} dev ${interface} table DMZSPECIAL
> 

[...]

> 3. You would NEW mark all packets from the special DMZ hosts with
> fwmark 1, like this (repeat for each source IP or subnet to use the new
> interface):

Using marks is one way to do this, and provides plenty of flexibility.
However, if all the traffic is coming from the same IP address /
interface, then you should be able to use straight iproute2 rules to
match those aspects, without even touching iptables (see ip rule).


> 	iptables -t mangle -A PREROUTING -m state --state NEW
> -s 10.x.x.x -j CONNMARK1
>

Also, if you do decide to use netfilter marks (which is certainly no bad
thing IMHO), then you probably don't need to mark connections and then
restore them. Instead just mark a packet straight away:

iptables -t mangle -A PREROUTING -s 10.x.x.x -j MARK --set-mark 1

Andy


