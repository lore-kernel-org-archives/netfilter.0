From: Karina =?iso-8859-1?Q?G=F3mez?= Salgado <kgs@acabtu.com.mx>
Subject: How to NOT redirect..
Date: Thu, 07 Nov 2002 12:40:20 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCAB394.BE9050AF@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi, I'm using iptables for redirect requests to port 80 to port 3128 of
Squid.

But I have a problem, because some of the squid users have trouble
accessing certain services through the proxy, i want to this users
bypass the proxy when they try to reach certain sites.

So How can i deny the redirect ?

I've excluded certain users for their source address... making the
redirection to the remaining ip addresses.

But now i want to send all traffic to squid, all but certain
destinations...

Is there a way to do that ?

I appreciate any help,

Thanks,

Karina


