From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: what is conntrack & how ipchains works without it?!?
Date: Wed, 10 Jul 2002 13:10:55 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710171055.GB25368@cannon.eng.us.uu.net>
References: <20020710095044.A28060@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020710095044.A28060@spawar.navy.mil>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.samba.org

On Wed, Jul 10, 2002 at 09:50:44AM -0700, Christian Seberino wrote:

> Is conntrack the "memory" of iptables that allows
> it to make filtering decisions based on history
> of network traffic in and out of PC???
> 
> Imagine a private LAN PC trying to do DNS thru
> an SSH-only DNAT/SNAT firewall... it is the conntrack

What is a SSH-only firewall?

> that allows ESTABLISHED/RELATED packets to bypass
> the rules allowing DNS to work right?
> 
> How can *ipchains* do DNS thru an SSH-only ipchains
> firewall since it does *not* have conntrack!!!
> It must have some other mechanism right? What?

In case of ipchains you have to open up the firewall manually for
the return traffic which usually translates into a much larger hole
than needed.

Again, what is a SSH-only firewall?

Ramin

> 
> Chris
> -- 
> _______________________________________
> 
> Dr. Christian Seberino
> SPAWAR Systems Center San Diego
> Code 2363
> 53560 Hull Street
> San Diego, CA 92152-5001
> U.S.A.
> 
> Phone: (619) 553-7940
> Fax:   (619) 553-2836
> Email: seberino@spawar.navy.mil
> _______________________________________

