From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 02 May 2005 02:14:11 -0500
Message-ID: <4275D343.1030406@riverviewtech.net>
References: <200504301341.58023.dcinege-mlists@psychosis.com>
	<4275D19B.7030409@imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4275D19B.7030409@imag.fr>
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

> have you tried with a proper web browser, such as firefox ? IE is known
> as not respecting the RFC for TCP and sending the HTTP request as data
> in the first "SYN" packet (which is only recognised by IIS, of course)
> so as to 'make' IE appear faster than it really is..

Would it be possible / likely / practical to mangle such traffic to remove any data from the payload of the SYN packet?  Ultimately creating a cleaner connection to the server and causing IE to timeout on the packet and resend it?

> guess it's one more example of how badly Windows' TCP/IP stack is broken
> is so many ways...

*nod*



Grant. . . .

