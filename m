From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: tcpdump behavior not getting all packets in promisc mode
Date: Mon, 3 Jun 2002 18:22:54 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <005201c20b66$5a516a50$6301a8c0@JJONES1>
References: <20020604011417.39761.qmail@web10408.mail.yahoo.com>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020604011417.39761.qmail@web10408.mail.yahoo.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


> The plug and play reports an intel pro 100, but that
> is likely just the chip that reports the board
> manufacturer is long forgotten by me. I thought it
> rather interesting that Linux never asked for any sort
> of driver for this card during set up? I bought
> another lan card last night (SMC) and plugged it in
> ,but do not have it configured yet

That card uses the EEPRO100 driver, and many Linux installs have that
pre-built into the kernel that the distro is sent out with.

> > 2. Do you have another machine you can plug into the
> > hub to:
> Yes but only one machine is now running linux, does
> microsoft provide a tcpdump type utility? I think I'll
> dump the suse linux and load redhat first?

Go to:  www.ethereal.com   and download that (freeware).  I use it, and
it is essentially what you are looking for in a GUI'ed tcpdump.


John
 


