From: "Peter Kling" <pjotrekse@hotmail.com>
Subject: Reaching administration ip of ADSL modem from router and internal
	network
Date: Mon, 24 Oct 2005 11:08:10 +0200
Message-ID: <BAY18-F1F72898A8F1CBD26979F2A4770@phx.gbl>
Reply-To: peter@solvik.se
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

Hi everybody...

I am trying to reach the administration ip of my ADSL modem from the 
following router and from the internal network. I am not sure that this is 
possible at all, and am at a loss as to what to do in iptables to make it 
possible. Searching the archive did not give a clue.

The setup is as follows:
ISP(with dyn ip) <-> ADSL Modem(in bridge mode) <-> Asus router(with 
firewall) <-> Internal network

The service port of the modem is set up as 10.xxx.61.1
The internal network is 10.xxx.60.0/24
The router interface towards modem is vlan1, towards internal network is br0

I have experimented with setting a route like:
route -v add -host 10.xxx.61.1 gw 10.xxx.60.1 dev vlan1
but this does not work/does not seem to be enough.

Could you please help me with what I need to set up to  reach the modem from 
the internal network and/or from the router?

Everything else is working perfectly OK.


Thanks in advance.

Peter



