From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: Re: semi OT: default route
Date: Wed, 20 Oct 2004 12:57:37 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041020165737.GB7751@tranquility.scriptkitchen.com>
References: <20041020132551.GA1720@tranquility.scriptkitchen.com>
	<20041020161725.GA7221@bender.817west.com>
	<20041020163734.GR21006@metastasis.org.uk>
	<20041020164830.GA7438@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041020164830.GA7438@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On Wed, Oct 20, 2004 at 12:48:30PM -0400, Jason Opperisano wrote:
> yes--the linux routing code will do dead gateway detection and fall
> back to a lower metric route in the event of failure, and also go back
> to the higher metric route upon resurrection.  this can be useful for
> an active-standby setup.

routed might help here. Right?
Can anyone with 2 ISP setup please check the load balance thing?
I vaguely remember seeing something about multiple default routes
in early chapters of TCP/IP Illustrated Vol. 1 (I am not at all sure).
Thanks.
With warm regards,
-Payal

-- 

