From: "Denis Serebro" <ds@sendmail.ru>
Subject: Firewall for Local Machine
Date: Tue, 15 Jul 2003 17:50:41 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c34ad8$153b3920$6e20a8c0@ds>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


  Hello,

  I'm writing application that catch connections from local host. 
  I try to use iptables for this. 
  
  I set up IP address of Gateway the same as IP address of local
machine.
  I also set up rule for NAT:

  /sbin/iptables \
           -t nat \
           -A PREROUTING \
           -p tcp \
           -i eth0 \
           -m multiport \
           -j REDIRECT \
           --destination ! 192.168.32.0/24 \
           --destination-ports 25,80,3128,110,119,143 \
           --to-ports 9001

  It is not work. Connection from local host to external host do not
forward.
  If I set up this host as gateway for remote machine it works fine.

  How could I forward connection from local host to predifined port on
local host ?

  Thanks in advance,
  Denis Serebro


