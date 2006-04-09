From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: NATed packets only enter the default routing table
Date: Sun, 9 Apr 2006 20:30:58 +0200
Message-ID: <20060409203058.6e375d70.mailinglists@lucassen.org>
References: <20060408194058.71fa3e09.mailinglists@lucassen.org>
	<200604091556.02586.jeroen@elebaut.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604091556.02586.jeroen@elebaut.com>
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

On Sun, 9 Apr 2006 15:56:02 +0200
Jeroen Elebaut <jeroen@elebaut.com> wrote:

> i had a similar problem with our setup. The problem is i think that
> the  routing decision on the linux box is made before the address in
> the packet is  changed back to 1.2.3.3. So it doesn't use the source
> policy routing entry. I  solved this by using the connmark module from
> iptables and then do routing  based on the mark. The following should
> work in your setup:
> 
> iptables -t mangle -I PREROUTING -m conntrack --ctstate
> ESTABLISHED,RELATED -j  CONNMARK --restore-mark
> iptables -t mangle -I PREROUTING -i eth1 -m conntrack --ctstate NEW 
> -j  CONNMARK --set-mark 1
> 
> ip rule add fwmark 1 lookup eth1_up

I already found out this:

iptables -t mangle -A PREROUTING -i eth1 -d 192.168.201.3 \
 -j CONNMARK --set-mark 1

iptables -t mangle -A PREROUTING -i eth2 -s 10.0.2.1 \
 -j CONNMARK --restore-mark

> This will route everything that entered via eth1 back via eth1.

And indeed that was the solution. Thnx!

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

