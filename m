From: ISPList John <john.friel@FrielTek.com>
Subject: RE: DROP command
Date: Thu, 3 Jul 2003 15:58:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6B61CBDA8C62344EB172855F4D94D74C047DD0@alpha.frieltek.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Switch the order of the lines around.  Your packets are getting DROPPED
before the ACCEPT can see them.  <smile>

John

> Hi folks,
> 
> I have a Linux box firewall (iptables 1.2.7a) with NAT/MASQUERADING.
> How I can block all local network access to my firewall excluding some
> local[John Friel III]  IP addresses?
> I tried these command but it doesn't work:
> 
> /usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.0/24 -j DROP
> /usr/local/sbin/iptables -A INPUT -i eth2 -s 10.105.105.20 -j ACCEPT
> 


