From: <yves@famillemetivier.net>
Subject: H323 and Traffic Control
Date: Fri, 25 Oct 2002 09:33:36 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <64227.193.110.152.118.1035531216.squirrel@munshine.famillemetivier.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: kadlec@blackhole.kfki.hu
Cc: netfilter@lists.netfilter.org

Hi!

I recently installed h323 netfilter extension on my home
firewall/gateway and it works fine! Thanks!

But I have a problem with traffic control :
I want to give highest priority to real time traffic, like h323.

I use HTB queuing discipline with four different priority classes. I use
packet marking in netfilter through the mangle table and fw mark option
in "tc filter add" to send packets in one of the four classes depending
on the mark

I was expecting that h323 netfilter module should mark all h323 traffic,
including RTP and RTCP UDP packets, but it seems that it only marks
packets from known ports (those explicitely declared in iptables) and
not UDP related packets.

Is my analyse right?

Thank you in advance for your answer.

Regards

Yves




