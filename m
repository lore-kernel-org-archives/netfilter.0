From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 22:01:30 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041025200130.GS29776@der-frank.org>
References: <s17d10cf.018@hpsk12.net>
	<20041025193800.GA24645@bender.817west.com>
	<33D73F71797CC09A67671396@[10.169.6.246]>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <33D73F71797CC09A67671396@[10.169.6.246]>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* Kenneth Porter <shiva@sewingwitch.com> 25. Oct 04:
> --On Monday, October 25, 2004 3:38 PM -0400 Jason Opperisano 
> <opie@817west.com> wrote:
> >a local IP address on this machine
> Also note that this includes virtual interfaces, tunnel interfaces (the 
> tun/tap driver, typically used in VPN's), and the loopback interface. It's 
> not just NIC's.

IP numbers belong to the IP stack and have nothing to do with
interfaces.  This idea is completely useless, forget it, this will make
things (eg. routing) a lot more understandable.  From this point of
view, Jasons posting is IMHO very clear.

 Regards, Frank.
-- 
Sigmentation fault

