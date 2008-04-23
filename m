From: "Leonid Zeitlin" <lz@csltd.com.ua>
Subject: Invalid SACK numbers in NAT'ed packets
Date: Wed, 23 Apr 2008 18:22:16 +0300
Message-ID: <funk78$srq$1@ger.gmane.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
I have the following issue that I need a comment on.

The setup. I have a Linux router with one NIC connected to a LAN and the 
other connected directly to a Cisco 800 Series router. The Cisco box is 
connected further to the ISP. The Cisco box creates an IPsec tunnel to a 
remote site. It also does SNAT on packets coming through it from the LAN to 
the remote site. It looks as follows:

LAN -> Linux router -> Cisco (NAT) -> IPsec tunnel -> remote site

The Linux router has the following IP Tables rules:

-A FORWARD -i eth0 -o eth3 -j ACCEPT
-A FORWARD -i eth3 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT

with the default policy for the FORWARD chain being DROP. Here eth0 is the 
LAN interface and eth3 is the interface that goes to the Cisco router. Thus 
packets coming from the LAN to the Cisco and further to remote site are 
allowed, as well as replies to them, but the remote site can't intiate a 
connection to the LAN. So far so good, we can connect from the LAN to the 
remote site successfully.

The problem. When uploading large files by FTP from the LAN to the remote 
site, the connection randomly stalls.

Analysis of tcp dumps shows that some ACK packets coming back from the 
remote site are not forwarded by the Linux box from eth3 to eth0. 
Apparently, Linux doesn't think they are part of the established connection. 
Adding this rule that lets all ACK packets through fixes the problem:

-A FORWARD -i eth3 -o eth0 -p tcp --tcp-flags ACK ACK -j ACCEPT

I want to understand why these ACK packets are not allowed by the original 
state match.

Further analysis of tcp dumps reveals the following. The Cisco router 
changes TCP sequence numbers when it does NAT. So, the sequence numbers and 
ACKs that go between the LAN and the Cisco box are not the same as the ones 
on the other side, between the Cisco box and the remote site. The problem 
is, the Cisco box does NOT change the sequence numbers within SACK TCP 
option! So, whenever a packet is lost, and the remote site sends an ACK 
packet that contains a SACK option, the Linux router sees a SACK option 
referencing a packet it never saw before. My guess is that this is the 
reason why the packet is not considered as belonging to an established 
connection by netfilter.

The questions:
1. Does my explanation look plausible? Can an invalid sequence number in 
SACK lead to the packet not being considered as belonging to an established 
connection?
2. Has anyone come across such issue with a Cisco hardware before? Can it be 
fixed by some configuration?
3. If not, can it be worked around at the Linux side; i.e. somehow ignore 
invalid SACKs or prohibit SACKs on this particular connection (I am 
reluctant to turn them off altogether with a sysctl).

Thanks a lot,
   Leonid 



