From: paddy joesoap <paddyjoesoap@gmail.com>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 2 Nov 2009 22:38:59 +0000
Message-ID: <ac5c74140911021438i70253089y4366be36f16d0a74@mail.gmail.com>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>
	 <4AEF0003.5060404@plouf.fr.eu.org>
	 <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>
	 <4AEF4E5A.9010407@plouf.fr.eu.org>
	 <ac5c74140911021358i36d81ff5r3fe2305c2017d18f@mail.gmail.com>
	 <4AEF5BEE.7080503@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=qRu7KtDqa6XtF/3EuQ/dDJ3e4VNZNoDWz9ml4wevQpU=;
        b=DQcnNfsbwIPCsZfo+I+dUWBM5RV2T5tH8lQbnQOpliZpieHsg+9M6UOz7Kb90+BK4c
         Hiefn+tOvkhlloToVecG4lgVYY3B5InXobWvLafnItjn9lkZzJs8OHoVng0cWysqz3Lo
         T0AjnpB4juF4VUbAoqhGsprtpgUW3V36m4UF4=
In-Reply-To: <4AEF5BEE.7080503@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks for this insightful information Pascal.

I'll take stock and get reading :-)

On Mon, Nov 2, 2009 at 10:23 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> paddy joesoap a =E9crit :
>>>
>>> With a SOHO router, it depends on how the built-in switch works. If=
 each
>>> ethernet port is or can be set as a separate interface (possibly th=
rough
>>> the use of VLANs), then you can build a Linux bridge and inspect br=
idged
>>> traffic with ebtables or bridge-nf + iptables.
> [...]
>> My home router is a Linksys WRT54GL with a 4 port switch. I have
>> installed DD-WRT on it.
>
> It looks like the built-in switch of the WRT54GL is VLAN-capable, so =
it
> should be possible to set each LAN port in a different VLAN, create V=
LAN
> interfaces for each VLAN on the internal interface eth0 (like the WAN
> port and its corresponding VLAN interface vlan1, cf. internal diagram
> e.g. at <http://gablog.eu/online/node/24>) and bridge them together.
> Oops, I don't know whether DD-WRT supports ebtables or has bridge-nf
> enabled.
>
>> If I understood what you said about firewalls and switches in broad
>> terms (possibly in an enterprise setting) =A0I can essentially =A0"t=
rick",
>> for a want of a better term, the switch to forward all traffic to th=
e
>> firewall for inspection regardless if the packets are outbound or no=
t.
>
> It is possible, but I didn't mean that. I meant that the switch itsel=
f
> could act as a firewall, if it is sophisticated enough.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
