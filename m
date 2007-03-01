From: Nandan Bhat <nlbhat@gmail.com>
Subject: Help with Samba using iptables
Date: Thu, 01 Mar 2007 18:19:03 +0530
Message-ID: <45E6CBBF.3040406@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:disposition-notification-to:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=kPB4uRYTt/wiApWjR6XH/m7y6AZXxcGk0bcoMOWcIzR5OOl95fJ2mN3GiwJ23jzOSEgPAdo6ee5X0INuowgTCq2hjdDnO8yUxdMRglRTorgpZHCglv2fk7wg+ZWfy+nF7plj1YtNuMW21cYdRDMiTTYTEl6LvM0PbcczAucQMXw=
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I am hoping to get some help with some iptables. I am a newbie to all 
this; please bear with my language and detail.

I have two networks 192.168.1.0 and 192.168.0.0

192.168.1.0 is my LAN. It has a Fedora Core 5 machine with 192.168.1.6 
on eth0, running  samba and iptables among other services. 192.168.1.6 
is the WINS server on the network. I don't know if it is right but I 
have made it the local master and domain master. There is no domain in 
use on the network. I have seen an improvement in the LAN browsing after 
using this setup.

I have one CAT-5 cable coming from 192.168.0.0 network and my Fedora 
machine is connected to it on eth1. It has the fixed IP 192.168.0.176. 
In my iptables setup, I have allowed TCP ports 139, 445 and UDP ports 
137, 138 (regardless of source/destination/interface/IP) to be accepted 
in INPUT chain.

The status is that I am able to see my workgroup in 192.168.1.0 from 
within 192.168.0.0 network with all machines listed, but I can access 
only my Fedora server that is part of both networks. In my network, I 
can see all workgroups in 192.168.0.0 network but not see any host on 
it. On the Fedora machine, I am able to use smbclient to browse hosts on 
192.168.0.0 network. My conclusion: nothing is routing smb packets from 
hosts (other than my server) in 192.168.0.0 to 192.168.1.0 and vice versa.


My question: Is there a way I can get hosts on 192.168.0.0 and 
192.168.1.0 by using iptables alone?

Regards,

Nandan Bhat

