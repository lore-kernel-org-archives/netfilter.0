From: Jason Opperisano <opie@817west.com>
Subject: Re: two transparent (bridging) firewall
Date: Fri, 31 Dec 2004 06:31:49 -0500
Message-ID: <1104492709.14318.1.camel@hubcap.ljm.dom>
References: <41D4BD72.7030108@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41D4BD72.7030108@phreaker.net>
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

On Thu, 2004-12-30 at 21:46, ro0ot wrote:
> Hi,
> 
> I am planning to implement the following setup as below: -
> 
>                                                      ------- Bridging 
> FW-1 -------
> Internet ---- Router ---- Hub ---- 
> |                                              | ---- Switch ---- 
> Servers (VoIP)
>                                                      ------- Bridging 
> FW-2 -------
> 
> I would like to understand how does the Servers (VoIP) behind the two 
> Bridging Firewalls will know which path will it choose to route the 
> traffic out and which path will it use often.

spanning tree.  and it will always go through one firewall until the
path dies.

-j

--
"Silly customer, you cannot hurt a Twinkie!"
	--The Simpsons


