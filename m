From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and dns from a windows farm
Date: Thu, 12 Feb 2004 09:19:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402120919.58632.Antony@Soft-Solutions.co.uk>
References: <F22386C3FEB012449238672E38ED61E71642F2@overlord.overturemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F22386C3FEB012449238672E38ED61E71642F2@overlord.overturemedia.com>
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
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>

On Thursday 12 February 2004 8:54 am, Fritz Mesedilla wrote:

> Greetings friends,
> I'd like to ask for help on the rules that I need to allow windows farms
> behind a linux firewall be able to perform dns lookups. For example, open a
> command prompt, type nslookup, get the dns server and perform a query from
> there.

DNS uses TCP & UDP destination ports 53.

Surely even Microsoft can't find a weird way of doing that!?

Therefore your firewall should need no special rules to allow what you 
describe above, other than what you need anyway to allow normal name 
resolving to work for web browsing, email collection, etc:

iptables -A FORWARD -i $INT_IF -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -i $INT_IF -p udp --dport 53 -j ACCEPT

If that doesn't work, don't forget the standard trick of putting a LOG rule at 
the end of your FORWARD chain, try the nslookup (which will fail) and then 
look at the packets which got LOGged from the IP address you attempted the 
nslookup.   This will tell you what type of packets they were, and you can 
add a rule to ACCEPT them.

Antony.

-- 
There are two possible outcomes:

 If the result confirms the hypothesis, then you've made a measurement.
 If the result is contrary to the hypothesis, then you've made a discovery.

 - Enrico Fermi

                                                     Please reply to the list;
                                                           please don't CC me.


