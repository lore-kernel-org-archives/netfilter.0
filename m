From: Jason Opperisano <opie@817west.com>
Subject: Re: Setting up a Squid proxy server behind a firewall
Date: Tue, 3 May 2005 08:40:35 -0400
Message-ID: <20050503124035.GA15000@bender.817west.com>
References: <32834.172.16.40.6.1115097787.squirrel@ltsp.pcce>
	<20050503123539.GA14940@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050503123539.GA14940@bender.817west.com>
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

On Tue, May 03, 2005 at 08:35:39AM -0400, Jason Opperisano wrote:
>   iptables -A OUTPUT -i lo -j ACCEPT

dammit...should be:

  iptables -A OUTPUT -o lo -j ACCEPT

-j

--
"Stewie: I'll wait until you're finished. Are you done? Because
 I thought this show was called "Kids Say the Darndest Things," not
 "Old Black Comedians Who Never Shut The Hell Up.""
        --Family Guy

