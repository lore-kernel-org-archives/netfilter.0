From: eduardg@mat.upc.es
Subject: Can iptables do this?
Date: Mon, 20 May 2002 12:23:17 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1021890197.3ce8ce9543f3e@wmail-mat.upc.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,

I want to built a network that allows http navigation to any host that is 
plugged on it, without any change on its configuration.

For example my network is 1.2.3.0 and I want that a host with an IP address 
10.9.8.7 can navigate. First of all, the host will send arp request to find the 
MAC of its DNS server (I'll have to redirect it to my DNS), then it will look 
for its default gateway, etc (I can't work with mobile IP nor change any host 
configuration).

Not any host is allowed to do this, only hosts with known MACs.


Has anybody implemented a solution for a similar challenge? Any idea?

Thank you in advance.


Edu

