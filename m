From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 14:42:39 -0500
Message-ID: <481385AF.2020309@riverviewtech.net>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com> <alpine.LNX.1.10.0804262016000.20150@fbirervta.pbzchgretzou.qr> <48138190.8030305@riverviewtech.net> <alpine.LNX.1.10.0804262127180.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804262127180.20150@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/26/2008 2:29 PM, Jan Engelhardt wrote:
> It is the same -- the dynamic system runs a custom script in ifup 
> that notifies the static one. Can be portknocking, or a http, or a 
> netcat.

Presuming that the dynamic system is a Linux box, sure.  However there 
are a LOT of devices that can utilize dynamic DNS that do not have the 
capability (through the provided interface(s)) to make those types of 
changes.

> So why not just set up an ipsec tunnel... :^)

Not everything can do an IPSec tunnel, nor will all devices in between 
play well with IPSec tunnels.  We don't know enough about the endpoints 
and / or what is in between to know if any thing like this will work. 
If this will work, this may indeed be better.



Grant. . . .
