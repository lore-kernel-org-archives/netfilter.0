From: DurgaPrasad Adusumalli <adusumallid@gmail.com>
Subject: port forwarding
Date: Wed, 23 Feb 2005 14:06:38 +0530
Message-ID: <75b657f405022300361fb12a98@mail.gmail.com>
Reply-To: DurgaPrasad Adusumalli <adusumallid@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am trying to use iptables firewall in an environment where there is
lot of incoming traffic destined to different web servers,ftp servers
running on different machine in LAN. I have done this using port
forwarding.

The problem I face with this is very frequently the rules go on and
off. They do not work but are listed when iptables -L -n command is
issued.

Can anyone please suggest any additional modules that I may need to
use apart  from ip_nat,ip_conntrack, ip_nat_ftp and ip_conntrack_ftp.

Thanks in advance.
Durga Prasad.

