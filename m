From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: DNAT --to-destination: why not hostname?
Date: Wed, 03 Mar 2004 18:39:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078357191.3074.11.camel@localhost>
References: <200403031333.33554.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403031333.33554.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-03-03 at 14:33, /dev/rob0 wrote:
> The syntax from TFM, iptables(8):
>     --to-destination ipaddr[-ipaddr][:port-port]
> Obviously if you are going to use a range of destinations only IP 
> addresses would suffice. But why can't this option accept a hostname 
> for a single destination?
> 
> This would be convenient for scripting, in that you maintain control of 
> the firewall through DNS. As it is, to use a hostname I have to use an 
> intermediate step to get the IP, like this:
>     DEST_IP=`dig +short ${DEST_HOST}.domain.tld.`
> This is also less than ideal because if iptables resolved the name 
> itself, it would use the "search domain.tld" out of resolv.conf. For 
> dig I have to manually append it. And it's REALLY inconvenient in some 
> of my firewall machines where there is no BIND installed. It gets even 
> worse in sites which aren't running their own DNS ... AFAIK dig and 
> host only use DNS, not /etc/hosts, for resolving.
> 
> iptables DOES resolve hostnames used in other parameters, so why not 
> here? That should have been a question for the developer list, I guess, 
> but I'm not on that one.
> 
> But a good question for this list might be: "How have you handled this 
> need in iptables scripting?" I have used the dig trick where available 
> and hard-coded IP's elsewhere.
I do not know the iptables internals and I do not know why others take a
name and this doesn't but I would strongly caution against using names
on iptables.

I always advise my staff to minimize administrative overhead and that
especially means to use names rather than IP's -- except here.  From
what I understand, iptables only resolves the names once -- when it is
loaded.  If you change a DNS entry somewhere, iptables will be lost
until it is rebooted.

Even if it resolved on every query, it would still lead to awful
performance.  It would need to do an inverse lookup.  Inverse lookup
tables are notoriously poorly maintained.  If something happens to your
resolver, the timeout on failed inverse queries is much longer than
normal queries and you may hold a packet for 30 to 60 seconds while
trying to resolve the address to a name.

Finally, although I've never tried this, I suppose if someone could hack
your DNS to associate the IP of a high security destination with the
name of a low security destination, they could wiggle right through your
firewall without your firewall ever knowing the difference.

I know using IP addresses adds overhead but, when it comes to access
control and especially on iptables, that's all I use - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


