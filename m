From: Marcel de Boer <marceldb@shark.demon.nl>
Subject: Re: [FTP large file problem]
Date: Fri, 18 Jul 2003 19:24:16 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0307181907020.421@white.shark.demon.nl>
References: <410HgRNvd6128S02.1058536049@uwdvg002.cms.usa.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410HgRNvd6128S02.1058536049@uwdvg002.cms.usa.net>
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
To: netfilter@lists.netfilter.org

Hi!

> > for my home network I have built a Linux-based firewall (based on the
> > slackware-built 2.4.21 kernel). The firewall is working fine, except for
> > large FTP downloads. After 13.68MB (sometimes a bit more, sometimes a bit
> > less, but most of the time 13.68) the connection just hangs. The control
> > channel is still active, because I can abort the download and start it
> > again, but it never gets beyond 14MB.
> Are you explicitly allowing fragments through?  When a packet is fragmented
> only the first fragment contains the TCP/UDP header.  So if you're only
> permitting based on that header the fragments won't make it.

Thanks for the information so far... Explicitly allowing fragments (as the
first rules in the INPUT and FORWARD chains) did not help. To literally
see what was going on, I took out tcpdump and logged the entire session. I
will give a few excerpts here:

(shark.demon.nl is my firewall, jabba.is.kpn.be is ftp.kpn.be, the server
I am downloading from)

# tcpdump -i eth1 host ftp.kpn.be
[...]
18:14:55.472041 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14339921:14341369(1448) ack 1 win 5792 <nop,nop,timestamp 3050708458
199248> (DF) [tos 0x10]
18:14:55.485125 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14341369:14342817(1448) ack 1 win 5792 <nop,nop,timestamp 3050708461
199250> (DF) [tos 0x10]
18:14:55.485821 shark.demon.nl.32786 > jabba.is.kpn.be.26504: . ack
14342817 win 63712 <nop,nop,timestamp 199293 3050708458> (DF)
18:14:55.498137 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14342817:14344265(1448) ack 1 win 5792 <nop,nop,timestamp 3050708461
199250> (DF) [tos 0x10]
18:14:55.512015 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14344265:14345713(1448) ack 1 win 5792 <nop,nop,timestamp 3050708464
199253> (DF) [tos 0x10]
18:14:55.512706 shark.demon.nl.32786 > jabba.is.kpn.be.26504: . ack
14345713 win 63712 <nop,nop,timestamp 199296 3050708461> (DF)

So far so good, everything up to 14345713 is ACKed.

18:14:55.525472 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14345713:14347161(1448) ack 1 win 5792 <nop,nop,timestamp 3050708464
199253> (DF) [tos 0x10]
18:14:55.538628 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14347161:14348609(1448) ack 1 win 5792 <nop,nop,timestamp 3050708466
199256> (DF) [tos 0x10]
18:14:55.539364 shark.demon.nl.32786 > jabba.is.kpn.be.26504: . ack
14345713 win 63712 <nop,nop,timestamp 199299 3050708461,nop,nop,sack sack
1 {14347161:14348609} > (DF)

Here things start changing. Shark keeps on ACKing 14345713. I don't know
enough about TCP to explain the data after the timestamp (,nop,nop,sack
sack 1 etc...)

18:14:55.552399 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14348609:14350057(1448) ack 1 win 5792 <nop,nop,timestamp 3050708466
199256> (DF) [tos 0x10]
18:14:55.553095 shark.demon.nl.32786 > jabba.is.kpn.be.26504: . ack
14345713 win 63712 <nop,nop,timestamp 199300 3050708461,nop,nop,sack sack
1 {14347161:14350057} > (DF)

Same.. [snip a few hundred lines of the same, Jabba does try to send
14345713 again one or two times, but Shark keeps on ACKing this packet,
no matter what Jabba sends]

18:14:56.114154 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14407977:14409425(1448) ack 1 win 5792 <nop,nop,timestamp 3050708536
199325> (DF) [tos 0x10]
18:14:56.114861 shark.demon.nl.32786 > jabba.is.kpn.be.26504: . ack
14345713 win 63712 <nop,nop,timestamp 199356 3050708461,nop,nop,sack sack
1 {14347161:14409425} > (DF)
18:14:56.127605 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14345713:14347161(1448) ack 1 win 5792 <nop,nop,timestamp 3050708556
199345> (DF) [tos 0x10]
18:14:56.716705 jabba.is.kpn.be.26504 > shark.demon.nl.32786: .
14345713:14347161(1448) ack 1 win 5792 <nop,nop,timestamp 3050708623
199356> (DF) [tos 0x10]

It looks as though shark is giving up on ACKing anything, although jabba
keeps on sending... The last two lines repeated a few times until I
stopped tcpdump (the connection hung at that point).

Gtnx
	Marcel

