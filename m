From: Jason Opperisano <opie@817west.com>
Subject: Re: Port Forwarding Problem
Date: Fri, 15 Apr 2005 10:40:38 -0400
Message-ID: <20050415144038.GA6063@bender.817west.com>
References: <425F98B0.7040303@wan4u.co.za>
	<20050415084039.7032.qmail@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050415084039.7032.qmail@arcoscom.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, Apr 15, 2005 at 10:40:39AM +0200, Samuel D=EDaz Garc=EDa wrote:
> Without having a look into your scripts, I think you need:
>=20
> 1) Allow INPUT into filter table to the port.
> 2) Allow FORDWARD into filter table to the redirected conection.

that's not exactly sagely advice.  in a port-forwarding situation, all
you need is the nat PREROUTING DNAT rule and a filter FORWARD rule.
since the destination IP is translated "prerouting" the translated
packet will never traverse the filter INPUT chain.

three line guide to "port-forwarding:"

  iptables -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 800 \
    -j DNAT --to-destination $INSIDE_HOST

  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  iptables -A FORWARD -i $EXT_IF -p tcp --syn \
    -d $INSIDE_HOST --dport 800 -j ACCEPT

-j

--
"Brian: She's a whiney little runt isn't she?
 Brian: What? I said runt."
        --Family Guy

