From: bertrand <joel.bertrand@systella.fr>
Subject: Re: [sparc specific bug =?UTF-8?Q?=3F=5D=20Iptables=2C=20iproute?=
 =?UTF-8?Q?=32=20and=20mark?=
Date: Tue, 22 Mar 2011 11:19:27 +0100
Message-ID: <0d3d1b1eff61626ea7590dbff592e7d7@systella.fr>
References: <4D87D16B.8050005@systella.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D87D16B.8050005@systella.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

 Very strange. I have removed SYSFS_DEPRECATED_V2 to avoid an udev bug 
 that didn't create /dev/sd[ab] (but /dev/sd[c-h]) and netfilter runs 
 fine...

 Regards,

 JB

