From: Jason Opperisano <opie@817west.com>
Subject: Re: Newbie Q: Forcing p2p traffic via one interface on a dual
	homed system.
Date: Sun, 28 Nov 2004 20:33:46 -0500
Message-ID: <1101692026.10064.32.camel@hubcap.ljm.dom>
References: <1bcb81340411281238368cf6b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1bcb81340411281238368cf6b3@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 2004-11-28 at 15:38, hArTh0 hArTh0 wrote:
> Hi all,
> 
> My first post to this group and be warned I am a new linux user ;)
> 
> My setup:
> 
> -----ISP1---ppp0----Router-----MainPC
> -----ISP2---ppp1-------|
> 
> Router ip: 192.168.0.1
> MainPC ip: 192.168.0.10
> ppp0: 165.165.89.171
> ppp1: 165.146.132.124
> 
> What I want to achieve is that all p2p traffic passes through ppp1
> while everthing else goes through ppp0.
> 
> My approach to date: Use http://www.ipp2p.org to mark all p2p packets
> and then attempt to use this mark to get these packets to leave via
> ppp1.

your question sounds just like:

  http://marc.theaimsgroup.com/?l=netfilter&m=109853391328421&w=2

answer is still the same:

  http://marc.theaimsgroup.com/?l=netfilter&m=109866874632386&w=2

-j

--
"Me lose brain? Uh, oh! Ha ha ha! Why I laugh?"
	--The Simpsons


