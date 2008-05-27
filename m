From: jeev <smallpox@gmail.com>
Subject: DUAL wan issue, destination-based routing
Date: Tue, 27 May 2008 16:51:23 -0700
Message-ID: <840713630805271651r116edbb8y58973325c2f7fa49@mail.gmail.com>
References: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=oGi/OQVjj0Rre9Ieu78Z5MYuObtXpbX1oUXK8f/ZOzA=;
        b=unwnpMXsi9SL0ZKWgS/HYlwXgdE/YhjDoLDdBwPyIJf6nCkh9q7BnSwI59goz82w0y88Zd9R+H25/R+TZk0+QVPnJR5n2hpBArjUVCadFa+vKh/JQLh+iJiHqTNHoWUbjBhMBSBtwzOe4MFbvmnEHzJOYV4AxlTZBBIlHZsd1Yo=
In-Reply-To: <840713630805271644hff81960m5c6bea1b612a973c@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey guys, i was reading on the netfilter site.

I saw Patrick McHardy wrote about having 2 cable modems... i'm in the
same situation... my only problem is that I dont want to do load
balancing, i've just come from using PFSENSE/freebsd to use
ClarkConnect on CentOS i guess.. i've never used iptables before. i've
tried things like:

"iptables -A POSTROUTING -t nat -o eth2 -s 192.168.2.0/24 -d
67.17.117.0/24 -j MASQUERADE" and it still doesn't work.

192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.1
24.x.x.0/23 dev eth2  proto kernel  scope link  src 24.x.x.23
71.x.x.0/23 dev eth3  proto kernel  scope link  src 71.x.x.6
default via 71.x.x.1 dev eth3

so right now i have all traffic go out eth3, i'd love to have the ips
and ipblocks i select and have it go out one of the cable interfaces.
so for the example above, i want www.speedtest.net (because it shows
the ip) to go out eth2 but it's still going out eth3.

thanks in advance, i'm really lost...
