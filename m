From: Mike Boyer <netfilter@netcare-il.com>
Subject: PPTP through NAT fails
Date: Tue, 11 Feb 2014 14:06:12 -0600
Message-ID: <52FA82B4.7010806@netcare-il.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

LAN -> Linux Router -> Internet -> PPTP Server
           NAT

192.168.90.1 -> Linux Router -> Public IP -> Internet -> PPTP Server
                     NAT

Kernel: 2.4.34
Iptables: 1.4.12.1
Chain: INPUT ACCEPT
Chain: OUTPUT ACCEPT
Chain: FORWARD ACCEPT

Problem: PPTP connections fail to certain PPTP servers but only when 
being NAT'ed

Using the stock windows xp vpn client I can connect to a windows SBS 
2003 server using the PPTP vpn connection whether using a private IP
that is being NAT'ed or a public IP.  However tring to connect to a 
Nortel PPTP server fails when using a private IP that is NAT'ed at the 
LINUX router.  For kicks I've thrown in an off the shelf router that is 
NATing its traffic and it works OK connecting to the SBS Server or the 
Nortel PPTP server.  Based on the above tests I assume something is 
happening during the NATing process that in some way causes the Nortel 
PPTP server (and several others) not to make a successful connection.

Looking out on the forums I see a lot of people referencing trying to 
tunnel back inside the NAT gateway but not any posts saying they were 
unable to connect from the private side to the public side.

I've seen references to a PPTP_NAT helper module but once again this 
appeared to be from going from the outside in not the other way round.

I'm really just looking for a best direction to try next in the trouble 
shooting process or fishing for someone who has had a similar issue and 
says "Oh yea I had that problem you have to do this".

Any suggestions would be greatly appreciated.  If more information is 
required just let me know and I'll provide it.  Thanks!

--Mike
