From: =?UTF-8?B?Vmluw61jaXVzIE1hc3N1Y2hldHRv?= <viniciusandre@gmail.com>
Subject: Re: Sharing ppp connection with wlan interface
Date: Sun, 20 Sep 2009 19:19:37 -0300
Message-ID: <4AB6AA79.3090302@gmail.com>
References: <4AB6A1EE.1040201@gmail.com> <4AB6A375.2070801@standarduniversal.com.au>
Reply-To: viniciusandre@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=FzGHd16TEQgWQ++ZhN5XjkDpb+OqWnnlAikpG/x07iY=;
        b=meyjRjgzwF12koNZY+j6uW5N/jhi62zRUQZQYKZSjdmZTL/SjRFyVpdoXJ6EM7gCa8
         bxtGJc1gZclhWLwtP3qNb+v8cr3fGMp2jvnSSDpMB1N2Te3S9ZJPd2LMnNPV0vUTLfUe
         M9DjEMPBMKXq0kZoudX6wYsfLiS6yGUJ7sGeo=
In-Reply-To: <4AB6A375.2070801@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Brian Austin - Standard Universal <brian@standarduniversal.com.au>, netfilter@vger.kernel.org

Thanks for helping.

This tutorial says to pass ppp0 as the argument to -o.
http://wiki.archlinux.org/index.php/Sharing_ppp_connection_with_wlan_in=
terface

Anyway, here's the syslog output for your=20
correction on the routing computer.

vinicius:/home/vinicius# tail -f /var/log/syslog
Sep 20 19:04:06 vinicius kernel: [ 5818.151404]=20
wlan0: Selected IBSS BSSID 0e:e6:ed:86:81:f0 based=20
on configured SSID
Sep 20 19:04:07 vinicius dnsmasq[6760]: exiting on=20
receipt of SIGTERM
Sep 20 19:04:07 vinicius dnsmasq[6796]: started,=20
version 2.50 cachesize 150
Sep 20 19:04:07 vinicius dnsmasq[6796]: compile=20
time options: IPv6 GNU-getopt DBus I18N DHCP TFTP
Sep 20 19:04:07 vinicius dnsmasq-dhcp[6796]: DHCP,=20
IP range 192.168.0.1 -- 192.169.0.100, lease time 12h
Sep 20 19:04:07 vinicius dnsmasq[6796]: reading=20
/etc/resolv.conf
Sep 20 19:04:07 vinicius dnsmasq[6796]: using=20
nameserver 201.10.128.2#53
Sep 20 19:04:07 vinicius dnsmasq[6796]: using=20
nameserver 201.10.120.2#53
Sep 20 19:04:07 vinicius dnsmasq[6796]: read=20
/etc/hosts - 7 addresses
Sep 20 19:04:36 vinicius kernel: [ 5848.153079]=20
wlan0: No active IBSS STAs - trying to scan for=20
other IBSS networks with same SSID (merge)
Sep 20 19:04:39 vinicius kernel: [ 5850.890322]=20
wlan0: Selected IBSS BSSID 66:fb:fa:09:25:ca based=20
on configured SSID
Sep 20 19:05:09 vinicius kernel: [ 5880.892160]=20
wlan0: No active IBSS STAs - trying to scan for=20
other IBSS networks with same SSID (merge)
Sep 20 19:05:12 vinicius kernel: [ 5883.608162]=20
wlan0: Selected IBSS BSSID 0e:e6:ed:86:81:f0 based=20
on configured SSID
Sep 20 19:05:42 vinicius kernel: [ 5913.612171]=20
wlan0: No active IBSS STAs - trying to scan for=20
other IBSS networks with same SSID (merge)

[snipped the repetitive rest]

Vinicius

Brian Austin - Standard Universal escreveu:
> no expert, but i think you masq the wrong conx?
>=20
> iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
>=20
> also
>=20
> tail -f /var/log/syslog on the routing pc and see what dhcp is saying=
=2E
>=20
>=20
>=20
> Vin=C3=ADcius Massuchetto wrote:
>> Dear all.
>>
>> I'm on Debian Sid, and I've been trying to serve a ppp0 internet=20
>> connection through a wireless network. I made a small script to be r=
an=20
>> when i want to do that:
>>
>> ifdown wlan0
>> iwconfig wlan0 essid "VinaNET" mode Ad-Hoc
>> ifconfig wlan0 192.168.0.254
>> echo 1 > /proc/sys/net/ipv4/ip_forward
>> /etc/init.d/dnsmasq stop
>> /etc/init.d/dnsmasq start
>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>
>> The script goes just fine and the client computer can see the wirele=
ss=20
>> network but can't connect, it only keeps trying:
>>
>> DHCPDISCOVER on ath0 to 255.255.255.255 port 67 interval x
>>
>> Here's my dnsmasq.conf file:
>>
>> domain-needed
>> bogus-priv
>> interface=3Dwlan0
>> dhcp-range=3D192.168.0.1,192.169.0.100,12h
>>
>> I'm not quite sure if that's an iptables or a dnsmasq problem.
>>
>> Thanks!
>> --=20
>> Vin=C3=ADcius Massuchetto
>> http://vinicius.soylocoporti.org.br
>> --=20
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
