From: rsnel@cube.dyndns.org
Subject: 26sec+forwarding, bug or PEBKAC?
Date: Thu, 31 Mar 2005 22:16:40 +0200
Message-ID: <20050331201640.GA1401@cube.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello list,

I hope this is the right list, as my problem appears to be about both
iptables and (native (as in: managed with setkey)) IPSec.

Short version: 

packets from ipsec tunnel seem to get lost before they enter the the 
FORWARD chain with kernel 2.6.11. There is no problem with 2.6.8-2-k6 
(Debian kernel with 26sec) and there is no problem with ipsec turned 
off.

Long version:

Two networks:

192.168.2.0/24 wired home network
192.168.3.0/30 wireless network

Three hosts

cube, router/firewall: eth1 192.168.2.2 wlan0 192.168.3.1 eth0 82.157.. 
eniac, workstation: eth0 192.168.2.1 
toppie, laptop: wlan0 192.168.3.2 

On 192.168.3.0/30 ipsec is used, relevant excerpt: ipsec.conf (cube):
spdflush;

spdadd 192.168.3.0/30 0.0.0.0/0 any -P in ipsec
        esp/tunnel/192.168.3.2-192.168.3.1/require;

spdadd 0.0.0.0/0 192.168.3.0/30 any -P out ipsec
        esp/tunnel/192.168.3.1-192.168.3.2/require;

the firewall on cube is configured as follows (only
for testing, the usual config is more complicated but it
exhibits the same problem).

all the policies are 'ACCEPT'
and traffic from eth0 is DROPped at INPUT (and forwarding
is enabled at /proc/sys/net/ipv4/ip_forward).

cube and toppie can ping eachother, cube and eniac also. But eniac and 
toppie can't ping eachother.

For example:

eniac pings toppie: (REQ=echo request, RPL=echo reply and ESP=encryped 
packet) the log is aquired on cube by prepending a LOG target to all 
chains using a script much alike 
http://iptables-tutorial.frozentux.net/scripts/rc.test-iptables.txt 
and by removing information that I think isn't important, to make it 
fit on 80 cols

Eniac sends an echo-request.

REQ mangle PRE_R:IN=eth1 OUT= SRC=192.168.2.1 DST=192.168.3.2 LEN=84 
REQ nat    PRE_R:IN=eth1 OUT= SRC=192.168.2.1 DST=192.168.3.2 LEN=84 
REQ mangle FWD:IN=eth1 OUT=wlan0 SRC=192.168.2.1 DST=192.168.3.2 LEN=84 
REQ filter FWD:IN=eth1 OUT=wlan0 SRC=192.168.2.1 DST=192.168.3.2 LEN=84 

From here on the packet gets encrypted.

ESP mangle POST_R:IN= OUT=wlan0 SRC=192.168.3.1 DST=192.168.3.2 LEN=152 
ESP nat    POST_R:IN= OUT=wlan0 SRC=192.168.3.1 DST=192.168.3.2 LEN=152 

It leaves cube and toppie sends a reply.

ESP mangle PRE_R:IN=wlan0 OUT= SRC=192.168.3.2 DST=192.168.3.1 LEN=152 
ESP mangle INPUT:IN=wlan0 OUT= SRC=192.168.3.2 DST=192.168.3.1 LEN=152
ESP filter INPUT:IN=wlan0 OUT= SRC=192.168.3.2 DST=192.168.3.1 LEN=152

The packet gets decrypted.

RPL mangle PRERT:IN=wlan0 OUT= SRC=192.168.3.2 DST=192.168.2.1 LEN=84

After this the echo reply from toppie does not appear in the log; the 
packet does not enter the INPUT chain and it also does not enter the 
(expected) FORWARD chain.

This happens with linux-2.6.11 (vanilla). The ping works if IPSec is 
turned off (i.e. setkey -F -P on cube and toppie). And it also works 
in 2.4.27-2-k6 (a Debian kernel (which has 26sec patched in)). 

So, is it a bug, feature, or just misconfiguration? Can you reproduce?
I would appreciate any insight on this problem.

Thanks.

Greetings,

Rik.

