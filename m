From: "Kleiner, Peter" <kleinerp@smbmicro.com>
Subject: Help with port forwarding
Date: Wed, 22 Oct 2003 12:41:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDAFEC98D318F74CA26B5A26F2B4965227C545@exchange.jfctechnologies.com>
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

Greetings,

I have two PCs that, software-wise are reasonably identical.  Both are 
RH9.0 with iptables 1.2.7a.

I have a script to set the rules for masquerading and port forwarding.
The script is identical, except that the internal address range is
different.

My problem is that port forwarding works on one PC and not the other.  I've
spent many hours trying to figure out what is wrong to no avail.  I was
wondering what other factors will affect iptables.

Anyway, here is the info on the the two PCs, which I'll call PC1 and PC2.
PC1 is the working one and PC2 is the non-working one.  Both PCs have
eth0 as internal and eth1 as external interfaces.

I've put the info that I thought was relevant here:
http://www.smbmicro.com/~kleinerp/iptables.txt

Please let me know if you require anything else.

Thanks in advance!!!
Pete

