From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: [Bridge] Bridge blocking network traffic
Date: Thu, 1 Jul 2010 23:44:55 +0530
Message-ID: <AANLkTikPOw6lJX31LvOOqhaezcU3NJ4u8hdnVhFhGKmF@mail.gmail.com>
References: <m2nbc9320b91004211748o5548f351z646076fab6744cca@mail.gmail.com>
	<20100422130919.70206765@nehalam>
	<AANLkTimPiriAOGpHHrAoEyFGuuyn1g8vFqW6Pimdz9CQ@mail.gmail.com>
	<4C2B97CC.8090007@riverviewtech.net>
	<AANLkTilE0uZQu6SjlkX1WaY32Ir9STQXT4kVNiSc4sCa@mail.gmail.com>
	<4C2CD722.4070905@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=KlLnNiAUpX1LsC2oL0gv3yaraxhQU0xTdRCbIe4EQnY=;
        b=SAVNVrerurKXdP9wtTZK19tbBi1fXpXyCnVSriTgdXliDCvb/EyaVPnPcrFnewKrqj
         mBRnFWzyAjtm2cwUMTiz97yJKCiMxrPADaA37oc7CY5HuUpDHKRuZ+48WZFi4JSnwZ8U
         JqFCcG1XloKEDF/qsiLvsETLekcZulxCNhm5Y=
In-Reply-To: <4C2CD722.4070905@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, bridge@lists.linux-foundation.org

>On Thu, Jul 1, 2010 11:27 PM, Pascal Hambourg <pascal.mail@plouf.fr.eu=
=2Eorg> wrote:
> I strongly doubt it. This rule forces routing of all packets instead =
of
> bridging, so IIUC it effectively totally disables bridging and you ar=
e
> back to two independent interfaces.

 I am sorry that i made a ambigous statement .
 what i meant is : We could add rules to BROUTING to selectively
bridge and route packets .Previously i was not able to ping eth0 or
eth1 from some other machine (in same subnet ) if i attach both to br0
=2E This got solved when we made default policy as DROP .


On Thu, Jul 1, 2010 at 11:27 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> ratheesh k a =E9crit :
>>
>> brctl addbr br0
>> brctl =A0addif eth0
>> brctl =A0addif eth1
>> ifconfig br0 =A00.0.0.0 up
>>
>> The problem was "default brouter policy is accept " . So packets are
>> coming to layer2 =A0only .
>
> Indeed, by default (i.e. no brouting) packets received on a bridge po=
rt
> are intercepted by the bridge. This is the intended behaviour of a
> bridge, isn't it ? Thus a bridge port is not supposed to be assigned =
an
> IP address (or be used by any protocol), because the IP stack (or any
> other upper protocol layer) won't receive any packet directly from it
> but from the bridge interface (which should have the IP address).
>
>>I applied the below command and every thing
>> seemed to work exactly like connecting eth0 and eth1 to hardware hub=
 .
>>
>> ebtables -t broute =A0-P BROUTING -j DROP
>
> I strongly doubt it. This rule forces routing of all packets instead =
of
> bridging, so IIUC it effectively totally disables bridging and you ar=
e
> back to two independent interfaces.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
