From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Filtering out spoofed network addresses
Date: 01 Jul 2003 21:32:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057087972.721.34.camel@tux.rsn.bth.se>
References: <Pine.LNX.4.44.0306301039060.23945-100000@hay.haya.qc.ca>
	 <20030630153033.GA29474@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030630153033.GA29474@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: "James R. Hay" <jrhay@HayA.QC.CA>, Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-06-30 at 17:30, Ramin Dousti wrote:
> On Mon, Jun 30, 2003 at 10:42:13AM -0400, James R. Hay wrote:
> 
> > 
> > Hi folks,
> 
> Hi James,
> 
> Indeed, you cannot do this with netfilter. Netfilter does not provide you
> with the "don't care bits" as cisco calls it.

What's wrong with:

-s 0.0.0.0/0.0.255.255

?

-- 
/Martin

