From: "Wei koong Chai" <eem1wc@eim.surrey.ac.uk>
Subject: [newbie]: Help on intercepting packets
Date: Tue, 11 Jun 2002 16:04:35 +0100 (BST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <1513.131.227.136.10.1023807875.squirrel@ike.ee.surrey.ac.uk>
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

Hi...

I'm new to Netfilter. Hope to get some help here. I have a bridge with eth0 
and eth1. 
                      +--------+ 
          ------ eth0 | BRIDGE | eth1 ------
                      +--------+

I need to intercept all the packets that come through both interfaces and 
pass them to the userspace (QUEUE target)... how can i do this?

I am currently using
[1] RH 7.2 with kernel 2.4.18 (kernel patched with brctl's netfilter patch 
bridge-nf-0.0.7-against-2.4.18.diff)
[2] brctl (bridge-utils-0.9.5)
[3] iptables 1.2.5

Any help would be greatly welcomed. Thank you.


-- 
Wei Koong CHAI            
CCSR
University of Surrey
United Kingdom


