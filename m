From: guillaume <guillaume.riviere@hcm.vsl-vn.com>
Subject: patch-o-matic and kernel 2.6.7
Date: Tue, 10 Aug 2004 10:16:22 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41183E06.8000908@hcm.vsl-vn.com>
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

Dear all netfilter users/developers,

I would like to "loadbalance" my 2 isp internets links
with a GNU/Debian (sarge) box with 3 NICs.

I read the linux.com.lb Howto (very good How to),
Now, I know how to put rules inside my NAT router for
this.

I have a some questions:

- What is the best way to patch my 2.6.7 kernel to add random and 
condition patch in iptables ?
I mean, do I have to do this from a iptables cvs or do I have to 
download a specific iptables
tarball version ?

Do I have to install iptables or just patch the one in my 2.6.7 kernel ?

- I would like to add a script to automaticaly detect a down line (with 
icpld) and change a file. And so, with the condition pach, decide for 
the routing of my packets to the second isp.

Is it a good way to do this ? Is there another way ?


Thank you in advance for your help on this,
Guillaume

