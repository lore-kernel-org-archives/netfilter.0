From: malware@t-online.de (Michael Mueller)
Subject: Re: conntrack has problems with syn-ack-psh set
Date: Tue, 04 Jan 2005 09:40:56 +0100
Message-ID: <41DA5698.2010403@t-online.de>
References: <41D0B008.1030400@cascadiabhc.org>
	<20050101175016.GA10480@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050101175016.GA10480@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Jason,

you wrote:
> SYN-ACK-PSH is not a valid response to a SYN packet.  you will never

What does make you think so? I can not find any hint in RFC973 and 
RFC1211 saying so.
IMO it is a perfectly valid reply, even if it a rather unusual one and 
might be a case for applying a normalization (here removing the PSH flag 
and any data) on it.


Michael

