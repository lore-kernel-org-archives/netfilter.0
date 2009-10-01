From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <gaspar.lajos@whb.hu>
Subject: Re: Mapping multiple interfaces to a single IP address (cont.)
Date: Thu, 01 Oct 2009 18:11:40 +0200
Message-ID: <4AC4D4BC.7020305@whb.hu>
References: <145d4e1a0910010330r216e68cch763b6c7a4b954992@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <145d4e1a0910010330r216e68cch763b6c7a4b954992@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= <javier.galvez.guerrero@gmail.com>
Cc: netfilter@vger.kernel.org

Sorry for the unfinished e-mail... :D

...
So it is all working. But you have to have some routing rules.
These are mine:

Destination     Gateway         Genmask         Flags  Iface
192.168.10.254  0.0.0.0         255.255.255.255 UH  vpn-bia
172.16.1.240    0.0.0.0         255.255.255.255 UH  lan1
172.31.255.248  0.0.0.0         255.255.255.248 U   mfl1
172.16.0.0      0.0.0.0         255.255.254.0   U   br1
0.0.0.0         0.0.0.0         0.0.0.0         U   ppp0


Swifty



