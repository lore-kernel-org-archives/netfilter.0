From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: to use or not to use stateful capabilities
Date: Mon, 5 Apr 2004 12:02:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051202.58228.Antony@Soft-Solutions.co.uk>
References: <20705.1081162183@zworg.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20705.1081162183@zworg.com>
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

On Monday 05 April 2004 11:49 am, __ Radien__ wrote:

> Dear All
>
>   For letting outside clients to access the webserver behind the
> firewall:
>
>   I want to know, what is the difference
> 1.   if I use connection states in rules tp accept for forwarding in the
> firewall rulset:
>
> Conn. State             -s                     -d                --proto
>   -sport        -dport      SYN   ACK
>
> New               outside_client    web_server         tcp       <1024
>        80     Yes   No

Why "source port <1024"?   I would have thought most often it will be >1024, 
although that's not always going to be true.

> Established   web_server       outside_client      tcp       80
>      <1024 Yes   No

I think you mean "SYN: Yes, ACK: Yes" here?

> Established   outside_client    web_server         tcp       <1024
>    80     No   Yes
> Established   web_server        outside_client     tcp       80
>      <1024 No   Yes
>
>
> 2.   or simple fwd rules:
>
> iptables -t filter -A FORWARD -p tcp -s $WEBSERVER --sport 80 -d $OUT -j
> ACCEPT
> iptables -t filter -A FORWARD -p tcp -d $WEBSERVER --dport 80 -s $OUT -j
> ACCEPT
>
>
> I have a little knowledge about statefulness of the firewall, and can
> not underestand what is the deference in such a case. I mean
> practically.

In this setup with only a single server behind the firewall, you are right in 
thinking there's not much practical difference between using the stateful and 
non-stateful versions of the rules.

However, once you've got five servers running behind the firewall (eg web, 
mail, ftp, dns, news), it's simpler to have one inbound rule per service plus 
one outbound rule for all the replies (- 6 rules) than to need one inbound 
rule plus one outbound rule per service (= 10 rules).

Also, stateful rules are much better for clients accessing the Internet, 
because it's impossible to think up a non-stateful rule which will allow 
replies inn to your network without also opening it up to port scanning 
attempts from people who use source port 80, 25, 53 etc for their port 
scanners.

Finally, some protocols such as ftp, irc etc are also very hard to support 
securely without using stateful rules.

So, in this simple case, pick whichever you prefer - no difference.

For a more complex situation, go stateful.

Regards,

Antony.

-- 
"Black holes are where God divided by zero."

 - Steven Wright

                                                     Please reply to the list;
                                                           please don't CC me.


