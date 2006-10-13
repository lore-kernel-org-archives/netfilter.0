From: "Patrick Cummings" <cummingspatrick@hotmail.com>
Subject: Can't get access to local servers using external IP
Date: Thu, 12 Oct 2006 23:08:19 -0400
Message-ID: <BAY102-F34366D66CEBC07CEBB779FBC0A0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I've already posted this but it looks like it has been deleted or somehow 
was not sent.

I have setup a linux router for my network. Everything works well except one 
thing.
It has three network connections. One is the Internet, another is a bridge 
of network cards that is the LAN and the last one is a separate network used 
as a SAN.

The problem is that I can't access the local servers with the external 
Internet IP.
This worked before when I had my POS linksys router that I smashed into 
pieces after the linux router was setup because I hated it.
This creates some problems. For example, if I host something on my local 
webserver (192.168.0.2) and somebody links to it from a webpage on an 
external server and I click on it I can't get access. However it would work 
if I was not a the LAN. So if I replace the IP address in the link with the 
one of my LAN it will work. However that's a real mess, if there is a page 
with like 50 pictures the 50 pictures will load for everybody except the 
ones that are on the lan except if they were to click on each picture 
manually and edit the adress so that it contains the LAN IP.
Also I always need to log remotely to an outside computer to test if 
services are accessible with the internet IP.

If it can help, here are the scripts I use to configure IPtables:
(they are extremely hard to read....sorry)
http://etherealnet.servehttp.com/patrick/iptables-start
http://etherealnet.servehttp.com/patrick/iptables-start.conf

http://etherealnet.servehttp.com/patrick/ifconfig

I run Debian GNU/Linux with 2.6.8 kernel.
I wish there is a quick way to fix this since my previous crappy router did 
it so well.



