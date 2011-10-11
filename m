From: Jan Sarenik <jasan@x31.com>
Subject: Re: masquerade error
Date: Tue, 11 Oct 2011 15:31:26 +0200
Message-ID: <20111011133126.GA9363@ams1.x31.com>
References: <4E93E9B8.3010005@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4E93E9B8.3010005@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi J!

On Tue, Oct 11, 2011 at 08:01:12AM +0100, J Webster wrote:
> Also, after running the command lines, none of the additions are
> entered into the iptables script.

The commands are not changing any script, only the current in-kernel
tables. To save the changes, use "iptables-save" command, but your
distribution may have a designated mechanism like
"/etc/init.d/iptables save" - you have to find out, or reply with
the name of your distribution.

> [root@vps8259 myscripts]# echo 1>  /proc/sys/net/ipv4/ip_forward
> [root@vps8259 myscripts]# iptables -A FORWARD -m state --state  RELAT=
ED,ESTABLISHED -j ACCEPT
> [root@vps8259 myscripts]# iptables -A FORWARD -s 10.8.0.0/24 -j ACCEP=
T
> [root@vps8259 openvpn]# iptables -A FORWARD -s 172.16.0.0/24 -j ACCEP=
T
> [root@vps8259 openvpn]# iptables -A FORWARD -j REJECT

All the above commands look good.

> [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24=
  -o venet0 -j MASQUERADE
> iptables: Unknown error 4294967295
> [root@vps8259 openvpn]# iptables -t nat -A POSTROUTING -s 10.8.0.0/24=
  -o venet0 -j MASQUERADE
> iptables: Unknown error 4294967295

The problem here may be venet0 interface. As far as I know, there is no
support for "nat" tables on OpenVZ virtual network interfaces.

  Best regards, J=E1n
