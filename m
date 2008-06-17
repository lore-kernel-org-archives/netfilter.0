From: "=?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?=" 
	<javier.galvez.guerrero@gmail.com>
Subject: Duplicating multicast packets with -j ROUTE --tee
Date: Tue, 17 Jun 2008 11:40:17 +0200
Message-ID: <145d4e1a0806170240p581a1d60gd051cb83ebe63a06@mail.gmail.com>
References: <145d4e1a0806170237n14271024p50176f5f5b9611bf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=RUdC/SGUkj/dctUHBmQxUTNgL0avyXLHtsH9wRmRGoo=;
        b=lLwaBLN/T1DwAeXndKmw/v/mBuihcM0pIRbk8pOSHWwUOVrIe8pFZTIjYJ0EFuAXI7
         MZBWRuks82GEeFgf1Co5BjJQKgUoRrK8oi3T1PDqhLakzCveI84AHnGw8C82JKHlC9pM
         HOxZ2qLUxYIxE8sgpzJkWVTw+GZJkbTEJweNM=
In-Reply-To: <145d4e1a0806170237n14271024p50176f5f5b9611bf@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everyone,

I'm a complete newbie with iptables. I've read some tutorials from
netfilters.org in order to have a look about how to proceed. I'm
generating a multicast flow and, in order to take some research
results, I would like to duplicate the packets in the source computer
through the ethernet interface.

I'm working in a Debian machine with kernel 2.6.18-6-686 and iptables
version 1.3.6. I have done some research with google and, eventually,
I've tried this:

   # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE
--tee --oif eth0

but I obtain:

   iptables: No chain/target/match by that name

Besides that, if I try the same without specifying what ROUTE should do:

   # iptables -t mangle -A OUTPUT -d 239.255.1.0/24 -o eth0 -j ROUTE

I get:

   iptables v1.3.6: ROUTE target: oif, iif or gw option required
   Try `iptables -h' or 'iptables --help' for more information.

Then, I think that the ROUTE target is included in the kernel, so I
suppose there's no need to apply a patch and recompile the kernel but
I don't know what to do in order to succeed in this.


Anyway, I would like to get some help for more experienced users or
anyone who has dealed with this issue. Any help would be much
appreciated.


Thank you all,
Javi
