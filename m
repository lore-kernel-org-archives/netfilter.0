From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: routing external IP's to internal machines.... Confustion
Date: Thu, 10 Jun 2004 01:18:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086823131.5011.30.camel@axl.seasidesoftware.co.za>
References: <6781F74D-BA66-11D8-8DB6-000A95675988@earthlink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6781F74D-BA66-11D8-8DB6-000A95675988@earthlink.net>
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
To: Michael Rowley MD <mrowleymd@earthlink.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-06-10 at 00:43, Michael Rowley MD wrote:

> I have a block of IP's from Sprint, 209.26.244.33/29.  I have 2 servers 
> inside the firewall that I would like to have accessible from the 
> internet on an external fixed IP.  Currently the internal network is on 
> 192.168.1.0/24, the firewall is working, and I can ssh into the 
> firewall, but would like to ssh into all the servers, and need web 
> access to both also.  I will try and diagram this, just to ellucidate. 

Do source nat and destination nat in both PREROUTING and POSTROUTING,
ignoring the interface on which the packets are seen.  E.g.

-A PREROUTING -j dst-nat
-A POSTROUTING -j src-nat
-A dst-nat -d 209.26.244.33 -j DNAT --to-destination 192.168.1.33
...
-A src-nat -s 192.168.1.33 -j SNAT --to-source 209.26.244.33
...

This assumes that you don't want to set up a DNS server that gives
"fake" answers to clients on 192.168.1.0/24.

Both approaches work for me.  YMMV.

Ciao,
Sheldon.



