From: tamato@attbi.com
Subject: Iptables & Remote SSH Sorrows
Date: Thu, 10 Apr 2003 18:24:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E193gj0-0008Qi-00@kashyyyk.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have configured iptables to allow ssh connections.  However, no one is able 
to connect unless I add their IP address to the /etc/hosts file.  Since my 
remote useres are on dynamic IP's - their address changes each time they log in 
to their internet accounts.  

Is there a way to configure iptables or another system file that would allow 
ssh connections from any IP?

My setup:

  OS......: Linux Kernel: 2.4.18
  Distro..: RedHat 8.0 (2.4.18-27.8.0)
  Iptables: 1.2.6a-2

  [remote users]---->(internet)<----[linux box]

Iptables SSH command (loaded from /etc/init.d/iptables script):

   iptables -A tcp_inbound -p TCP -s 0/0 --destination-port 22 -j ACCEPT

Any insight or help would be much appreciated.

Thanks.

-tom-


