From: fuzzy_4711 <fuzzy_4711@gmx.de>
Subject: Re: Gateway With Multiple Internal Networks
Date: Fri, 14 Oct 2011 18:21:33 +0200
Message-ID: <4E98618D.2040509@gmx.de>
References: <CAEH2fGyA9+sXV6toN9f7azg0emBnrTtsE-Q_CdJ_KfQ1bSe5dQ@mail.gmail.com>
Reply-To: fuzzy_4711@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAEH2fGyA9+sXV6toN9f7azg0emBnrTtsE-Q_CdJ_KfQ1bSe5dQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org



-------- Original - Text --------

> This is driving me crazy, and I cannot seem to get it working
> properly.  I have a gateway with two internal networks served by
> different interfaces:
> 
> eth0 - External interface
> eth1 - Internal network #1
> eth2 - Internal network #2
> tun0 - OpenVPN server interface
> 

Being root@gateway, please provide the output of:
ip route show table all
ip maddress show
ip address show

Could you try to find where the packages are being dropped by using
wireshark, if the error occurs?

Thanks.
-fuz
