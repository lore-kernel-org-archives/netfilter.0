From: Jason Opperisano <opie@817west.com>
Subject: Re: DNATing Windows File Sharing
Date: Mon, 18 Jul 2005 17:12:35 -0400
Message-ID: <20050718211235.GA11303@bender.817west.com>
References: <1121674536.1554.16.camel@sadusbox.hostname>
	<Pine.LNX.4.61.0507181120001.14336@yvahk01.tjqt.qr>
	<42DB7B5D.1090506@rfgt.net>
	<Pine.LNX.4.61.0507181308200.15608@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0507181308200.15608@yvahk01.tjqt.qr>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jul 18, 2005 at 01:09:01PM +0200, Jan Engelhardt wrote:
> epmap           135/tcp    # DCE endpoint resolution
> epmap           135/udp    # DCE endpoint resolution
> netbios-ns      137/tcp    # NETBIOS Name Service    
> netbios-ns      137/udp    # NETBIOS Name Service    
> netbios-dgm     138/tcp    # NETBIOS Datagram Service
> netbios-dgm     138/udp    # NETBIOS Datagram Service
> netbios-ssn     139/tcp    # NETBIOS Session Service
> netbios-ssn     139/udp    # NETBIOS Session Service
> microsoft-ds    445/tcp    # Microsoft-DS
> microsoft-ds    445/udp    # Microsoft-DS

quoting a services file like it's an RFC is not a great way to write
firewall rules.  just because a port has been reserved for a service,
doesn't mean it's actually used.  the obvious example here would be
HTTP:

  http             80/tcp    www www-http #World Wide Web HTTP
  http             80/udp    www www-http #World Wide Web HTTP

now, we're not all going to run out and open up UDP port 80 so that our
web servers function, are we?

the safest way to write firewall rules, is by dropping and logging the
traffic or by using tcpdump to discover the ports and protocols one by
one.  that being said, in my experience, the ports used by "windows file
sharing" are:

  TCP 139
  TCP 445
  UDP 137
  UDP 138

that being said, i've also noticed that NAT-ing a windows file server
doesn't always work--depending on your network topology.

-j

--
"Susan Sarandon: I'm Susan Sarandon. Most of you know me as Tim
 Robbins' mother, but actually I'm his wife!"
        --Family Guy

