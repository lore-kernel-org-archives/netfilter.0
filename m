From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: port scan identification
Date: Wed, 09 Jun 2004 12:51:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086799860.14435.49.camel@localhost>
References: <40C6D987.9050805@wanadoo.fr>
	 <1086781430.14426.5.camel@localhost>  <40C73CCA.4070804@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C73CCA.4070804@wanadoo.fr>
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

On Wed, 2004-06-09 at 12:37, Rakotomandimby Mihamina wrote:
> John A. Sullivan III wrote:
>  > Hope this helps - John
> 
> it does !
> but :
> 
> if i 'tail -f' my web server access log and the iptables log, I notice 
> those "port_scan" are done when visitors are visiting my site : same 
> time, same IP. I dont think each visitor would want to hack me.
> 
> My conclusion is my rule is not very good, as well as the logged packet 
> is dropped, it would decrease accuracy of the website. What should i do 
> to make it better ? I still want to keep port scan prevention, but want 
> to avoid dropping non-offending packets ... but if you think the website 
> accuracy wouldnt be down for that reason, i will keep it as it is ...
Hmmm . . . I assume what you are trying to do is pick up all packets
with the RST flag on that are not part of a current session, such as
those used to probe a site.

I'm a little rusty on when RSTs are sent.  If they are part of the
packet stream, then I would think conntrack will pick it up and the
legitimate RSTs would never hit your rule.  I assume you are using
conntrack.  However, are RSTs sent when a stream is broken and thus sent
as a separate data stream? I'd have to pull out an IP book to review the
RST flag and why it would not be matched in conntrack.  Does anyone else
know off the top of their head?
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


