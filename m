From: "per j" <perj8@hotmail.com>
Subject: RE: Blocking downloads (rough solution)
Date: Wed, 05 Feb 2003 16:31:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F153vVQ9WF5knBLq1f300005318@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

The solution can't be done in Netfilter, but would only be an estimate of 
what you want.  Use -m limit to limit the rate of packets.

For example, you have to adjust the numbers, to reduce bandwidth of large 
downloads for all ports:
-j ACCEPT -m limit --limit 600/minute
-j ACCEPT -m limit --limit 5/sec
-j REJECT

You're asking more than what Netfilter is supposed to be used for.

Try Squid's delay pools.

Or try the WRR patch for IProute2's tc tool which has more sophisticated 
delay pools.
Or just split up the bandwidth with the built-in HTB qdisc in IPRoute2.

>What I want is that clients cannot, let's say with Internet Explorer or
>Mozzila, download files from the internet, but can browse the internet.
>
>
>-----Original Message-----
>From: Khanh Tran [mailto:khanh@slc.edu]
>Sent: woensdag 5 februari 2003 16:45
>To: 'ASC - Ronald Roeleveld'; 'netfilter@lists.netfilter.org'
>Subject: RE: Blocking downloads
>
>
>You can very easily block certain clients based on either MAC address 
>and/or
>IP address.  As for the ports, well that depends on the application you 
>want
>to block (ie. FTP, Kazaa, web, NNTP, etc).
>
>Khanh Tran
>Network Operations
>Sarah Lawrence College
>
>
>
>-----Original Message-----
>From: ASC - Ronald Roeleveld [mailto:r.roeleveld@ascinternational.nl]
>Sent: Wednesday, February 05, 2003 10:38 AM
>To: 'netfilter@lists.netfilter.org'
>Subject: Blocking downloads
>
>
>Hey everyone,
>
>Since I want to spare my download speed, and dont want clients to download
>freaking warez, would it be possible to block downloads with iptables for
>certain clients???
>And if it's possible which ports need to closed?
>
>Thanks in advance,
>Ronald Roeleveld
>System Administrator
>
>ASCINTERNATIONAL
>Vlietweg 17c, 2266 KA, Leidschendam, The Netherlands
>Tel. +31 (0)70 3178400, Fax +31 (0)70 3204760
>E-mail: r.roeleveld@ascinternational.nl
><mailto:r.roeleveld@ascinternational.nl> , Website:
>http://www.ascinternational.nl <http://www.ascinternational.nl/>
>
>
>


_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*.  
http://join.msn.com/?page=features/virus


