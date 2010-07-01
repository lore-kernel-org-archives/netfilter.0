From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: [Bridge] Bridge blocking network traffic
Date: Thu, 1 Jul 2010 22:35:53 +0530
Message-ID: <AANLkTilE0uZQu6SjlkX1WaY32Ir9STQXT4kVNiSc4sCa@mail.gmail.com>
References: <m2nbc9320b91004211748o5548f351z646076fab6744cca@mail.gmail.com>
	<20100422130919.70206765@nehalam>
	<AANLkTimPiriAOGpHHrAoEyFGuuyn1g8vFqW6Pimdz9CQ@mail.gmail.com>
	<4C2B97CC.8090007@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wQzPOiiRHRHos0wEzmMOFL+n1UG+YmscY5CHyOjn9zk=;
        b=s3Ww82OXvbfZ2Dct4gfaMPYqizxl2wvv+EBZ7GawQ7LTJL/Tu8xzLWijLU0HkI5jWT
         ipsH8E6jaalfrRxumppyRoLcoJKYBKfoj/8fNMZU/WsAmcVh+M1QloQCyp2OiAWk5a8y
         ynBGB3DdbBrGlHCheTDU/quTk6FYEYSiFkGX4=
In-Reply-To: <4C2B97CC.8090007@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>, bridge@lists.linux-foundation.org

On Thu, Jul 1, 2010 at 12:45 AM, Grant Taylor <gtaylor@riverviewtech.ne=
t> wrote:
> On 06/30/10 02:50, ratheesh k wrote:
>>
>> Why is it so ?
>
> Independent of your scenario, I'd say that binding the IP to the inte=
rface
> will make it more resilient to the individual interfaces going down. =
=A0At
> least in such as all the interfaces would have to go down before the =
IP
> would go down.
>
>> I have a linux =A0 machine with interfaces eth0 (192.168.1.100 ) and=
 eth1 (
>> 192.168.2.100 ) =A0. =A0 . I can connect =A0both eth0 an eth1 =A0to =
a hardware =A0HUB
>> . How could i do this in linux machine itself using brctl ?
>
> What netmask are your two IPs using, a /24? =A0If they are, then you =
are
> actually using two different subnets, and possibly doing something li=
ke a
> bridging router.
>
> Either way, you could bind both IPs to the bridge interface (classic =
IP
> alias or "ip add").
>
> With in the Xen context it may be because different things manage var=
ious
> parts of the Xen network differently and having the IP bound in the w=
rong
> place might cause a problem if the Xen hypervisor takes something dow=
n.
>
> There is also the fact that if a cable gets unplugged from an interfa=
ce
> (that is a member of a bridge with at least one other member interfac=
e) said
> interface will go down but the bridge will stay up. =A0In doing so, t=
he IP
> will go down b/c the interface that it was bound to would go down.
> =A0Conversely if the IP was bound to the bridge interface, the IP wou=
ld stay
> up and usable.
>
> There is also the possibility that if the IP is bound directly to the
> interface that filtering (EBTables / IPTables w/ Bridged Netfilter op=
tion)
> will not see the traffic.
>
> In some ways, it really depends on the specific use scenario.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



                 br0      0.0.0.0
                    |
                    |
  -----------------------------------------
  |                                        |
  |                                        |
eth0                                    eth1
192.168.1.100/24               192.168.2.100/24


brctl addbr br0
brctl  addif eth0
brctl  addif eth1
ifconfig br0  0.0.0.0 up

The problem was "default brouter policy is accept " . So packets are
coming to layer2  only .I applied the below command and every thing
seemed to work exactly like connecting eth0 and eth1 to hardware hub .

ebtables -t broute  -P BROUTING -j DROP


Thanks,
Ratheesh
