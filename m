From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Tightening up outgoing traffic
Date: Tue, 15 Oct 2002 14:03:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210151303.g9FD3RL23621@vulcan.rissington.net>
References: <1034686034.15446.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034686034.15446.38.camel@localhost.localdomain>
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

On Tuesday 15 October 2002 1:47 pm, Neil Hodge wrote:

> All:
>
> I am running directly off the firewall box.  I currently have the
> following:
>
> iptables -P OUTPUT ACCEPT
>
> When I change to this:
>
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -p tcp --destination-port http -j ACCEPT
>
> I keep getting "domainname can not be found.  Please check the name and
> try again" from my browser.  This only happens for new web sites (i.e.,
> Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
> adding this:
>
> iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT
>
> but it didn't work.  Any ideas?  Thanks.

Yes.   Change the tcp to udp in the last command above :-)

By the way, I would recommend adding a LOGging rule to your OUTPUT chain, at 
the end just before packets get default DROPped, so you can see what you're 
blocking which you might not realise you want to allow....

There are things like some ICMP packets which you might not realise you 
should allow out of your machine in order to keep things running nicely.

Antony.

-- 

There are two possible outcomes.

If the result confirms the hypothesis, then you've made a measurement.
If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

