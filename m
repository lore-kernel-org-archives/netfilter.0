From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd not replicating NATted FTP connection properly?
Date: Tue, 13 Jul 2010 12:39:49 +0200
Message-ID: <4C3C4275.2060108@netfilter.org>
References: <4C3B2958.20708@cyberscience.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C3B2958.20708@cyberscience.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Adam Gundy <arg@cyberscience.com>
Cc: netfilter@vger.kernel.org

On 12/07/10 16:40, Adam Gundy wrote:
> I've set up a pair of redundant routers using keepalived and conntrackd.
> Part of their job is to handle routing to an FTP server in a NATted DMZ.
> 
> both servers are running Ubuntu Lucid, but for other reasons I've switched
> to a stock 2.6.33.5 kernel. I've also tried building the 0.9.14 version of
> conntrack to see if it fixed the problem (lucid ships with 0.9.13).
> 
> this works great, except that an existing FTP connection gets 'broken' when
> the master flips to the other machine. the data connection is fine, but the
> control connection seems to have broken sequence numbers - the leading four
> (or eight) bytes in the next packet sent is ignored. (example packet trace
> available off list).
> 
> looking at the conntrack source code, it seems to suggest that the NAT
> 'sequence offset' should be replicated... but it clearly isn't being?
> 
> am I supposed to match a particular version of conntrackd to the kernel?
> 
> is NATted FTP not supported by conntrackd?

Yes, it should work but some bugs were in the middle of the road. You'll
need these two patches for the conntrack-tools and the library
libnetfilter_conntrack:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=conntrack-tools.git;a=commit;h=1f3c6df4f8984fce347718cca09dd0e2fa138ce1

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnetfilter_conntrack.git;a=commit;h=e387e4f81f067cdaca4bb632d4028f794fc4c14b

I have tested this scenario with the following rule-set:

-A PREROUTING -d 192.168.1.100 -p tcp -m tcp --dport 9999 -j DNAT
--to-destination 192.168.1.2:21

The module nf_nat_ftp is also required, of course. I was using a linux
kernel 2.6.32.2 in my firewalls and snapshots of the current
libnetfilter_conntrack and the conntrack-tools from git.netfilter.org

These patches will be included in the upcoming release of
libnetfilter_conntrack and conntrack-tools 0.9.15 (to appear soon).

I'd appreciate if you can also test it in your firewall cluster and ACK
this. Thanks for the bug reporting.
