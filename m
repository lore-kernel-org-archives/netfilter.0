From: Techside Security <security@techside.it>
Subject: 2 Internet connection and one local network
Date: Thu, 04 Jan 2007 10:37:08 +0100
Message-ID: <459CCAC4.8010007@techside.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
in my company I have to switch to another provider and for a while I
have to maintain both the internet connection.
I have 2 server that is reachable from internet that is natted 1:1 with
local ip.


INTERNET OLD (32 public ip)	INTERNET NEW (32 public ip)
	|			|
	|			|
	-------------------------
	|			|
	|	FIREWALL	|
	|			|
	-------------------------
		|
		|
		LAN (private network)


Now, the firewall nat all the connection from static ip to local ip for
the 2 server (WEB, MAIL) and for the navigation of the client.

public ip 1 -----> FRW  ------> local mail server ip
public ip 2 -----> FRW  ------> local web server ip

client navigation ------> FRW --------> default public ip (! mail,! web)


The problem is that I can't let to be reachable the server from both
internet connection. Now work only for one connection (with iproute2 and
rules) based on the source local ip of the server.

I have tried with MARK, CONNMARK, CONNTRACK but I'm confused about it.
There is a way to make this working ?

All info are very appreciated.
Thanks.


