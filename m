From: alex <alex@bennee.com>
Subject: Re: Question on PREROUTING and INPUT chains
Date: 11 Nov 2002 23:41:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037058069.3178.14.camel@trent.nin>
References: <3DCD21FC.6010402@offlineprovider.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DCD21FC.6010402@offlineprovider.de>
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
To: Simon Kowallik <sub@offlineprovider.de>
Cc: netfilter@lists.netfilter.org

On Sat, 2002-11-09 at 14:55, Simon Kowallik wrote:
> Perhaps this helps to better understand the "flow":
> http://offlineprovider.de/site/netfilter/netfilter.php
> 
> Regards,
> Simon

If I'm understanding the diagram correctly that might explain my
problems. Am I to understand that all packets on a NAT'ed connection
never go through the FORWARD chain of filter?

Is there a pointer to a ChangeLog for netfilter behaviour between 2.4.17
and 2.4.18?

-- 
alex <alex@bennee.com>
My own hacking haven


