From: Martijn Lievaart <m@rtij.nl>
Subject: Re: DHCP & remote ssh logins
Date: Sun, 29 Apr 2007 17:10:28 +0200
Message-ID: <4634B564.5090702@rtij.nl>
References: <1177853638.11131.46.camel@prix.pricom.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1177853638.11131.46.camel@prix.pricom.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: phil@pricom.com.au
Cc: netfilter@lists.netfilter.org

Phil Rhoades wrote:
> People,
>
> If iptables are setup to only accept ssh logins from particular IPs, how
> do people login when they are on the move and have a DHCP allocated IP?
>   

Ssh to a known box with a fixed IP address and ssh to the target from there.

> I thought I could do this by sending a mail (from the remote DHCP IP)
> formatted in a particular way, to a particular user on the destination
> server which would then be processed, which would then cause a change to
> the iptables setup.  However, I assume other people have had to solve
> this problem and I don't want to re-invent wheels . .
>   

Google for port knocking.

HTH,
M4


