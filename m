From: Gavin Hill <gavin@beerygaz.com>
Subject: iptables & TFTP
Date: Thu, 24 Jun 2004 17:50:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6.1.1.1.2.20040624175025.0213f950@lucy>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to get a device to TFTP to a server through my iptables firewall 
configured to perform NAT masquerading.

The firewall itself can TFTP without a problem, but any of the machines on 
the inside cannot.

After much reading I see that there was a POM patch available to fix a TFTP 
issues in iptables 
(http://www.stearns.org/pomlist/20030101-output/pom-oldnat.html#tftp)  I've 
read as much documentation as I can on POM and its use, but the latest POM 
patches I downloaded don't seem to have anything on the TFTP patch 
(patch-o-matic-20031219.tar.bz2).  Can you help shed some light on my 
problem please?  I'm pretty new to iptables, so please be gentle.

Fedora Core 2 2.6.6-1.435 on Intel hardware
iptables-1.2.9-2.3.1

Thanks,
Gavin 


