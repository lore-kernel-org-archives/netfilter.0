From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bridging firewall setup
Date: Tue, 16 Dec 2003 17:07:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312161707.26462.Antony@Soft-Solutions.co.uk>
References: <3FDF38FF.3090109@wavetex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FDF38FF.3090109@wavetex.com>
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

On Tuesday 16 December 2003 4:55 pm, Chris Brown wrote:

> Hi all, new to the list. I'm trying to get a bridging firewall setup on
> a RH 9 box and I'm not having much luck. The bridge itself works fine
> but when I try to add rules using netfilter they seem to be ignored and
> packets I'm trying to block go on through.
>
> I decided to start simple by blocking some (presumably) msblast traffic
> on port 135. From the HOWTOs I've been reading all rules on the bridge
> should be in chain FORWARD so I did:
>
> iptables -F
> iptables -X # RH has some user-defined chains and i just dumped those
> iptables -A FORWARD -p udp --dport 135 -j DROP
> iptables -A FORWARD -p tcp --dport 135 -j DROP
>
> Nothing ... traffic still gets through ... so I explicitly added the
> interface
>
> iptables -i br0 -A FORWARD -p udp --dport 135 -j DROP
>
> Still nothing.

I don't know the answer to your question, but in situations like this I always 
think it's a good idea to turn on some LOGging so you can see where the 
packets are, and then you can try filtering them.

One thing you could do straight off is just request a detailed listing of the 
chains, to see if you have any packet counts at all:

iptables -L -n -v -x

will print out the filter tables in the INPUT, FORWARD and OUTPUT chains, and 
you should see from the byte & packet counters whether packets seem to have 
been going past.

You can do the same thing with the nat tables to see what happens just before 
& after the above:

iptables -L -t nat -n -v -x

However, if you simply put a LOG rule into all five chains, and then send some 
packet through the bridge, see what gets logged where:

iptables -I INPUT -j LOG
iptables -I FORWARD -j LOG
iptables -I OUTPUT -j LOG
iptables -I PREROUTING -t nat -j LOG
iptables -I POSTROUTING -t nat -j LOG

Let us know what you find....

Antony.

-- 
Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

                                                     Please reply to the list;
                                                           please don't CC me.


