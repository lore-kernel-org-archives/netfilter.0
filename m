From: "Travis Crook" <travis@visionsbeyond.com>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 17:08:57 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <000401c2279d$a6591580$6702a8c0@mindtrip.com>
References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com> <200207091808.g69I8R810149@vulcan.rissington.net> <1026239145.804.56.camel@tux> <20020709193231.DGDB19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

> I agree with several people here that Travis should check the hardware
first,
> and I would also recommend testing the bandwidth by doing several
downloads
> simultaneously from sites with high-bandwidth links, as close (in hops) to
> his machine as possible.
>
> Antony.

I checked the hardware.  Everything is running 100baseTx-FD (100 mb full
duplex).  I used several different workstations and found the problem.  If I
test with a Windows 98 box I get 500Kb.  If I test with a Windows 2000 box I
get 1Mb, if I test with a Linux box I get 3.5Mb.  Windows must have some
kind of internet throttling.

Yet another reason to use Linux.

Thanks Everyone for your help!

Travis Crook
Visions Beyond


