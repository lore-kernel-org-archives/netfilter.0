From: Arthur Kerpician <arthur@bluechip.ro>
Subject: selective port forwarding
Date: Wed, 09 Jun 2004 22:48:46 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C7699E.7060806@bluechip.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I have this very simple network layout:
1. Firewall server (host1.domain.com) with eth1 (external static IP) and 
eth0 (internal IP)
2. The firewall server do masquerading for LAN
3. Other server (host2) on LAN with eth0 (internal IP)
So, the only external IP is on the host1.domain.com.
I want to forward some of the ssh traffic to host2, based on the hostname.
eg:
when trying to ssh to host1.domain.com the firewall server (host1) will 
reply and
when trying to ssh to host2.domain.com the firewall server will forward 
the traffic to host2 inside the LAN

I  know that what I'm looking for has to do with DNAT, but I really 
don't know where to start. The DNS is configured to map host1.domain.com 
and host2.domain.com to the same external IP on host1.

Thanks,
Arthur


