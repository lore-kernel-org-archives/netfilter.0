From: Navneet Choudhary <navneetkc@gmail.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 23:04:39 +0530
Message-ID: <1dceb01205021309342656be17@mail.gmail.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
	<1108216901.4462.27.camel@hubcap.ljm.dom>
	<4f3930a705021214026db11902@mail.gmail.com>
	<420EB7C3.7040303@hotpop.com>
	<4f3930a70502121833627af1bd@mail.gmail.com>
	<420F404A.8090909@hotpop.com>
Reply-To: Navneet Choudhary <navneetkc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <420F404A.8090909@hotpop.com>
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
To: Georgi Alexandrov <tehlists@hotpop.com>
Cc: netfilter@lists.netfilter.org

> hola Josh,

hello list,
 
> I did a quick test:
> DROP policy on the INPUT chain, and flushed all the rules (as a result i
> couldn't even ping myself)

please refer my rules before quick test[below line from my original
mail's rule set might help you to ping you ping your system ?

-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT

> squid: standart debian/unstable package - unprivilleged user, port 3128.
> the result: squid is able to bind to his port fine, with DROP policy on
> the INPUT chain and no rules at all.

reverting to you all shortly with my detail test. 

> regards,
> Georgi Alexandrov

Regards,
Navneet

|Anytime you feel i need to understand | 
|a concept before i am eligible to get    |
|an answer i would be happy to know.  |
^*******************************************^

