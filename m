From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: diffrence between reject & drop ?
Date: Tue, 1 Feb 2005 09:47:39 +0100
Message-ID: <20050201084800.4D4CE8EDCEB@smtp.sterenborg.info>
References: <20050201075801.30992.qmail@web51009.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050201075801.30992.qmail@web51009.mail.yahoo.com>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

netfilter-bounces@lists.netfilter.org wrote:
> What is the basic diffrence between rejecting a packet & droping a
> packet ? 
> 
> both denies the packet right ?

Yes, but REJECT notifies the sender that the packet was not accepted,
DROP silently discards the packet.


Gr,
Rob


