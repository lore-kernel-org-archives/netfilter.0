From: alex <alex@bennee.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: 13 Nov 2002 22:47:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037227657.8028.36.camel@trent.nin>
References: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
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
To: Doug Watson <doug@1stbooks.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2002-11-13 at 14:34, Doug Watson wrote:
> If there really is a bug in ip_conntrack
> that makes me unfortunately skiddish about 
> continuing on with netfilter/iptables as a 
> viable solution for my company. Yet it seems 
> like many people have implemented this and have
> not seen these types of problems.

Agreed. I finally solved my problem which was due to me not allowing
ICMP packets to sent out the OUTPUT chain for established connections
that where being forwarded. My bad, *not* a conntrack problem, it just
seemed that way at the time.

> I have run the script that you sent me several times.
> Attached is a sample output from it. I don't believe that
> I am seeing anything too strange, but I do have 1 question.
> in the following line which you will see in the attached file
> what does the (policy ACCEPT 4 packets, 284 bytes) mean?
> Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)

Your attachment seems to of been filtered out. The policy lines mean
that no rules in the chain matched and therefor the default policy took
effect. It is usually recommended to have a default DROP policy if your
being paranoid and explicitly allow the connections you want to come
through. However as I learnt the hard way you have to make sure the
related traffic is also allowed through. The ICMP packet that bit me was
due to fragmentation being required but not possible on the gateway,
probably a symptom of the fact my two interfaces (ppp and eth) had
different MTU's. 

> Is that the total number of packets to traverse the OUTPUT 
> chain or it he number of packets ACCEPTED by the policy for the 
> OUTPUT chain? Or something else?

Just the packets that defaulted to the policy, the other counts will be
against each rule itself.

-- 
Alex
http://www.bennee.com/~alex/


