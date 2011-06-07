From: Fiedler Roman <Roman.Fiedler@ait.ac.at>
Subject: AW: ipv6 link local address
Date: Tue, 7 Jun 2011 11:35:20 +0200
Message-ID: <9F69795E29C890408AC2DAF646C89BB379BDC52738@MAILBOX.arc.local>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
 <1307429067.7853.1.camel@hakkenden> <4DEDCE11.3090004@arpa.org>
 <alpine.LNX.2.01.1106071102460.25037@frira.zrqbmnf.qr>
 <4DEDEE6B.9000303@arpa.org>
 <alpine.LNX.2.01.1106071120390.25037@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106071120390.25037@frira.zrqbmnf.qr>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>, Erik Schorr <erik-lists@arpa.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

> On Tuesday 2011-06-07 11:24, Erik Schorr wrote:
...
> >It's impossible to unload the ipv6 module when there's even one
> >interface with ipv6 functionality enabled, even when the interface
> >is administratively disabled/shutdown.
> 
> Because it hooks so deep down into the system, that is only expected.

I think, I have ipv6 compiled into kernel, not module. But

      echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6

removes all ipv6 addresses from all devices and seems to disable ipv6.
