From: Daniel Bidwell <bidwell@andrews.edu>
Subject: Re: Controlling number of sessions
Date: 23 Sep 2003 10:43:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064328220.3980.26.camel@samwise>
References: <200309231859450453.1183C0A3@smtp.khi.wol.net.pk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309231859450453.1183C0A3@smtp.khi.wol.net.pk>
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
To: Nauman Malik <naumanm@khi.wol.net.pk>
Cc: netfilter@lists.netfilter.org

On Tue, 2003-09-23 at 09:59, Nauman Malik wrote:
> Hi,
> 
> I have a Linux box being used as a cache server. I want to control number of TCP sessions per user/IP on this machine. e.g. At one time only 50 reuqets per user can be passed through this linux box.
> Is it possible using iptables?.
> Any idea how?

I have connection tracking enabled and have a perl program that runs
every 5 minutes and counts the number of connections per local IP.  You
can then use a program like cutter to kill extra connections if this is
really what you want to do.
> 
-- 
Daniel R. Bidwell	|	bidwell@andrews.edu
Andrews University	|	Information Technology Services
If two always agree, one of them is unnecessary
"Friends don't let friends do DOS"
"In theory, theory and practice are the same.
In practice, however, they are not."


