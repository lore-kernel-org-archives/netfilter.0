From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fw: How to remove Established Connection
Date: Fri, 11 Oct 2002 18:12:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111712.g9BHCSL19764@vulcan.rissington.net>
References: <00e301c270e7$09c5a7e0$7cfcc5cb@humanpc> <200210111230.g9BCUlL19231@vulcan.rissington.net> <00b501c2712e$f88e39e0$7cfcc5cb@humanpc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00b501c2712e$f88e39e0$7cfcc5cb@humanpc>
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
To: netfilter@lists.samba.org

On Friday 11 October 2002 3:03 pm, HareRam wrote:

> Hi all
> thanks its working using my own methods,
> but idea is lot of people, especially Mr Antony's
>
> what is the Recomended DROP or REJECT
> just now my Rule is work with DROP
>
> but i saw now here REJECT
> which one is powerfull to use to disable connections of Forward

I recommend you use REJECT for internal clients (people who you want to be 
nice to, and who you don't want to get excessive delays when they try to do 
something your firewall rules don't allow).

I recommend you use DROP for external connections (people who you don't want 
to be nice to, you don't want to give any information to, and who you don't 
care whether their client hangs for 60 seconds instead of immediately saying 
"connection refused").

Antony.

-- 

This is not a rehearsal.
This is Real Life.

