From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: [FTP large file problem]
Date: Fri, 18 Jul 2003 10:09:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030718140944.GB880@cannon.eng.us.uu.net>
References: <410HgRNvd6128S02.1058536049@uwdvg002.cms.usa.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <410HgRNvd6128S02.1058536049@uwdvg002.cms.usa.net>
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
To: Curtis Call <curtiscall@usa.net>
Cc: Marcel de Boer <marceldb@luon.net>, netfilter@lists.netfilter.org

On Fri, Jul 18, 2003 at 07:47:29AM -0600, Curtis Call wrote:

> Are you explicitly allowing fragments through?  When a packet is fragmented
> only the first fragment contains the TCP/UDP header.  So if you're only
> permitting based on that header the fragments won't make it.

Are you sure about this? Doesn't defrag occure on the fw by default? Specially
when you do nat it cannot work without this logic? And I don't recall any
mention of "let fragments through" in the howto's or alike.

Ramin

