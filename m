From: Andrew Schulman <andrex@alumni.utexas.net>
Subject: Re: SSH Brute force attacks
Date: Thu, 19 May 2005 11:01:24 -0400
Message-ID: <9cvc7vzduaye.1mm3x4aavk2xx.dlg@40tude.net>
References: <36660-220055419144822808@M2W057.mail2web.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


> How about this:
> 
> 1. You will keep one random high port to accept new connection, say 32456.
> You box wont listen on that port though.
> 2. If there have a request on that port, using recent match, you will
> accpet new connection in different high port for 1 mintute. say port is
> 34521
> 3. You will send new connection request on 34521, again using recent match
> you will open port 22 to accept new connection for 1-3 minutes.
> 4. You will log into your box !!

Port knocking is the same as a plaintext password.
http://software.newsforge.com/software/04/08/02/1954253.shtml


