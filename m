From: Lorenzo Rossi <condor_rl@libero.it>
Subject: Connection states information tables
Date: Tue, 21 Sep 2004 20:55:00 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040921185500.GB16833@tranquillitatis.dns2go.com>
Reply-To: condor_rl@libero.it
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi,
i have a question concerning the tables where are maintained the
informations about the connections state.
I configured my firewall script with the following lines, to permit
the SSH traffic originated from the protected zone to go to Internet.

iptables -A TCP_IN -i $INTERFACE -p tcp --sport 22 -m state --state
ESTABLISHED -J ACCEPT

iptables -A TCP_OUT -o $INTERFACE -p tcp --dport 22 -m state
--state NEW,ESTABLISHED -j ACCEPT

The custom chain TCP_IN is listed in the default INPUT chain.
The custom chain TCP_OUT is listed in the dafault OUTPUT chain.
The dafault policy for the INPUT and OUTPUT chains, as you can
imagine, is to DROP.

My question is:
How many state tables are used? one table for each main chain?
One for INPUT and one for OUTPUT?

I'm a bit confused..... :)

Thanks
Lorenzo

