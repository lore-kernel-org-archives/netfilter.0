From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall machine eating lot of memory
Date: Fri, 8 Nov 2002 17:12:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211081712.gA8HCke23994@vulcan.rissington.net>
References: <1100D69203AAD2118E3C00508B8B9E8A67F13C@mailhost.intech.unu.edu> <200211051832.gA5IWhe19780@vulcan.rissington.net> <008e01c28732$dd9884f0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008e01c28732$dd9884f0$8c01a8c0@sundaram>
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
To: netfilter@lists.netfilter.org

On Friday 08 November 2002 2:26 pm, Sundaram Ramasamy wrote:

> Hi,
>
> Ia m using  Rdhat 7.3  kernel 2.4.18-3custom for my firewall, suddenly its
> taking lot of memory, after that its not releasing. I ran the following
> script to monitor the memory usage.
>
> Morning 3 to 4  its taking all the memory.

This is nothing to worry about.

All your uptime outputs show no swap being used, therefore you are not 
running out of memory.

The fact that yoou see almost all your memory "used" instead of "free" simply 
means that the memory has been allocated to some processand has not 
subsequently been deallocated, because nothing else needs it.

This is simply the way Linux allocates memory.

Antony.

-- 

Windows: just another pane in the glass.

