From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: why do we need to allow all traffic from lo interface???
Date: Tue, 29 Oct 2002 08:52:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021029085225.FVET1554.mta07-svc.ntlworld.com@there>
References: <F44M0DopbFQffqlRxqf000167c0@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F44M0DopbFQffqlRxqf000167c0@hotmail.com>
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

On Tuesday 29 October 2002 1:09 am, Tan Ming Han wrote:

> hi,
>    I seen some examples allowing all traffic (in INPUT and OUTPUT) from lo
> interface. Why is it so? Is it becos of the local XWindow connection?

X requires this, yes; there are also certain other applications which use 
things like rpc calls or ident lookups.   A simple way to find out what 
traffic goes across the lo interface is to log it for a while:

iptables -A INPUT -i lo -j LOG --log-prefix="In-lo: "
iptables -A INPUT -i lo -j ACCEPT

Antony.

-- 

Windows: just another pane in the glass.

