From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT only - No connection tracking
Date: Mon, 11 Nov 2002 20:05:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021111200541.IDEJ3711.mta02-svc.ntlworld.com@there>
References: <00f701c28970$f3587bc0$0bc8c80a@dolphin> <200211111106.gABB6ue27802@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211111106.gABB6ue27802@vulcan.rissington.net>
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
To: "netfilter@lists" <netfilter@lists.netfilter.org>

On Monday 11 November 2002 11:06 am, Antony Stone wrote:

> On Monday 11 November 2002 10:56 am, yenjet.chan@eglobal.com.my wrote:
> > Hi all,
> >
> > How can I make my iptable to do just NAT, no connection tracking?
>
> Yes - just don't compile connection tracking support in, and don't try to
> use the -m state match.

I was wrong.   I forgot that when you compile the kernel, the netfilter 
options start with "Connection tracking (required for NAT) ?"

Therefore you are correct, you cannot do NAT without connection tracking.

Sorry for the misleading (nay, incorrect !) advice earlier....

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

