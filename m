From: Bill Shirley <bill@philly.polymerindustries.biz>
Subject: ipsec using mark on kernel 3.13.5-101.fc19.x86_64 is broken
Date: Tue, 25 Mar 2014 00:56:47 -0400
Message-ID: <53310C8F.8070106@philly.polymerindustries.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This may be difficult to describe, but here goes:

I have set up an ipsec tunnel between Server-A and Server-B using public IP addresses and configured the ip xfrm state 
and ip xfrm policy database to use marks.  This works correctly if both servers are not using a newer kernel.  I have 
this working with (1st setup) :
Server-A kernel 3.6.9-2.fc17.x86_64 <-> Server-B kernel 3.6.3-1.fc17.x86_64 (no marks this side)
also:
Server-A kernel 3.6.9-2.fc17.x86_64 <-> Server-B kernel 3.4.2-1.fc16.x86_64

However, this setup doesn't work completely with this setup (2nd setup) :
Server-A kernel 3.4.2-1.fc16.x86_64 <-> Server-B kernel 3.13.5-101.fc19.x86_64
nor with:
Server-A kernel 2.6.33.7-server-2mnb (Mandriva 2010, no marks this side) <-> Server-B kernel 3.12.11-201.fc19.x86_64

Keep in mind that this is a TUNNEL ipsec using MARKS (mark 12032/0xff00).  On the 2nd setup, all traffic flows for:
PC-A <-> Server-A <-> Server-B <-> PC-B
PC-A <-> Server-A <-> Server-B
                   Server-A <-> Server-B <-> PC-B

Actual values (10.0.0.0/8 and 192.168.64.0/23 (yes, /23)):
10.96.0.8 = PC-A
10.96.0.9 = Server-A
192.168.64.1 = Server-B
192.168.65.137 = PC-B

However, SSH doesn't work for (either direction):
Server-A <-> Server-B

These do work:
ping
dig axfr
telnet imap
links http://

I get incomplete response (takes a long time):
from Server-B: smbclient -L 10.96.0.9

However this works swiftly:
from Server-A: smbclient -L 192.168.64.1

Something about ipsec in the OUTPUT chain on newer kernels is broken.  In the Server-A mangle table I can put a dummy 
mark (outside the xfrm mask, of course) on outgoing SSH traffic and ESP traffic and observe that the ssh daemon on the 
3.13.5 kernel DOES respond to all packets but not all packets are encrypted (-p esp).

Anyone else using marks for an ipsec tunnel on the newer kernels? How do I fix this?  Wrong list?

Bill Shirley

