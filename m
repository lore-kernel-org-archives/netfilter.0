From: Johan =?unknown-8bit?q?=D6hrn?= <johan_oern@hotmail.com>
Subject: Forward port to openvpn client
Date: Tue, 14 Aug 2007 23:59:56 +0200
Message-ID: <BAY113-F334B7FEC24D2CD5B0520D5E4DD0@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I want to forward port 3739 on my firewall (openvpn server) to an openvpn 
client on port 3739.

This is my setup:

firewall:
external interface: eth2
external ip: 87.251.222.104
openvpn interface: tun0

openvpn client:
ip: 10.0.10.6

I can't figure out how to do the forward. I've tried everything I could find 
on google and nothing seem to help. I can connect from the server to the 
client on port 3739 so it's not a firewall issue on the client side. Someone 
sugested that iptables might not be able to forward a port over an ipsec 
interface.

Can someone tell me if what I'm trying to do is possible and if so, how?

/ Johan

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


