From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: thoughts on a newbie tutorial i'll be giving shortly
Date: Fri, 31 Oct 2003 02:45:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031024536.7e5f9f6c.arnt@c2i.net>
References: <Pine.LNX.4.44.0310300725550.18040-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310300725550.18040-100000@localhost.localdomain>
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

On Thu, 30 Oct 2003 07:30:47 -0500 (EST), 
"Robert P. J. Day" <rpjday@mindspring.com> wrote in message 
<Pine.LNX.4.44.0310300725550.18040-100000@localhost.localdomain>:

> 
>   as a really low-level iptables intro i'm giving this monday,
> i'm going to show and explain something like the following.
> it's deliberately simplified as i have only about a half hour,
> but i'm interested in whether anyone here has any kind of 
> visceral reaction to this configuration -- whether i'm suggesting
> anything violently insecure or anything like that.  (i've removed
> a lot of preliminary variable setting, just wanting to show the
> salient stuff.)
> 
> ------------------------
> 
> ALLOWED_INCOMING_SERVICES="ssh http"
> DISALLOWED_OUTGOING_SERVICES="telnet"
> 
> #######################################################
> # Set the chain policies.
> #######################################################
> 
> $IPT -P INPUT DROP
> $IPT -P FORWARD DROP
> $IPT -P OUTPUT ACCEPT	# Purists probably hate this.
> 
> 
> #######################################################
> # Start with some REALLY basic rules.
> #######################################################
> 
> $IPT -A INPUT -i lo -j ACCEPT
> $IPT -A OUTPUT -o lo -j ACCEPT
> 
> $IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> $IPT -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 
> #######################################################
> # Kill really bad outgoing services.
> #######################################################
> 
> for s in $DISALLOWED_OUTGOING_SERVICES ; do
> 	$IPT -A OUTPUT -p tcp --dport $s -j DROP
> done

.." -j DROP " times out boxes in your lan, you may want " -j REJECT". 
 
> #######################################################
> # Allow a very small set of incoming services.
> #######################################################
> 
> for s in $ALLOWED_INCOMING_SERVICES ; do
> 	$IPT -A INPUT -p tcp -s 192.168.1.0/24 --dport $s -j ACCEPT
> done
> 
> ------------------------------
> 
>   yes, it could be fancier, but it's meant to be a starting
> point for total newbies.  
> 
>   thoughts?
> 
> rday
> 
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


