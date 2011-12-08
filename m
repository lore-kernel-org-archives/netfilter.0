From: canito@dalan.us
Subject: Re: Sending ICMP echo request out
Date: Thu, 08 Dec 2011 12:59:29 -0600
Message-ID: <20111208125929.Horde.Y19BPKiUW7BO4QkRpmIBzhA@mail.dalan.us>
References: <CAGZFCEEux4TBE+JAqzx9CDJ1HGdNXnqQBHBxhJ8TXEQh3Zq7_w@mail.gmail.com>
 <CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHGPgw1bL7XF6Ef29N_YQ-dAW3RYQe7j4-2zuWhFXQddW+Yg_g@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	DelSp=Yes"
To: anil dahiya <anildahiya80@gmail.com>
Cc: linux-newbie <linux-newbie@vger.kernel.org>, Netfilter mailing list <netfilter@vger.kernel.org>, linux-net@vger.kernel.org

=46irst, I am confused as to if this is two separate requests for help,=
 =20
or one request with two separate people using the same e-mail thread?

If you have one router and two physical hosts, run a tcpdump capture =20
on both hosts and look at them using Wireshark. Most likely the =20
firewall is blocking ICMP echo replies if indeed host two is =20
responding to host's one echo request.

Second, why don't you post your iptables rules here which will help =20
people understand what your iptables router is doing?

iptables -Lvn


Quoting anil dahiya <anildahiya80@gmail.com>:

> Hi ,
>
> I have following setup with routing table as shown below:
>
> +-----------------------+
> |=A0=A0=A0 System-1      |
> |=A0=A0=A0=A0 "client"=A0=A0=A0      |
> |------------------------|
> |=A0=A0192.168.11.5=A0=A0=A0|
> +----------------------+
> =A0=A0=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0 |
> +------+-----+
> |=A0=A0=A0Switch =A0=A0+----------------------+
> +------+-----+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0   |
> =A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0      |
>  =A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0   =A0=
=A0=A0=A0=A0+-------------------------+
> =A0=A0=A0=A0=A0=A0 | =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0  =
 =A0=A0  |=A0=A0192.168.11.1=A0=A0=A0=A0=A0 |
> =A0 =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     |----=
-----------------------|
>   =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     | =A0 =A0=
 Router =A0 =A0 =A0 =A0    |
> =A0 =A0 =A0=A0=A0|=A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0     |----=
---------------------- |
> =A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0    |=A0=A0=A0192.168.12.1=A0=A0=A0=A0 |
> =A0=A0=A0=A0=A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0    +--------------------------+
> =A0 =A0 =A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0     =A0 =A0 =A0=A0 =A0  =A0|
>  =A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0      =A0=A0   |
> +------------------------+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
 |
> |=A0=A0192.168.11.6=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0  |
> |--------------------------|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0=A0=
 |
> | =A0 System-2=A0 =A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
  =A0=A0|
> |--------------------------| =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|
> |=A0=A0=A0192.168.12.6 =A0=A0=A0|=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
  =A0 |
> |                         =A0|----------------+
> +------------------------+
>
> Routing table details of setup
> ------------------------------------------
> System-1
> -----
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.11.0    0.0.0.0         255.255.255.0   U     1      0       =
 0 eth1
> 0.0.0.0         192.168.11.1    0.0.0.0         UG    0      0       =
 0 eth1
>
>
> Router
> -----------
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.12.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth1
> 192.168.11.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth0
>
>
> System-2
> ------
> $route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    U=
se Iface
> 192.168.12.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth1
> 192.168.11.0    0.0.0.0         255.255.255.0   U     0      0       =
 0 eth0
> 0.0.0.0         192.168.12.1    0.0.0.0         UG    0      0       =
 0 eth1
>
>
> When I do ping from system-1 192.168.11.5 to system-2 192.168.12.6 ,
> ping echo packet is reaching on system-2 through NIC 192.168.12.6 but
> system is not sending any response to 192.168.11.5 using either of NI=
C
> i.e 192.168.11.6 or 192.168.12.6 ? Why this is happening ? Can you
> help me ?
>
> I have observed same type of symtoms when I do SSH from 192.168.11.5
> to 192.168.12.6
>
> FYI,
> ip_forwarding is enable on router and iptables are no configured on
> any of system .
>
> Thanks,
> Anil
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


