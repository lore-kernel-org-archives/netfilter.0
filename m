From: "Landon Chelf" <landonc@starrobbins.com>
Subject: RE: Broken ftp through iptables
Date: Tue, 26 Aug 2003 11:42:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c36be8$9b990f70$6901a8c0@Station13>
References: <3F4B7D1A.2010408@nucdc.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4B7D1A.2010408@nucdc.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Thanks but it is loaded from what I can tell.  Below is the iptables
stuff of an lsmod

Module                  Size  Used by    Not tainted
ip_conntrack_ftp        5296   0  (unused)
ip_conntrack           26976   1  [ip_conntrack_ftp]
iptable_filter          2412   1  (autoclean)
ip_tables              15096   1  [iptable_filter]

-----Original Message-----
From: Jamie Pratt [mailto:jamie@nucdc.org] 
Sent: Tuesday, August 26, 2003 11:31 AM
To: Landon Chelf
Subject: Re: Broken ftp through iptables


hi - do you have the ip_conntrack_ftp module loaded on the server? 
(lsmod command will show you all the modules that are currently 
loaded).. - if not, try putting 'insmod ip_conntrack_ftp' in your 
script.. (near the top obviously ;-)

jamie

Landon Chelf wrote:

> Hello,
> 
> I've ran into a recent problem both on rh8 and rh9 using iptables.  
> I've setup my firewall to drop everything incomming and forward and am

> only allowing certain ports to be open.  I've opened ftp (port 21 tcp)

> and I can connect via FTP from one machine and authenticate, but when 
> I issue my first command like "ls" for instance the connection locks 
> up and won't do anything.  Is there a way to fix this?
> 
> Landon
> 
> 
> 
> 



