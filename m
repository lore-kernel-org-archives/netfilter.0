From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Loopback traffic..
Date: Fri, 27 Feb 2004 17:18:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402271718.37113.Antony@Soft-Solutions.co.uk>
References: <200402271655.i1RGtGvF018952@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402271655.i1RGtGvF018952@discmail.com>
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

On Friday 27 February 2004 4:54 pm, Aldo S. Lagana wrote:

> I noticed on one of my netfilter gateways, I am seeing a lot of loopback
> traffic.  It is high-port number traffic.  I don't recall ever seeing any
> loopback traffic before.
>
> I run iptables, squid, frees/wan, poptop, portsentry, squidguard...it's
> weird - I have another box that runs those and has 0 loopback traffic..

Is there any difference in /etc/hosts, or the DNS resolution for the two 
machines when they want to look up (a) their own hostnames, or (b) 
"localhost" ?

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


