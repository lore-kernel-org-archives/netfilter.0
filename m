From: "Sandy T. Santos" <sandy@bulacan.gov.ph>
Subject: nat on multihomed server
Date: Sat, 24 Jan 2004 11:35:22 +0800 (PHT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1164.203.131.168.150.1074915322.squirrel@www.localgovernance.net.ph>
Reply-To: sandy@bulacan.gov.ph
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
To: netfilter@lists.netfilter.org

our campany has two internet links from different isp's. we then use both
of these to host the company's webserver. what i want is that the
webserver maybe accessible by coming from my isp1 link or my isp2 link. i
know that i need to set up my dns to have two ip addresses that points to
my linux box and then DNAT that connection towards my webserver. what i
don't know is what's the iptables script gonna look like for the SNAT
reply. how would i be able to determine that the request that came in to
my webserver originated from my isp1 or isp2 link  so that the reply would
be SNAT'ed to that interface?

should i just make two SNAT  that replies to the request irregardless of
the destination address? ex. iptables -t nat -A POSTROUTING -s 192.168.x.2
--sport 80 -j SNAT --to-ip (ip facing isp1) and  iptables -t nat -A
POSTROUTING -s 192.168.x.2 --sport 80 -j SNAT --to-ip (ip facing isp2)

other suggestions are welcome.

-- 
Sandy T. Santos <sandy@bulacan.gov.ph>
Provincial Information Technology Office
Provincial Government of Bulacan
Malolos, Philippines


