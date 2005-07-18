From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 13:09:01 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507181308200.15608@yvahk01.tjqt.qr>
References: <1121674536.1554.16.camel@sadusbox.hostname>
	<Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
	<42DB7B5D.1090506@rfgt.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DB7B5D.1090506@rfgt.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Vangel <vangelr@rfgt.net>
Cc: netfilter@lists.netfilter.org


>All of the ports for windows file sharing you want to call it are..
>
>135/tcp, 137/udp, 138/tcp, 139/udp, 139/tcp, 445/tcp
>
>Some of them are for RPC things so you might not actually want them
>open, but I don't know which specific one(s) they are.

epmap           135/tcp    # DCE endpoint resolution
epmap           135/udp    # DCE endpoint resolution
netbios-ns      137/tcp    # NETBIOS Name Service    
netbios-ns      137/udp    # NETBIOS Name Service    
netbios-dgm     138/tcp    # NETBIOS Datagram Service
netbios-dgm     138/udp    # NETBIOS Datagram Service
netbios-ssn     139/tcp    # NETBIOS Session Service
netbios-ssn     139/udp    # NETBIOS Session Service
microsoft-ds    445/tcp    # Microsoft-DS
microsoft-ds    445/udp    # Microsoft-DS

I have never seen epmap on my network, so 135 does not belong to it. 138 
traffic is also rare.


Jan Engelhardt
-- 

