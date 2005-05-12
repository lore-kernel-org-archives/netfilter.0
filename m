From: Jason Opperisano <opie@817west.com>
Subject: Re: mails not going thru'
Date: Thu, 12 May 2005 09:47:29 -0400
Message-ID: <20050512134729.GA16750@bender.817west.com>
References: <13c5f5713c2d67.13c2d6713c5f57@vsnl.net>
	<20050512123815.GA16545@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050512123815.GA16545@bender.817west.com>
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

On Thu, May 12, 2005 at 08:38:15AM -0400, Jason Opperisano wrote:
> On Thu, May 12, 2005 at 04:50:28PM +0500, varun_saa@vsnl.net wrote:
> > root@saaserver root]#  telnet 64.233.185.27 25
> > Trying 64.233.185.27...
> > Connected to 64.233.185.27.
> > Escape character is '^]'.
> > 220 mx.gmail.com ESMTP 6si352981wrl
> > quit
> > 221 2.0.0 mx.gmail.com closing connection
> > Connection closed by foreign host.
> > 
> > Sorry for the delay in replying.
> > Just got stuck with other issues.
> 
> and the internal IP address of saaserver is the default gateway of the
> internal client machines?

had a stupid thought:  you *have* enabled IP Forwarding on saaserver,
right?

  sysctl net.ipv4.ip_forward

should report:

  net.ipv4.ip_forward = 1

if not, set it:

  sysctl -w net.ipv4.ip_forward=1

-j

--
"Contestant: I'll take the dying boy to block.
 Tom Bergeron: Ok, Jeremy... is there anything lower than absolute
 zero?
 Jeremy: Uhh, yeah... my white cell count."
        --Family Guy

