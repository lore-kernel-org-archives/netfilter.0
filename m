From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 15:17:49 -0400
Message-ID: <BAY145-ds485C6ADAF166EC33C64A7F3920@phx.gbl>
References: <BAY145-ds1603A7ECCE6D4944CFAF48F3920@phx.gbl> <AANLkTikm-McA4wOUBf+xTX8_EBYykis4N_9F6u6XDPEn@mail.gmail.com> <BAY145-ds21CD2C7CC8AF3A317E2027F3920@phx.gbl> <AANLkTimZDpwz5bQhK1JGc-yYVwv2uY-65MUiJHfWQxj+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimZDpwz5bQhK1JGc-yYVwv2uY-65MUiJHfWQxj+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Billy Crook <billycrook@gmail.com>
Cc: netfilter@vger.kernel.org

Would it cause a problem for video sites using RTMP?
They will be expecting a connection form the same IP address won't they?
I guess this could all be solved by binding the vpn to the 198 main address.

--------------------------------------------------
From: "Billy Crook" <billycrook@gmail.com>
Sent: Saturday, August 07, 2010 2:57 PM
To: "J Webster" <webster_jack@hotmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: openvpn over udp failing

> On Sat, Aug 7, 2010 at 13:44, J Webster <webster_jack@hotmail.com> wrote:
>> Well, it's more that the openvpn service is running on an IP of the 
>> server
>> of xxx.xxx.xxx.199 (the server has 2 public IPs).
>> I don;t really understand why when the client connects, that a site like
>> your ipecho below would report my IP as xxx.xxx.xxx.198
>
> That's the source ip that netfilter gave to the MASQUERADEd connection
> as it passed through eth0.  198 is probably the primary ip for eth0
> (eth0:0) and eth0:1 is 199, right?  That is why by connections leaving
> eth0 will default to a source address of 198.  There may be exactly
> one defailt IP.
>
>> omitting the port numbers?
>
> You tell us.  man iptables[enter]/--to-source
>
> I don't know why you'd care about the source port, but it's your box.
> I use --random on mine, because I'm just that way....  Nice job
> netfilter devs, on --persistant.  I was too busy to notice that slip
> in.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
