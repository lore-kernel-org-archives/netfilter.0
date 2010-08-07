From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 14:44:15 -0400
Message-ID: <BAY145-ds21CD2C7CC8AF3A317E2027F3920@phx.gbl>
References: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl> <AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Billy Crook <billycrook@gmail.com>, netfilter@vger.kernel.org

Well, it's more that the openvpn service is running on an IP of the server 
of xxx.xxx.xxx.199 (the server has 2 public IPs).
I don;t really understand why when the client connects, that a site like 
your ipecho below would report my IP as xxx.xxx.xxx.198
If there's no problem with that process then it doesn't bother me too much 
but it doesn;t look very clean. Could it have any routing issues for the 
traffic?

So, I replace:
:OUTPUT ACCEPT [8:3135]
-A PREROUTING -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j 
DNAT --to-destination xx.xxx.xxx.199:1194
-A POSTROUTING -s 172.16.0.0/255.255.255.0 -o eth0 -j MASQUERADE
-A POSTROUTING -s 10.8.0.0/255.255.255.0 -o eth0 -j MASQUERADE

with
:OUTPUT ACCEPT [8:3135]
-A PREROUTING -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j 
DNAT --to-destination xx.xxx.xxx.199:1194
-A POSTROUTING -s 172.16.0.0/255.255.255.0 -o eth0 -j SNAT --to-sourece 
xx.xxx.xxx.199
-A POSTROUTING -s 10.8.0.0/255.255.255.0 -o eth0 -j SNAT --to-source 
xx.xxx.xxx.199

omitting the port numbers?


--------------------------------------------------
From: "Billy Crook" <billycrook@gmail.com>
Sent: Saturday, August 07, 2010 2:35 PM
To: "J Webster" <webster_jack@hotmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: openvpn over udp failing

> On Sat, Aug 7, 2010 at 13:09, J Webster <webster_jack@hotmail.com> wrote:
>> However, although it connects, when I view the IP from the client, it 
>> still
>> says xx.xx.xx.198
>
> That sounds correct to me.  -j MASQUERADE is old and ugly and should
> be avoided.  it really does a -j SNAT --to-source 1.2.3.4 where
> 1.2.3.4 is the primary address of the egressing interface.  It can be
> useful when that interface' address is not static, but you're probably
> better scripting around that.
>
> So you want your openvpn client to use the openvpn server as its
> default route.  And by "view the IP from the client", you mean you
> visit some site like say https://secure.informaction.com/ipecho/ and
> it reports one IP when queried by a process on the openvpn server, and
> reports another IP when queried by a process on an openvpn client, and
> you do not like that?
>
> Try replacing the '-j MASQUERADE's with explicit '-j SNAT --to-source's.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
