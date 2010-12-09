From: "Henry E." <henry7849@gmail.com>
Subject: iptable for ssh w/ changed port
Date: Thu, 9 Dec 2010 07:48:16 -0500
Message-ID: <AANLkTinKoUAP4RPDxc7=f9fL7mQnc=Segu8XZPOsJLv2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=ICCuFSLW2gmqo+K1PB1TpJdFB343tIpSdOvJkMXGois=;
        b=Xrjn6ZsH5+WRYtOtYVxbmKOka30lZpTdVz1xFmXJ2TgPc4fHec/qjZee4+DDdn2kJW
         QEMrWi+VgrVwdaowEIBXDMoGsaQFq0tIb3u9tBLhK0YPptvF15vFluxd2IPN+snQfXxP
         fPutUd7f6tiuaoqKw/+stk21cjXP6KYuWqU/c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello.
I've been using the following iptable for ssh changed port on Fedora,
where the pc is not behind a wireless router.
1.=A0 How should this table change if the pc now is behind a router?
2.=A0 Are the lines for dport 500, 5353, 631, 137, 138 necessary?
thanks,
Henry E.
-----------------------------------------------------------------------=
-----------------------------------------------------------------------=
------------
>
> # Firewall configuration written by system-config-firewall
> # Manual customization of this file is not recommended.
> *nat
> :PREROUTING ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> -A PREROUTING -i eth0 -p tcp --dport ### -j DNAT --to-destination ##.=
###.###.###:###
>
> COMMIT
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A INPUT -p icmp -j ACCEPT
> -A INPUT -i lo -j ACCEPT
> -A INPUT -p ah -j ACCEPT
>
> -A INPUT -p esp -j ACCEPT
> -A INPUT -m state --state NEW -m udp -p udp --dport 500 -j ACCEPT
> -A INPUT -m state --state NEW -m udp -p udp --dport 5353 -d 224.0.0.2=
51 -j ACCEPT
> -A INPUT -m state --state NEW -m udp -p udp --dport 631 -j ACCEPT
>
> -A INPUT -m state --state NEW -m udp -p udp --dport 137 -j ACCEPT
> -A INPUT -m state --state NEW -m udp -p udp --dport 138 -j ACCEPT
> -A INPUT -m state --state NEW -m tcp -p tcp --dport ### -j ACCEPT
> -A INPUT -j LOG --log-prefix firewall:
>
> -A INPUT -j REJECT --reject-with icmp-host-prohibited
> COMMIT
