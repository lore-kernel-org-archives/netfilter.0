From: Jason Opperisano <opie@817west.com>
Subject: Re: After 14 hours of brainpain...
Date: Sun, 02 Jan 2005 20:36:58 -0500
Message-ID: <1104716217.6477.7.camel@hubcap.ljm.dom>
References: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E6A0AAEA-5D1F-11D9-83E1-000A95B981B6@knoxville.se>
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

On Sun, 2005-01-02 at 19:39, Andreas Pettersson wrote:
> ## WWW Forwarding ...
> iptables -t nat -A PREROUTING -d $INET_IP -p tcp --dport 80 -j DNAT 
> --to-destination 192.168.1.30
> iptables -A FORWARD -d $INET_IP -p tcp --syn --dport 80 -m state 
> --state NEW -j ACCEPT

the DNAT happens PREROUTING; which is before FORWARD--therefore, the
destination IP at this point is 192.168.1.30; not $INET_IP.

> iptables -t nat -A POSTROUTING -s 192.168.1.30 -p tcp --sport 80 -j 
> SNAT --to-source $INET_IP

this is unnecessary; as the reply packets part of the DNAT-ed connection
will automatically be SNAT-ed, as nat is stateful.

however--you do not have a rule that allows replies from the web
server--might i simply suggest:

  iptables -I FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

-j

--
"Well, I'm not calling you a liar, but... I can't think of a way to
 finish that sentence."
	--The Simpsons


