From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: MTU vs packet size?
Date: Mon, 23 Jun 2003 11:29:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030623152942.GA28160@cannon.eng.us.uu.net>
References: <000001c3398d$dcf68020$64a5a8c0@europe.cellnetwork.com> <20030623151248.81850.qmail@web13904.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030623151248.81850.qmail@web13904.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Scott MacKay <scottmackay@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Mon, Jun 23, 2003 at 08:12:48AM -0700, Scott MacKay wrote:

> Mainly from interest in the size of the buffer in the
> ipq_read(), can you receive a packet who's size is
> greater than the MTU of the interface?  In example,
> with a 1500 mtu interface, can you receive a 2000 byte
> packet?

Yes, MTU is Maximum _Transfer_ Unit. If you set it to a
number less than the actual layer2 capability and the other
side sets it to the real MTU of the link, then you will send
small packets but you would receive bigger packets than your
set MTU.

Ramin

> -Scott
> 
> __________________________________
> Do you Yahoo!?
> SBC Yahoo! DSL - Now only $29.95 per month!
> http://sbc.yahoo.com

