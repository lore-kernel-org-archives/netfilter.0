From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: connect to openvpn but multipath routing used.
Date: Wed, 24 Sep 2008 06:58:40 +1000
Message-ID: <48D95880.5050209@standarduniversal.com.au>
References: <48D90CA2.8090208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48D90CA2.8090208@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brent Clark <brentgclarklist@gmail.com>
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>



Brent Clark wrote:
> Hi
>
> For the likes of me I cant get my mind around this.
>
> I got two DSL (two separate ISP's) lines that I use multipath routing 
> on (works like a bomb, i.e. from in the LAN out to internet). But what 
> I want to do is have it that I can randomly connect to my openvpn 
> (sits and configured on my router / fw), via either ISP.
>
> Basically in the openvpn conf file I would like to have
>
> remote-random
> remote oneisp.dyndns.org (fixed ip)
> remote anotherisp.dyndns.org (dynamic ip)
>
> Currently I have openvpn working through the one ISP (fixed ip).
>
> For my tests I have being trying :
>
> iptables -t filter -A INPUT -p udp --dport 1194 -m state --state NEW 
> -j ACCEPT
>
> For output (please bare with me on this)
> iptables -t filter -A OUTPUT -m state --state NEW -j ACCEPT
>
> For marking I have been trying and trying to get traffic out the 
> dynamic ISP.
>
> iptables -t mangle -A OUTPUT -p udp --sport 1194 -j MARK --set-mark 0x1
> iptables -t mangle -A POSTROUTING -p udp --sport 1194 -j MARK 
> --set-mark 0x1
>
> The stranges thing that I saw was that on using the last two of the 
> above rules, is that with using tshark, that i was seeing that ip 
> address of my primary interface (fixed ip address), as opposed to that 
> of the dynamic ip.
>
> If anyone can help it would be appreciate.
>
> Kind Regards
> Brent Clark
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
We have 2 sites with dual wans.

see below, i just forced a connection via both our main office wan 
ports. I can also connect to openvpn on one wan port, and fetch imap via 
the other, without any routing problem being generated on the dual wan box

you need to have a complete marking ruleset or you wont get anywhere.

http://versa.net.au/index.php?option=com_content&task=view&id=21&Itemid=34 
shows the script I use to do the dual wanning.

Wed Sep 24 06:45:21 2008 TCP connection established with 203.217.21.110:1194
Wed Sep 24 06:45:21 2008 TCPv4_CLIENT link local: [undef]
Wed Sep 24 06:45:21 2008 TCPv4_CLIENT link remote: 203.217.21.110:1194
Wed Sep 24 06:45:21 2008 TLS: Initial packet from 203.217.21.110:1194, 
sid=248cd7dd e8778469
Wed Sep 24 06:45:22 2008 VERIFY OK: depth=1, 
/C=AU/ST=NSW/L=Botany/O=Standard_Knitting/CN=mail.standarduniversal.com.au/emailAddress=brian@standarduniversal.com.au
Wed Sep 24 06:45:22 2008 VERIFY OK: depth=0, 
/C=AU/ST=NSW/O=Standard_Knitting/CN=mail.standarduniversal.com.au/emailAddress=brian@standarduniversal.com.au

Wed Sep 24 06:47:13 2008 TCPv4_CLIENT link remote: 60.242.191.129:1194
Wed Sep 24 06:47:13 2008 TLS: Initial packet from 60.242.191.129:1194, 
sid=b15cfe0f fd1aa673
Wed Sep 24 06:47:14 2008 VERIFY OK: depth=1, 
/C=AU/ST=NSW/L=Botany/O=Standard_Knitting/CN=mail.standarduniversal.com.au/emailAddress=brian@standarduniversal.com.au
Wed Sep 24 06:47:14 2008 VERIFY OK: depth=0, 
/C=AU/ST=NSW/O=Standard_Knitting/CN=mail.standarduniversal.com.au/emailAddress=brian@standarduniversal.com.au

