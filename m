From: Rakotomandimby Mihamina <rktmb.list@wanadoo.fr>
Subject: Re: port scan identification
Date: Wed, 09 Jun 2004 18:37:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C73CCA.4070804@wanadoo.fr>
References: <40C6D987.9050805@wanadoo.fr> <1086781430.14426.5.camel@localhost>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086781430.14426.5.camel@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

John A. Sullivan III wrote:
 > Hope this helps - John

it does !
but :

if i 'tail -f' my web server access log and the iptables log, I notice 
those "port_scan" are done when visitors are visiting my site : same 
time, same IP. I dont think each visitor would want to hack me.

My conclusion is my rule is not very good, as well as the logged packet 
is dropped, it would decrease accuracy of the website. What should i do 
to make it better ? I still want to keep port scan prevention, but want 
to avoid dropping non-offending packets ... but if you think the website 
accuracy wouldnt be down for that reason, i will keep it as it is ...
-- 
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina

