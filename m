From: Jason Opperisano <opie@817west.com>
Subject: Re: MARKing question
Date: Mon, 31 Jan 2005 11:25:31 -0500
Message-ID: <20050131162531.GA24980@bender.817west.com>
References: <a0f69e5050131022966942181@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <a0f69e5050131022966942181@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

On Mon, Jan 31, 2005 at 03:29:32PM +0500, Askar wrote:
> hi list, 
> 
> I'm MARKing packets in PREROUTING of mangle with the below rule to
> route them from other route then the default route .(iproute2 +
> iptables)
> 
> $iptables -A PREROUTING -i eth0 -t mangle -s 202.xxx.xxx.0/24 -d 0/0
> -p tcp --dport 80 -j MARK --set-mark 4
> 
> What I want is to exclude a single IP from the above to be MARKed, i-e
> the particular IP packets goes through default route of the firewall
> machine not through iproute2 route.
> 
> Is this possible with iptables or I have to apply pom (extentions) to
> accomplished this?

two thoughts:  1) ACCEPT the packet from the "excluded IP" prior to the
mark rule or 2) reset the MARK on packets from the "excluded IP" after
the mark rule.

version 1:

  iptables -t mangle -A PREROUTING -i eth0 -p tcp -s $EXCLUDED_IP \
    --dport 80 -j ACCEPT

  iptables -t mangle -A PREROUTING -i eth0 -p tcp -s 202.xxx.xxx.0/24 \
    --dport 80 -j MARK --set-mark 4

version 2:

  iptables -t mangle -A PREROUTING -i eth0 -p tcp -s 202.xxx.xxx.0/24 \
    --dport 80 -j MARK --set-mark 4

  iptables -t mangle -A PREROUTING -i eth0 -p tcp -s $EXCLUDED_IP \
    --dport 80 -j MARK --set-mark 0

version 1 gets packets from $EXCLUDED_IP out of the mangle PREROUTING
chain as quickly as possible.

version 2 allows packets from $EXCLUDED_IP to continue to traverse
mangle PREROUTING in case you want to do other stuff to it.

which one is "better" would depend on your specific situation.

-j

--
"I saw this in a movie about a bus that had to SPEED around a city,
 keeping its SPEED over fifty, and if its SPEED dropped, it would
 explode. I think it was called, 'The Bus That Couldn't Slow Down.'"
        --The Simpsons

