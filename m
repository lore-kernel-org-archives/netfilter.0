From: Philip Pemberton <usenet06@philpem.me.uk>
Subject: Re: Port forwarding fun (was NATing on a single interface?)
Date: Fri, 27 Oct 2006 21:26:11 +0100
Message-ID: <ehtq0l$2sm$1@sea.gmane.org>
References: <ehptuc$bo6$1@sea.gmane.org>	<ehql65$f08$1@sea.gmane.org>	<ehr6m6$v00$1@sea.gmane.org>	<ehrhod$17a$1@sea.gmane.org>	<ehsic6$has$1@sea.gmane.org>	<eht5oc$mte$1@sea.gmane.org>
	<ehtmuq$nf9$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehtmuq$nf9$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> # Forward some ports
> echo "Forwarding port 99 to 10.0.0.8:80"
> $IPT -t nat -A PREROUTING -p tcp -m tcp --dport 99 -j DNAT 
> --to-destination 10.0.0.8:80

Oh $CURSE. Forgot the FORWARD rule:

$IPT -A FORWARD -p tcp -d 10.0.0.8 --dport 80 -j ACCEPT

Now it works, and I'm a happy bunny once more. I would appreciate some 
constructive criticism relating to my iptables script though - possible 
security/style improvements, etc.

Spotted that on <http://www.hackorama.com/network/portfwd.shtml>. Found on the 
second page of results from a Google search for 'iptables DNAT port-forward'.

Thanks.
-- 
Phil.                         |  (\_/)  This is Bunny. Copy and paste Bunny
usenet06@philpem.me.uk        | (='.'=) into your signature to help him gain
http://www.philpem.me.uk/     | (")_(") world domination.
If mail bounces, replace "06" with the last two digits of the current year.


