From: Tom Eastep <teastep@shorewall.net>
Subject: Re: IP address to MAC address
Date: Tue, 11 Jun 2002 14:27:15 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206111418380.4051-100000@wookie.shorewall.net>
References: <200206112109.g5BL9xA22717@Networker.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206112109.g5BL9xA22717@Networker.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Tue, 11 Jun 2002, Antony Stone wrote:

> 
> Well, on my system at least (Slackware 8.0), /proc/net/arp has permissions 
> -r--r--r-- so anyone can read it.   The arp program is in /sbin, so it can 
> only be run by root.
> 

Are you saying that Slack secures /sbin against access by non-root users 
or the files there from being executed by non-root users? Not so on 
RedHat:


[teastep@wookie Shorewall]$ /sbin/arp -na
? (192.168.1.5) at 00:A0:CC:DB:31:C4 [ether] on eth0
? (192.168.1.254) at 02:00:08:E3:4C:48 [ether] on eth0
[teastep@wookie Shorewall]$

Note that /sbin isn't in non-root's PATH so by default an absolute path
name must be used. But:

[teastep@wookie Shorewall]$ PATH=$PATH:/sbin
[teastep@wookie Shorewall]$ arp -na
? (192.168.1.5) at 00:A0:CC:DB:31:C4 [ether] on eth0
? (192.168.1.254) at 02:00:08:E3:4C:48 [ether] on eth0
[teastep@wookie Shorewall]$


-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


