From: "Antonio Paulo Salgado Forster" <aforster@br.ibm.com>
Subject: Re: load balancing?
Date: Sat, 14 Jun 2003 22:28:16 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFF909B862.8E351B6B-ON03256D46.0007E741@LocalDomain>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Joel Newkirk <netfilter@newkirk.us>
Cc: Jean-Yves Simon <lethalwp@tiscali.be>, netfilter@lists.netfilter.org


if you want load balancing, you should look at http://www.keepalived.org
and/or http://www.linuxvirtualserver.org/

--
Forster


Joel Newkirk <netfilter@newkirk.us>@lists.netfilter.org on 06/14/2003
12:36:55 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    Jean-Yves Simon <lethalwp@tiscali.be>
cc:    netfilter@lists.netfilter.org
Subject:    Re: load balancing?



On Sat, 2003-06-14 at 07:54, Jean-Yves Simon wrote:
> Hello,
>
> I'm curious if load balancing can be done with iptables, like for
> example forwarding incoming web requests to one of the multiple web
> servers behind the firewall.
>
> Or is a third party software needed?

If all you need is to distribute requests evenly across a range of IPs
you can use the rule:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to
10.10.10.1-10.10.10.16

This example would attempt to distribute incoming HTTP requests evenly
across the specified range of 16 IPs.

j







