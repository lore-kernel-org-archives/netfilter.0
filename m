From: "Michael Tedesco" <mtedesco@broadbandmaritime.com>
Subject: Ip packet reduction.
Date: Mon, 10 Jan 2005 11:56:55 -0500
Message-ID: <200501101656.j0AGuw1D078849@jkcpub.iserver.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello Everyone

I have going to have a lot of traffic on my system in the future.  I am
logging all the packets in iptables.  What I would like to do it is only log
the first 20(number is arbitrary) packets.  EX. I have an incoming
connection from host X to anywhere and I want my firewall to log the first
20 packets.  If another connection comes in from host Y the same thing will
take place.  My goal is to reduce my log file. Also it seems that the 3
packet is the same as the 15 or 20 or 30.  Can anyone help me out.  

Mike 


