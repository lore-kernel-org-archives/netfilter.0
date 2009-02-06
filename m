From: Don Hoover <dxh@yahoo.com>
Subject: Port forward/bounce no external interface
Date: Fri, 6 Feb 2009 12:00:17 -0800 (PST)
Message-ID: <187458.73719.qm@web65516.mail.ac4.yahoo.com>
Reply-To: dxh@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I want to forward all connections on a port to another box on the same internal network.

For instance, I want to forward all traffic on my server:5000 to go anotherbox:9000

I have little experience with iptables, and I am currently not using it at all on this server, so I will need to setup a small iptables configuration from scratch including any required setup before whatever command is needed to do this.

This will all be in the same network and not actually be going across interfaces...the client, server, and otherbox are all located on the same internal network.

I am sure this is probably easy for someone what really knows what they are doing.... AND...I have been reading as much as I can on this, and all the examples I have found via extensive google searching all deal with the apparently much more common case of forwarding incoming connections on a external facing network interface to a different port for a different IP on an internal facing interface, ala firewall router.  And that just does not apply here.  I kinda thought maybe what I wanted was a variation on that and I tried some different things but none of them worked.

Any help?
