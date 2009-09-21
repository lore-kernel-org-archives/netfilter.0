From: =?UTF-8?B?Vmluw61jaXVzIE1hc3N1Y2hldHRv?= <viniciusandre@gmail.com>
Subject: Re: Sharing ppp connection with wlan interface
Date: Sun, 20 Sep 2009 23:58:38 -0300
Message-ID: <4AB6EBDE.4090603@gmail.com>
References: <4AB6A1EE.1040201@gmail.com> <4AB6A375.2070801@standarduniversal.com.au> <4AB6AA79.3090302@gmail.com> <4AB6B3EE.4050100@standarduniversal.com.au>
Reply-To: viniciusandre@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:reply-to
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=HC2drR3KfCT9WlKIe/a1ZrFfRuHtutbayJBelgW0LPE=;
        b=Er/x7YPX5cvQkDOe2n9jH9a8pZMirb1EBXAH/pXtinOl1teq4DMHa743c6sWqBOE5u
         YGeSgw2PV5aqVCOuEbS+vLqv/H+BjidfHU+Ip2OF0qoY8iZK3PtVq9tAyEl7SQ6w4+z8
         ExkGgArLaOxyzBj2xAfEcWqsindj1WwzfU/7s=
In-Reply-To: <4AB6B3EE.4050100@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I don't know.

What exactly this means?
Sep 20 19:04:36 vinicius kernel: [ 5848.153079]=20
wlan0: No active IBSS STAs - trying to scan for=20
other IBSS networks with same SSID (merge)
Sep 20 19:04:39 vinicius kernel: [ 5850.890322]=20
wlan0: Selected IBSS BSSID 66:fb:fa:09:25:ca based=20
on configured SSID

Vinicius

Brian Austin - Standardknit escreveu:
> looks like dns server not getting the requests from client?
>=20
>=20
>=20
> -----Original Message -----
> From: Vin=C3=ADcius Massuchetto
> Sent: 21/09/2009 8:19 AM
>> Thanks for helping.
>>
>> This tutorial says to pass ppp0 as the argument to -o.
>> http://wiki.archlinux.org/index.php/Sharing_ppp_connection_with_wlan=
_interface=20
>>
>>
>> Anyway, here's the syslog output for your correction on the routing=20
>> computer.
>>
>> vinicius:/home/vinicius# tail -f /var/log/syslog
>> Sep 20 19:04:06 vinicius kernel: [ 5818.151404] wlan0: Selected IBSS=
=20
>> BSSID 0e:e6:ed:86:81:f0 based on configured SSID
>> Sep 20 19:04:07 vinicius dnsmasq[6760]: exiting on receipt of SIGTER=
M
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: started, version 2.50=20
>> cachesize 150
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: compile time options: IPv6=20
>> GNU-getopt DBus I18N DHCP TFTP
>> Sep 20 19:04:07 vinicius dnsmasq-dhcp[6796]: DHCP, IP range=20
>> 192.168.0.1 -- 192.169.0.100, lease time 12h
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: reading /etc/resolv.conf
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: using nameserver 201.10.128.=
2#53
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: using nameserver 201.10.120.=
2#53
>> Sep 20 19:04:07 vinicius dnsmasq[6796]: read /etc/hosts - 7 addresse=
s
>> Sep 20 19:04:36 vinicius kernel: [ 5848.153079] wlan0: No active IBS=
S=20
>> STAs - trying to scan for other IBSS networks with same SSID (merge)
>> Sep 20 19:04:39 vinicius kernel: [ 5850.890322] wlan0: Selected IBSS=
=20
>> BSSID 66:fb:fa:09:25:ca based on configured SSID
>> Sep 20 19:05:09 vinicius kernel: [ 5880.892160] wlan0: No active IBS=
S=20
>> STAs - trying to scan for other IBSS networks with same SSID (merge)
>> Sep 20 19:05:12 vinicius kernel: [ 5883.608162] wlan0: Selected IBSS=
=20
>> BSSID 0e:e6:ed:86:81:f0 based on configured SSID
>> Sep 20 19:05:42 vinicius kernel: [ 5913.612171] wlan0: No active IBS=
S=20
>> STAs - trying to scan for other IBSS networks with same SSID (merge)
>>
>> [snipped the repetitive rest]
>>
>> Vinicius
>>
>> Brian Austin - Standard Universal escreveu:
>>> no expert, but i think you masq the wrong conx?
>>>
>>> iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
>>>
>>> also
>>>
>>> tail -f /var/log/syslog on the routing pc and see what dhcp is sayi=
ng.
>>>
>>>
>>>
>>> Vin=C3=ADcius Massuchetto wrote:
>>>> Dear all.
>>>>
>>>> I'm on Debian Sid, and I've been trying to serve a ppp0 internet=20
>>>> connection through a wireless network. I made a small script to be=
=20
>>>> ran when i want to do that:
>>>>
>>>> ifdown wlan0
>>>> iwconfig wlan0 essid "VinaNET" mode Ad-Hoc
>>>> ifconfig wlan0 192.168.0.254
>>>> echo 1 > /proc/sys/net/ipv4/ip_forward
>>>> /etc/init.d/dnsmasq stop
>>>> /etc/init.d/dnsmasq start
>>>> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>>>>
>>>> The script goes just fine and the client computer can see the=20
>>>> wireless network but can't connect, it only keeps trying:
>>>>
>>>> DHCPDISCOVER on ath0 to 255.255.255.255 port 67 interval x
>>>>
>>>> Here's my dnsmasq.conf file:
>>>>
>>>> domain-needed
>>>> bogus-priv
>>>> interface=3Dwlan0
>>>> dhcp-range=3D192.168.0.1,192.169.0.100,12h
>>>>
>>>> I'm not quite sure if that's an iptables or a dnsmasq problem.
>>>>
>>>> Thanks!
>>>> --=20
>>>> Vin=C3=ADcius Massuchetto
>>>> http://vinicius.soylocoporti.org.br
>>>> --=20
>>>> To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>>>> the body of a message to majordomo@vger.kernel.org
>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
