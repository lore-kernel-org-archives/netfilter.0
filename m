From: Angel Motta <angelmotta@gmail.com>
Subject: Re: Rules PREROUTING doesn't work
Date: Wed, 17 Mar 2010 10:20:55 -0500
Message-ID: <1c1b5a0f1003170820q4cadb03ah4e3f4580f509c5e0@mail.gmail.com>
References: <1c1b5a0f1003162027s73fe4756yefd48b436375b04b@mail.gmail.com>
	 <hnqkk4$62v$1@dough.gmane.org>
	 <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3+9axiRoLxwUfE3BMW2ikE8r8qB8oiYQM2/AeVlPH9c=;
        b=prOewjawXbFRKY0qUD0ZW24/SEqEHZPnAK9ciyji6qpl5lTgrdIvk0sgHAW8zfBXEF
         iwrfipzJIdUYGjq1FkJk29O/S3IgLfj4IU2GVuE3m5jNCuMs2uM5otFCcHxC5TBUafhy
         vKUJYYSFr7qGRAxmBOorQYQ2cp5HcHpNk1wLE=
In-Reply-To: <alpine.LSU.2.01.1003171419450.6297@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Robert Nichols <rnicholsNOSPAM@comcast.net>, netfilter@vger.kernel.org

Thanks for your answers

The explanation of the rule is:

 $IPT -t nat -A PREROUTING  -i $IF_EXT -d $TESTVPN -p udp --dport
5000:6000 -j DNAT --to-destination $IP_DMZ_SERVERVPN

Where:
IP=3D/sbin/iptables
IF_EXT=3D external iface
TEST_VPN=3D Public IP/255.255.255.0 ---> I have noticed this mask is
incorrect, this may be a cause of problems???
IP_DMZ_SERVERVPN

When I apply this rule i did iptable-save and I see that NAT and I
also see my rule with itpables -t nat -L, but the clients vpn still
are conected to the Firewall with that public IP.

If I stop openvpnserver in Firewall, the clients vpn can ping the
public IP and still trying conect to the openvpn in Firewall. I can
see that with the tcpdump the clientsvpn never try to connect to the
openvpn server behind the firewall, the PREROUTING doesn't work.

Thanks for your assistance.
--
Angel

2010/3/17 Jan Engelhardt <jengelh@medozas.de>:
> On Wednesday 2010-03-17 14:14, Robert Nichols wrote:
>> On 03/16/2010 10:27 PM, Angel Motta wrote:
>>> Hi List
>>> This is my first time the I write to this list. I have a problem ca=
se
>>> with rules PREROUTING.
>>> I am creating a rule PREROUTING from a range of port which request
>>> openvpn client and the problem is that when I apply this rules and
>>> only rules NATs are runing (PREROUTING and POSTROUTING the output o=
f
>>> #> =A0iptables -L is blank) the clients openvpn still conect to the
>>> Firewall and not to the SERVERVPN, all requests are processed for
>>> firewall.
>>>
>>> this is the rule:
>>> $IPT -t nat -A PREROUTING =A0-i $IF_EXT -d $TESTVPN -p udp --dport
>>> 5000:6000 -j DNAT --to-destination $IP_DMZ_SERVERVPN
>>
>> That listing command needs to be "iptables -t nat -L". =A0The defaul=
t is
>> to display only the filter table, which doesn't include the above ru=
le.
>
> The listing command should preferably be iptables-save so people get =
the
> whole picture, unabridged, and preferably, unobscured.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Atte
Angel Motta Paz
