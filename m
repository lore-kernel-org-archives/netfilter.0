From: Mattia Martinello <liste@mattiamartinello.com>
Subject: Transparent gateway
Date: Thu, 18 Nov 2004 11:56:34 +0100
Message-ID: <419C7FE2.8060002@mattiamartinello.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,

I'm using a netfilter gateway between my LAN and the server on the DMZ.
This gateway makes a DNAT from 192.168.1.* to the external IP of the 
server on the DMZ.
Then, if I call http://[my external IP], the gateway makes a DNAT to 
http://192.168.20.x (the internal DMZ IP of the server), through the 
192.168.20.254 interface.

The problem is that when I call Apache on the server, Apache thinks that 
I am 192.168.20.254, not 192.168.1.x.
So, in the access logs the connection is made from the DMZ interface of 
the gateway and not from the real IP address of the client.
This make me some real problems about client autentication.

How I can I get my gateway transparent and solve this problem to let 
Apache to write the correct IP address of the client in the logs?

Thank you very much
Bye
Mattia.

