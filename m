From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: how to block kazaa ?
Date: Wed, 26 Feb 2003 05:20:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226052049.5c37c0a1.arnt@c2i.net>
References: <003d01c2dd40$fe922030$210aa8c0@sabirin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003d01c2dd40$fe922030$210aa8c0@sabirin>
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

On Wed, 26 Feb 2003 09:44:33 +0700, 
<inghau@perkom.co.id> wrote in message 
<003d01c2dd40$fe922030$210aa8c0@sabirin>:

> hello 
> 
> i have some problems in my lan environment. most of my clients using
> kazaa to dowmload mp3 and mpg files. these progams eating most of my
> small bandwidth so can i put some rules to "block" these kazaa and
> other p2p program ?
> 
> right now my linux boxes is just act as very simple NAT router using
> iptables
> 
> 
> thank you very much
> 

..'iptables -A FORWARD -p tcp -m tcp -i eth1 --dport $kaaza-ports \
-j REJECT', or expand it to 'iptables -A FORWARD -p tcp -m tcp -m \
multiport- d$destination -i eth1 -j REJECT --dports $kaaza-ports'

..ditto for other protocols.  Instead of "REJECT", there is also 
DROP, MIRROR, and my favorite, TARPIT, in Patch-o-matic.


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



