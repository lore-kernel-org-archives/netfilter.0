From: "Zander Subatomic" <zander@subatomic.org.uk>
Subject: firewall script placement
Date: Sun, 19 Jan 2003 13:04:29 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00d601c2bfbb$4d85a930$0401a8c0@darthvader>
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

ok this may sound like a silly question but where do I put the script?? I'm
running 7.3 RedHat and before I used to just write the script in a file and
then copy & paste it into a command line for the initial creation and then
use the iptables-save to /etc/sysconfig/iptables which worked fine for it to
be loaded on a reboot. Now I have a larger, more complex rule set I thought
I'd finall write a script for it but I've only got a slight understanding of
the start up process.

Do I need to put the script in the /etc/rc.d/init.d/ directory and then
create the startup/kill links in the /etc/rcX.d/ directories by hand or can
I just put a:

# chkconfig: 2345 <one above iptables start number> <one below iptables kill
number>

Could I change the line: IPTABLES_CONFIG=/etc/sysconfig/iptables in
/etc/rc.d/init.d/iptables script to my script? I'm assuming though it would
have to be in the format of the iptables-save command so wouldn't work? I
have looked around the place and previous posts but have never seen this
mentioned.

Or am I way of the mark? :o)

cheers

Zander


