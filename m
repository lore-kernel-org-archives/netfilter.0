From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: I have to become a bandwidth Nazi , Netfilter useable.
Date: Sat, 1 Mar 2003 09:38:00 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030301153800.GC27466@placemark.com>
References: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Mar 01, 2003 at 09:57:43AM -0400, George Peverill wrote:
>  
> I am running a small network (about 10-12 machines) with a linux gateway
> machine providing http/ssh/vpn(pptp)/firewalling/NAT
> Recently we've had someone that loves to hog bandwidth a tad (ie:

To clarify - the switch should be half-duplex while his computer
remains full duplex.  Quite often, ethernet cards will not redo nway
autonegation once the link is up.  Sometimes they do, at which point
he'd just have a normal half-duplex link which doesn't really slow him
down very much relative to your upstream bandwidth.

Kelly


