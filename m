From: Angel Motta <angelmotta@gmail.com>
Subject: Re: Rules PREROUTING doesn't work
Date: Thu, 18 Mar 2010 10:36:12 -0500
Message-ID: <1c1b5a0f1003180836m59a89362g18190abbce01a672@mail.gmail.com>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
	 <hnqkk4$62v$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>
	 <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
	 <56378e321003171325n18f4ca91x358acadc0568643c@mail.gmail.com>
	 <hnrrke$d0$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003180214250.12950@obet.zrqbmnf.qr>
	 <hnsba3$50s$1@dough.gmane.org>
	 <1c1b5a0f1003172253s415bb886j15c5339ba1657876@mail.gmail.com>
	 <4BA20B41.6050903@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=PXyI5NSbDR+/ZrLVezGmVYdZGW3PIzeUpjKyr8Qedq4=;
        b=H1kXsYEA42TrB1KDNtIBL7Smn73vEE3Bnsd2JqJAoKA6t77TvpMBajRqttKsnBIuR4
         NZ5FqO03AQkVtI9JtqU/pij2RnvC+HhN+etNvZHPEhXHRElFC3PjIfkAzegWI9fyfPQZ
         56a8DdMot075V45+WQrkkFf7Nx4le0dNpnX4A=
In-Reply-To: <4BA20B41.6050903@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Thanks a lot Mart

I found that parameter in Centos5 with:
#> cat /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout
30

This means that the connections UDP of my vpnclients will keep trying
connect to Firewall until finish this time 30 minutes....despite I
have my PREROUTING rule stating redirect that traffic UDP to the
server VPN behind the Firewall??
This is the cause of the problem??

Thanks, I hope your comments to schedule this work at night with my fir=
ewall
I hope to fix this soon as possible

Thanks List for your assistance
--
Angel

2010/3/18 Mart Frauenlob <mart.frauenlob@chello.at>:
> On 18.03.2010 06:59, angelmotta@gmail.com wrote:
>
>> One question, I donde have that file
>> /proc/sys/net/netfilter/nf_conntrack_udp_timeout*
>> I don't have netfilter directory, where is that ??
>>
>
> on older systems it used to be in:
> /proc/sys/net/ipv4/
>
> and maybe also was named with the ip_* prefix, not with nf_*.
>
> to look for it yourself, you could have done something like:
> find /proc/sys/ -name netfilter -type d
> or
> find /proc/sys/ -name '*conntrack*'
> ...
>
> Best regards
>
> Mart
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Atte
Angel Motta Paz
