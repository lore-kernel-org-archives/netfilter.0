From: Antoine Souques <corum@via.ecp.fr>
Subject: Re: Fair queuing with htb
Date: Sat, 25 Dec 2010 03:41:10 +0100
Message-ID: <4D1559C6.2020807@via.ecp.fr>
References: <201012230226.31297.gregoire.leroy@hyperthese.net> <201012231330.06888.gregoire.leroy@hyperthese.net> <1293235795.1660.7.camel@andybev> <201012250208.36503.gregoire.leroy@hyperthese.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201012250208.36503.gregoire.leroy@hyperthese.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org


> I've attached a graph which explains what are the marked packets.
>
Your design is wrong. You mark the upload traffic, when the main http 
traffic is the download traffic. That is why your QoS seems ineffective


> The general goal is to do a QoS based on user ip. If I had no proxy, 
> it would
> be easy. However, since I've a proxy, my firewall sees the proxy ip, 
> not the
> users IP.
>
Where is your firewall ? Between the proxy and the webserver, or the 
otherside ?

In the first case, you can only mark the upload traffic (it's to late 
for the download traffic). You should use the conntrack module to mark a 
connection, and so, you will be able to mark the download traffic

Moreover, I don't understand why you don't have access to your user 
addresses. You use mark, so your firewall and your proxy are running on 
the same box. So, when the download traffic leaves your proxy/firewall, 
the destination adsress is the user address. tc is called when a packet 
is send to the network, or when a packet arrive. So you can do IP based 
QoS.

Antoine
