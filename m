From: mictlan tecutli <mictlan.tecutli.0@gmail.com>
Subject: Re: http PREROUTING works but other ports do not
Date: Wed, 12 Nov 2008 17:02:00 -0600
Message-ID: <20081112170200.410edbe5@zas.gateway.2wire.net>
References: <20081110194846.79984f14@zas.gateway.2wire.net>
	<491A7300.5010200@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:date:from:to:subject
         :message-id:in-reply-to:references:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=l+DDb0z4miBJvk/sHI5GIMArO1Ckyrf49Ef18EWs/zo=;
        b=hJRhBPY3VkqduMOarEjAmkwzzySimOqMiw2PZIuvh0cBbaPEwJme8zidSyBx8pisvr
         0Fu7WsXcWynsnh59HeQaY+Y0KmNi/EflBwI8GUytomLa46jq9+RedHeh62DKdk3l0Ds7
         xLKvE5n2YV0BjowwLmjX1MCpaC2GB23NELqjY=
In-Reply-To: <491A7300.5010200@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

first of all thanks for the quick responce. i=C2=B4ll attempt to answer=
 your questions as clearly as possible.=20

> I can't say for sure, but I do see a few things that are odd.
>   - You are making reference to both ports 2220 and 2222.  Is one of=20
> them a typo?

nope i=C2=B4m using both of them. i have ssh on port 2222 on the host r=
unning the firewall (that is to say the host hosting the vservers). and=
 port 2220 get forwared to 10.10.10.20:22, that is to say the standard =
ssh port on 10.10.10.20, which is on a virtual interface callded dummy0=
:something. each vserver has an ip in the 10.10.10.* net, and the exter=
nal interface is eth0 and corresponds to xxx.xxx.xxx.9.=20

>   - I can't tell what your real destination IP is, xxx.xxx.xxx.0/24=20
> (your subnet) or xxx.xxx.xxx.9 (a specific host).  I'm going to think=
=20
> that it's .9 and refer back to the above point.

i=C2=B4ve tried using a destination address ("-d") of the specific addr=
ess (xxx.xxx.xxx.9) and the subnet (xxx.xxx.xxx.0/24) on diferent in or=
der to try all the posible variations hope that one of them would work =
:/

>   - Will you please clarify what is your internal and external=20
> interface, eth0 verses what?

eth0 is external and dummy0 is internal virtual interface.=20

>   - Do you have specific IPs in your network assigned / allocated to=20
> individual virtual servers?  Or are you doing everything based on por=
t?

i have specific ips (10.10.10.*) assignied to the individial virtual vi=
rtual servers. all of the virtual servers run ssh on port 22. in the ho=
st, iptables recieves a request for, say, port 2220 and sends it on to =
port 22 and the ip in question (10.10.10.20 in this case).


