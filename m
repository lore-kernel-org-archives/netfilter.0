From: Ryan Kruse <rkruse@alterpoint.com>
Subject: IPv6 Redirecting a Port
Date: Tue, 25 Mar 2008 10:56:24 -0500
Message-ID: <B48CB61665A101419E226D4D141D540E03035231A5@mail-server.inside.eclyptic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>



We have a network management application that has an embedded TFTP and FTP server.  The application is written in Java and runs as an unprivileged user so we can't bind to the well known ports.  On linux we bind TFTP and FTP to high ports (udp/11069 and tcp/11021).  We then use iptables rules to redirect the incoming low port (udp/69 and tcp/21) connections to the high ports.

Now that our application supports IPv6 I need to do the same for that.  I know that ip6tables doesn't support NAT (and shouldn't), but I haven't found a way to redirect a port.  Any thoughts on how this can be done?

Thanks much,

Ryan Kruse
www.ziptie.org


