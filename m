From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Iptables && Eroor : too long (must be under 30 chars)
Date: 26 Mar 2003 18:46:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048700789.14721.124.camel@tux.rsn.bth.se>
References: <200303261754.13392.matteo.king@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303261754.13392.matteo.king@libero.it>
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
To: Matteo <matteo.king@libero.it>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Wed, 2003-03-26 at 17:54, Matteo wrote:
> Hi all , i have write a script for iptables with my rules but when I launch 
> this script i have this error :
> too long (must be under 30 chars)......
> 
> How can I resolve this??

You can start the script with this in order to see which command it was
that printed the error:

#!/bin/bash -x

It sounds like you try to create a chain with a very long name.

-- 
/Martin

