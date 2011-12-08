From: anil dahiya <anildahiya80@gmail.com>
Subject: Re: Sending ICMP echo request out
Date: Fri, 9 Dec 2011 00:00:04 +0530
Message-ID: <CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
References: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-newbie-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=l0iGCfKgqAFQvKscjH4faL2CfkFHpgOCl1TEYIp0iIQ=;
        b=aDmxatgwsW0C0JphEjxV1Eong7OkGH+dB5oGrZnaKbrvaX/9F/bNu47nvebjJaIWM0
         4q8WGw0SUKepEG1U67sA13mmHFHjTgd85Rfv5hzn5GSKp08i5Swl+QkPnV2lTZLdIiU5
         2S5pdJlOtEzUVtT4uFKEpwdZ4A0IgaDMZMNck=
In-Reply-To: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
Sender: linux-newbie-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

Hi ,

I have following setup with routing table as shown below:

+-----------------------+
|=A0=A0=A0 System-1      |
|=A0=A0=A0=A0 "client"=A0=A0=A0      |
|------------------------|
|=A0=A0192.168.11.5=A0=A0=A0|
+----------------------+
=A0=A0=A0=A0=A0=A0 |
=A0=A0=A0=A0=A0=A0 |
+------+-----+
|=A0=A0=A0Switch =A0=A0+----------------------+
+------+-----+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0   |
=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0      |
 =A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0   =A0=
=A0=A0=A0=A0+-------------------------+
=A0=A0=A0=A0=A0=A0 | =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0   =A0=
=A0  |=A0=A0192.168.11.1=A0=A0=A0=A0=A0 |
=A0 =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     |------=
---------------------|
  =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     | =A0 =A0=
 Router =A0 =A0 =A0 =A0    |
=A0 =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     |------=
-------------------- |
=A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0    |=A0=A0=A0192.168.12.1=A0=A0=A0=A0 |
=A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0    +--------------------------+
=A0 =A0 =A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0     =A0 =A0 =A0=A0 =A0  =A0|
 =A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0      =A0=A0   |
+------------------------+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0  |
|=A0=A0192.168.11.6=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0  |
|--------------------------|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=
 |
| =A0 System-2=A0 =A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
  =A0=A0|
|--------------------------| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
|=A0=A0=A0192.168.12.6 =A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0  =
=A0 |
|                         =A0|----------------+
+------------------------+

Routing table details of setup
------------------------------------------
System-1
-----
$route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
192.168.11.0    0.0.0.0         255.255.255.0   U     1      0        0=
 eth1
0.0.0.0         192.168.11.1    0.0.0.0         UG    0      0        0=
 eth1


Router
-----------
$route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
192.168.12.0    0.0.0.0         255.255.255.0   U     0      0        0=
 eth1
192.168.11.0    0.0.0.0         255.255.255.0   U     0      0        0=
 eth0


System-2
------
$route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
192.168.12.0    0.0.0.0         255.255.255.0   U     0      0        0=
 eth1
192.168.11.0    0.0.0.0         255.255.255.0   U     0      0        0=
 eth0
0.0.0.0         192.168.12.1    0.0.0.0         UG    0      0        0=
 eth1


When I do ping from system-1 192.168.11.5 to system-2 192.168.12.6 ,
ping echo packet is reaching on system-2 through NIC 192.168.12.6 but
system is not sending any response to 192.168.11.5 using either of NIC
i.e 192.168.11.6 or 192.168.12.6 ? Why this is happening ? Can you
help me ?

I have observed same type of symtoms when I do SSH from 192.168.11.5
to 192.168.12.6

=46YI,
ip_forwarding is enable on router and iptables are no configured on
any of system .

Thanks,
Anil
--
To unsubscribe from this list: send the line "unsubscribe linux-newbie"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at http://www.linux-learn.org/faqs
