From: jo@neolabs.be
Subject: define 'connections'
Date: Sun, 01 Feb 2004 23:32:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402012232.i11MWZu04330@neo1.neolabs.be>
Reply-To: jo@neolabs.be
Mime-Version: 1.0
Content-Transfer-Encoding: binary
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

is this correct : 

when you are SNAT-ing and using a statefull firewall, iptables must
manage 2 different 'states' :

- the connections that went out so incoming response packets are matched
to the correct outgoing request packets

- the states of the state module meaning a list of the connections so
incoming responste packets are ALLOWED to go back in

I guess if you are doing SNAT with an empty filter table, you only have
the 'states' of the first kind, right?

Which one of these do we actually see in /proc/net/ip_conntrack ? Are
these the SNAT-connections or the states from the state module? And where 
do I see the others? Where can I find the default lifetime for both?

Thanks

Jo

NEOlabs - http://www.neolabs.be - mailto:info@neolabs.be

