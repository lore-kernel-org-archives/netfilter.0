From: Vitaly <vitaly_il@yahoo.com>
Subject: Re: How to combine a few  addresses?
Date: Tue, 11 Sep 2007 05:27:10 -0700 (PDT)
Message-ID: <554137.97540.qm@web60322.mail.yahoo.com>
References: <46E683A7.70604@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46E683A7.70604@rtij.nl>
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


--- Martijn Lievaart <m@rtij.nl> wrote:

> Vitaly wrote:
> > How I can combine a few addresses in one rule? For
> > example, I'd like to add two IPs 10.10.10.1 and
> > 10.10.10.2 to the same rule.
> >
> >   
> 
> Either use ipset (needs a patched kernel), or
> iprange (if the addresses 
> are consecutive) or use a subchain, e.g:
> 
> -A -s 10.10.10.1 -j CUSTOM
> -A -s 10.10.10.2 -j CUSTOM
> -N CUSTOM
> -A CUSTOM <rest of rule>
> 
Thank you!
Subchains seem to be OK for my needs. But will
subchains work in case when I need to *exclude* some
IPs?

For example, can I add 10.10.10.2 to this rule using
subchain?

iptables -I INPUT -p tcp --dport 80  ! -s 10.10.10.1  
-m state --state NEW -m recent --set



       
____________________________________________________________________________________
Pinpoint customers who are looking for what you sell. 
http://searchmarketing.yahoo.com/

