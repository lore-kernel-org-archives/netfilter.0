From: Jason Opperisano <opie@817west.com>
Subject: Re: Suse 9.1 port forwarding woes
Date: Tue, 11 Jan 2005 07:41:09 -0500
Message-ID: <1105447269.9691.4.camel@hubcap.ljm.dom>
References: <41E32C3C.2080907@overdrawn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E32C3C.2080907@overdrawn.net>
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

On Mon, 2005-01-10 at 20:30, Nathan March wrote:
> Argh, I copied and pasted the wrong stuff over.
> 
> Correct:
> 
> ace:~ # iptables --list

i shoulda mentioned this in my last post--can you post the output of
"iptables -vnxL && iptables -t nat -vnxL" instead of just "iptables
--list" as we cannot see interface names or other information that may
be releavent.

also--is this firewall machine the default gateway for 192.168.0.3?

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
	--The Simpsons


