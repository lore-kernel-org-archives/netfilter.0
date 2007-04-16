From: "Bury!" <bury1@wp.pl>
Subject: ip packet fields  modyfications
Date: Mon, 16 Apr 2007 16:58:22 +0200
Message-ID: <003901c78037$adb9cca0$0501a8c0@burywin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

hi!!!

I'm in the middle of writing program to changing source port in outgoing 
packets / destination port in incomings packets...
iit will me part of something bigger (my Master of IT Science) and will 
provides port spoofing :)

my problem is...
i want to catch outgoing packet to specifik IP:PORT and modyfie sourc port 
numer... and the same situation with destination port in incomming 
packets... i'll try to use libpcap / libnet but those API only copy packet, 
not recive it from. So my modufication is worthless....

mayby You can help me... i'm looking for lib, which support reciving, 
changing and reinjecting ip packet's...
i study libipq.. but i need netfilter module and iptables -A OUTPUT -p 
TCP/UDP -j QUEUE to do that.
is anywhere in the net something what i may use?

sorry for may bad english :)

Peter 


