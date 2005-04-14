From: Jason Opperisano <opie@817west.com>
Subject: Re: msn and yahoo messenger voice chat
Date: Thu, 14 Apr 2005 08:05:59 -0400
Message-ID: <20050414120559.GA1145@bender.817west.com>
References: <001101c53f6f$a198e9c0$dc0aa8c0@winntpro>
	<007e01c540b0$5e0a6b10$dc0aa8c0@winntpro>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <007e01c540b0$5e0a6b10$dc0aa8c0@winntpro>
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

On Thu, Apr 14, 2005 at 08:11:08AM +0300, Wennie V. Lagmay wrote:
> Hi Jason,
> 
> iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> xxx.xxx.85.113-xxx.xxx.85.115
> iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --nodst --to
> xxx.xxx.85.113-xxx.xxx.85.115

that second rule will never be matched.  get rid of the first rule, and
just use the second.

> the above rules are intermitent., the rule below is working fine.
> iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to xxx.xxx.85.113
> 
> Im using iptables version 1.2.9, I'm just wondering if the above intermitent
> rules will work fine on lattest iptables verion. Do you know the lattest and
> most stable iptables version?

the latest version is 1.3.1...my guess is that the most accepted as
stable version would be 1.2.11...but this isn't your problem.

-j

--
"Stewie: It rubs the lotion on its skin or else it gets the hose again."
        --Family Guy

