From: John Bleichert <syborg@stny.rr.com>
Subject: routing game packets
Date: Fri, 4 Oct 2002 14:42:56 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210041440270.8805-100000@janeway.vonbek.dhs.org>
Reply-To: John Bleichert <syborg@stny.rr.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello All

I have several PCs behind an old box functioning as my firewall. I 
use NAT to provide internet access through the firewall. I also do 
some basic port forwarding to allow SSH and HTTP into my network 
from outside. Note that the external box, gamebox and firewall are 
all different hosts.

Now, I'm trying to setup incoming and outgoing traffic correctly
to play a game. The game's website specifies these ports:

* Outgoing:
   src port: 5120-5129
   dst port: 5121-5300
   
* Incoming: 
   src port: 5121-5300
   dst port: 5120-5129
   
Now, for incoming packets, I have:

   iptables -A PREROUTING -t nat -p udp \
      -d ${external} --dport 5120:5129 -j DNAT --to ${gamebox}
	  
Do I really need to specify the --sport for incoming? Or will the 
NAT'd packets retain that src-port data?

And do I really need to do anything for outgoing packets? As long
as they are not blocked, should it work fine?

Any info is appreciated. ( I have nobody else with the game to
test this with so it makes it rather hard to debug via repeated hacking 
;-)

Thanks - JB


#  John Bleichert 
#  http://vonbek.dhs.org/latest.jpg


