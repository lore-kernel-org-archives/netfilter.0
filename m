From: Neil Hodge <neh@attbi.com>
Subject: Re: Tightening up outgoing traffic
Date: 16 Oct 2002 05:40:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034772030.2206.5.camel@localhost.localdomain>
References: <1034686034.15446.38.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

All:

On Tue, 2002-10-15 at 05:47, Neil Hodge wrote:
> All:
> 
> When I change to this:
> 
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -p tcp --destination-port http -j ACCEPT
> 
> I keep getting "domainname can not be found.  Please check the name
and
> try again" from my browser.  This only happens for new web sites
(i.e.,
> Yahoo works fine).  As this seems somewhat like a DNS issue, I tried
> adding this:
> 
> iptables -A OUTPUT -p tcp --destination-port nameserver -j ACCEPT
> 
> but it didn't work.  Any ideas?  Thanks.
> 
> Neil Hodge
> 

Thanks for all of the information.  It worked well.  Although, when I
had to reboot (for another reason), X wouldn't start . . .  Alas, that's
a battle for another day.

Thanks!

Neil



