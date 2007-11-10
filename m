From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Sat, 10 Nov 2007 08:29:52 +0000
Message-ID: <e97f32c10711100029n27c439a1g32ab5a7dbac6bbe7@mail.gmail.com>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
	 <1194559495.19115.105.camel@grateful.d.umn.edu>
	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
	 <1194560755.19115.110.camel@grateful.d.umn.edu>
	 <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>
	 <e97f32c10711090243m277b0bfcyc9e0015780c210f5@mail.gmail.com>
	 <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
	 <4734E861.3030106@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=M0GMbYHpxc4TiRN+M0pdbZbL08U7FGsjjiyJwHV2r6c=;
        b=Xcarcq9r1icDMAiM4PXqQyGPEbJZic/i8FdatKCtqfnt5Gyvpd1Pvy2J1aCNS76rPlJR+WAR8fnPzMufybWcGTsra+1bI3rCEtHOm/rKapIAVMBIGS9wsjRM5R19sPa9Yvgr9sbTraltttU2p/2MHTfFuMCSJ1gkXOJEieGRjTA=
In-Reply-To: <4734E861.3030106@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 09/11/2007, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Bradley Kite a =E9crit :
> >
> > the connection-tracking needs to be turned off on the bridges in or=
der
> > to make this work:
> >
> > iptables --table raw -A PREROUTING -i [BRIDGE] -j NOTRACK
>
> This may have undesirable side effects unless you add "-m physdev
> --physdev-is-bridged" to ensure that this rule matches only bridged
> traffic and not forwarded traffic received on the bridge interface.
> If you just don't want Netfilter (including the conntrack and iptable=
s)
> to see the bridged IP traffic, you can do this by setting the sysctl
> net.bridge.bridge-nf-call-iptables to 0.
>
> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
> or
> sysctl -w net.bridge.bridge-nf-call-iptables=3D0
>
> Add the following line in /etc/sysctl.conf to make it persistent acro=
ss
> reboots :
>
> net.bridge.bridge-nf-call-iptables=3D0

Ahh, great thats a much better way of doing it because I dont have to
keep track of all my bridges and apply config to them seperatley.

Many thanks for your help.

--
Brad.
