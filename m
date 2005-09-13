From: lmarcilly@aressi.fr
Subject: Problem with iprange
Date: Tue, 13 Sep 2005 08:02:35 +0000
Message-ID: <DIIE.0000058F00005E01@smtp.aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi all,

i've got problem to use iprange with iptables...

iptables -V : iptables v1.3.1

When i try :

iptables -I INPUT -p tcp -m iprange --src-range 192.168.1.1-192.168.1.5 -j DROP

I've got this error:

iptables:  No chain/target/match by that name

but when it try :

iptables -I INPUT -p tcp -s 192.168.1.1

it works perfectly...

I've seen on the web that the iprange is built-in iptables... Moreover, when i try :

iptables -I INPUT -p tcp -m iprange -s 192.168.1.1-192.168.1.10 -j DROP

i've got this error message:

iptables v1.3.1: iprange match: You must specify '--src-range' or '--dst-range'
Try 'iptables -h' or 'iptables --help' for more information

but when i try iptables -h, there is no information about iprange...

Do you have any idea?? Is there a patch to apply in order to use iprange? Module to be load?

Thanks a lot for your help!

lm.




