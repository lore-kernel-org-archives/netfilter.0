From: "C.Rathnasinghe" <chamindar@sad.gov.lk>
Subject: Iptables ssh outgoing problem
Date: Thu, 29 Jan 2004 08:44:31 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <PJEOLDHINDKCFPBDLONJCECKCAAA.chamindar@sad.gov.lk>
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

Hi all

I'm having a problem with ssh out going from my workstations. Fire wall with
iptables two Ethernet for LAN and wan. I can do ssh from the fire wall but
from the LAN workstations it is not possible. I use ssh client software for
windows. do I need to set firewall ip and port at ssh client if so which
port.

$IPTABLES -A FORWARD -p tcp  -s 192.168.145.23  -d
**.***.***.***  --destination-port 22  -m state --state NEW -j ACCEPT

This is the command. Do I need to put at the beginning of the forward table?

any idea would be grateful.
thanks

chami


