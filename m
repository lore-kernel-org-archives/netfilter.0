From: Jason Opperisano <opie@817west.com>
Subject: Re: 4 NIC cards
Date: Wed, 17 Nov 2004 08:35:06 -0500
Message-ID: <1100698506.3695.77.camel@hubcap.ljm.dom>
References: <20041117100208.92063.qmail@web60402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041117100208.92063.qmail@web60402.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-11-17 at 05:02, ads nat wrote:
> Hi,
> I have setup a Redhat 9.0 Linux server with 5 NIC 
> (Intel Motherboard) router.
> 
> I will be getting bandwidth (256 kbps) from 4 dialup
> supplies all are through dialer installed by ISP. Each
> dialer is assigened to each NIC.
> 
> I would like to get bandwidth from all 4
> simulteneously so that totally it will make
> (256x4=1024 kbps) and want to distribute it to my LAN
> through Ethernet card no. 5.
> 
> Is it possible to achieve this? and if so please guide
> me to URL OR howto to achieve this.

have a look at:

  http://lartc.org/howto/lartc.rpdb.multiple-links.html

and also the page linked at the very bottom of that page:

  http://www.ssi.bg/~ja/#routes

also--keep in mind that since your outbound traffic will need to be
balanced on a per-connection basis, no single connection will ever get
more than 256 kb/s of bandwidth.

-j
 
--
"You heard me, I won't be in for the rest of the week... I told you,
 my baby beat me up... oh it is not the worst excuse I ever thought up."
	--The Simpsons


