From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Still having problems with forwarding
Date: Mon, 15 Mar 2004 08:50:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403150850.29824.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000FE00002A57@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000FE00002A57@sbgit.com>
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

On Monday 15 March 2004 8:36 am, Peter <netfilter@sbgit.com> wrote:

> Hi,
>
> i still having a lot of problems with the forwading of my vpn tunnel.
> Now i can't connect to my system anyway?
> The rest of my script (emule) has problems to, after i aplied the pptp
> patch with pom and copiled the newest iptables version to my kernel.

1. Can you be more specific about exactly what problems you are having - what 
does work, what does not work, how are you testing it?

2. Is it possible that you can simplify your ruleset by removing rules which 
are nice to have, but have nothing to do with this problem (eg: the 
rate-limited DROP rules, and the TCP flag matches), so that it is easier to 
know what to focus on, and what is unimportant?

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


