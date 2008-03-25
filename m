From: Patrick McHardy <kaber@trash.net>
Subject: Re: IPv6 Redirecting a Port
Date: Tue, 25 Mar 2008 17:11:00 +0100
Message-ID: <47E92414.5000108@trash.net>
References: <B48CB61665A101419E226D4D141D540E03035231A5@mail-server.inside.eclyptic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B48CB61665A101419E226D4D141D540E03035231A5@mail-server.inside.eclyptic.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ryan Kruse <rkruse@alterpoint.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Ryan Kruse wrote:
> 
> We have a network management application that has an embedded TFTP and FTP server.  The application is written in Java and runs as an unprivileged user so we can't bind to the well known ports.  On linux we bind TFTP and FTP to high ports (udp/11069 and tcp/11021).  We then use iptables rules to redirect the incoming low port (udp/69 and tcp/21) connections to the high ports.
> 
> Now that our application supports IPv6 I need to do the same for that.  I know that ip6tables doesn't support NAT (and shouldn't), but I haven't found a way to redirect a port.  Any thoughts on how this can be done?


Routing by fwmark *might* work (add a new "local" table and a rule
pointing to it, mark packets appropriately, bind to ::0). If that
doesn't you'll most likely need a IPv6-capable TPROXY version.
