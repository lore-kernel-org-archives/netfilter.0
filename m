From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can't forward Win2k VPN through NAT
Date: Fri, 6 Sep 2002 15:22:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209061422.g86EMQv02254@vulcan.rissington.net>
References: <200209061442.18983.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209061442.18983.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Friday 06 September 2002 1:42 pm, Roy Sigurd Karlsbakk wrote:

> hi all
>
> I have this fw as sketched below. What I want, is to enable win2k VPN
> connection NATed into 192.168.144.24.
>
> Can someone help me here? It just doesn't work ...

You;re right.   It doesn't work.

PPTP doesn't like being NATted, because it embeds addressing information 
inside the protocol.

You need to load the pptp helper module in netfilter to stand any chance of 
getting this going.   Look for pptp_conntrack_nat.

I think the sig on your email was highly appropriate to the situation, 
however:

"Computers are like air conditioners.
They stop working when you open Windows."

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

