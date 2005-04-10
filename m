From: seberino@spawar.navy.mil
Subject: Re: not sure ESTABLISHED TCP traffic will have ACK flag setalways...
Date: Sat, 9 Apr 2005 20:54:03 -0700
Message-ID: <20050410035403.GA20178@spawar.navy.mil>
References: <1112975844.3544.94.camel@seberino.spawar.navy.mil>
	<20050408205224.GA15635@vetz.homelinux.org>
	<006901c53c7e$2ead1c90$f5001eac@riverview.office>
	<20050409062431.GA17505@spawar.navy.mil>
	<42582017.5030402@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42582017.5030402@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

> The only really questionable flag is the RST where some TCP/IP stacks will
> send packets with the RST flag set if they mistakenly receive a packet that
> was not destined to them.  This is i
> mplementation dependent and not clearly defined in RFCs and thus a matter
> of some confusion.

I haven't read this in RFC 793 myself.  However, I've read other
docs /about/ RFC 793 that state that RFC 793 mandates closed
ports *must* send an RST in response to packets.  This is the
basis for at least some of stealth scans like FIN, Xmas and NULL
IIRC.

It is true that different stacks don't follow the RFC in this area.
MS Windows does not do the proper thing in this area.  This
is why the /absense/ of the RST from a closed port is one way
to do OS fingerprinting!  If every OS followed the RFC in this
area there would not be so much confusion if I understand things
correctly.

Cheers,

Chris

