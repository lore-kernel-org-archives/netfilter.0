From: Mariusz Kruk <Mariusz.Kruk@epsilon.eu.org>
Subject: Re: iptables crashes server?
Date: Tue, 5 Apr 2005 18:45:44 +0200
Message-ID: <20050405164544.GA8468@epsilon.rdc.pl>
References: <4250F7E0.3070203@uplink-verein.ch>
	<1403218a05040404475c810345@mail.gmail.com>
	<42523486.7000107@uplink-verein.ch>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42523486.7000107@uplink-verein.ch>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 05, 2005 at 08:47:34AM +0200, Moritz Gartenmeister wrote:
> ergo, something is filling up my ram. i run apache, irc-proxy, snort and 
> argus besides iptables.
> 
> for me, there seems something buggy in the kernelspace of iptables.
> 
> but, if i am the only one with this problem, it's maybe not.

To make sure it's not a memory leak in any of those services, have you
tried setting limits for process memory?
Also, have you checked the processes' memory usage? Did it rise?

-- 
/\-\/\-\/\-\/\-\/\-\/\-\/\ Nobody's perfect, but I'm not nobody
\  Kruk@epsilon.eu.org   / 
/ http://epsilon.eu.org/ \ 
\/-/\/-/\/-/\/-/\/-/\/-/\/ 

