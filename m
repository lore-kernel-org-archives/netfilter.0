From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and wireless card in promiscuous mode
Date: Wed, 01 Dec 2004 08:31:26 -0500
Message-ID: <1101907886.3251.18.camel@hubcap.ljm.dom>
References: <41AC6D4F.7000001@eurecom.fr>
	<200411301821.23588.Alistair@nerdnet.ca> <41ADB537.6040603@eurecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41ADB537.6040603@eurecom.fr>
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

On Wed, 2004-12-01 at 07:12, Claudio Lavecchia wrote:
> Well,
> 
> In fact  I really wanted my WLAN card set in promiscuous mode to drop 
> all the packets coming from the other laptop, this means that I wanted a 
> filter BEFORE the promiscuos mode filter.

if that makes sense to you, or anyone else on this list--more power to
you.

> And by the way: how do I cancel a rule from the PREROUTING chain?
> If I do the standard way, I get:
> 
> ~ # iptables -D PREROUTING 1
> iptables: No chain/target/match by that name

first--you need to specify a chain (here you also need to specify a
table, as filter has no PREROUTING chain).  second--you need to specify
the whole rule.

a rule added with the command:

  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 80 \
    -j DNAT --to-destination $WEB_SRV

must be deleted with the command:

  iptables -t nat -D PREROUTING -i $EXT_IF -p tcp --dport 80 \
    -j DNAT --to-destination $WEB_SRV

the other option would be to flush that chain and just add back the
rules you want to keep (if any), as is often done in scripts:

  iptables -t nat -F PREROUTING

  iptables -t nat -A PREROUTING ...

and lastly--you could:

  iptables-save > ipt.out
  vi ipt.out [delete rule(s) you don't want any more]
  iptables-restore ipt.out

-j

--
"I'm having the best day of my life, and I owe it all to not going
 to Church!"
	--The Simpsons


