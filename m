From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_tcp Errors
Date: Mon, 28 Jun 2004 13:05:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406281305.57409.Antony@Soft-Solutions.co.uk>
References: <1088423237.13933.127.camel@spudgun.dhcp.internal>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088423237.13933.127.camel@spudgun.dhcp.internal>
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

On Monday 28 June 2004 12:47 pm, Evgeni Vachkov wrote:

> Hi all,
>
> When I load test one of our firewalls, when the concurrent connections
> reach arround 230, I am getting a lot of error messages as shown below.

230 is a very small number.   You should be able to support several thousand 
connections (depending on RAM) without problems.

> Mostly indicating that the server has sent an invalid SYN.  This is a
> heavy load firewall.

Define "heavy load"?

230 connections is not much.   What sort of bandwidth are they generating in 
total?

What sort of network cards are you using?   Anything changed about the 
hardware around the time you started seeing the messages?

Regards,

Antony.

-- 
What is this talk of "software release"?
Our software evolves and matures until it is capable of escape, leaving a 
bloody trail of designers and quality assurance people in its wake.

                                                     Please reply to the list;
                                                           please don't CC me.


