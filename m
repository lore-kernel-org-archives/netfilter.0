From: Dimitri Yioulos <dyioulos@firstbhph.com>
Subject: FTP access from outside
Date: Thu, 5 May 2005 10:29:12 -0400
Message-ID: <200505051029.12757.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, colleagues.

I'm embarassed to ask for help on this (it should be trivial to set up), but 
I'm having no luck:

I'd like to enable FTP access to my web server, which is sitting in a DMZ, 
from outside.  I've add proftpd, and believe I've set it up properly.  I can 
access FTP from my LAN, but not from outside.  I've added the following rules 
to allow access:

-A FORWARD -p tcp -m tcp -d 192.168.1.3 -i eth0 -o eth2 --dport 21 -j ACCEPT
-A PREROUTING -p tcp -m tcp -d 67.x.x.x -i eth0 --dport 21 -j DNAT 
--to-destination 192.168.1.3
-A POSTROUTING -s 192.168.1.3 -o eth0 -j SNAT --to-source 67.x.x.x

where eth0 is public interface and eth2 is DMZ interface

What have I missed (or messed up)?

As always, thanks.

Dimitri

