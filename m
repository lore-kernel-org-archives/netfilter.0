From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: OS Fingerprint
Date: Tue, 18 Nov 2003 16:57:21 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0311181652470.22191@dns.toxicfilms.tv>
References: <Law14-F6682qhpp8eur0000b7c9@hotmail.com> <1069165744.1078.4.camel@valhalla>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069165744.1078.4.camel@valhalla>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>, netfilter@lists.netfilter.org

> Os passive fingerprinting is typically done with ICMP type 8's as well
> as TCP SYN packets. Its possible to do it with SYN/ACKs, but its not
> easy.
Read documentation about xprobe2. It describes the techniques used
by this modular os fingerprinting scanner.

http://www.sys-security.com/html/projects/X.html

The most often used characteristics are explaind in the documentation
of the configuration file of xprobe2.

Including ttl of icmp issued by udp packets sent to closed ports,
invalid checksum in older *bsd, the amount of data echoed back in
icmp errors. Echoing of flags in various headers, etc...


Regards,
Maciej


