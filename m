From: "Sadus ." <sadus@swiftbin.net>
Subject: Internal PC/external Gateway
Date: Sat, 14 May 2005 11:59:36 +0300
Message-ID: <1116061176.12835.20.camel@debianbox>
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

Hello,
So here's my current setup at home.
I control Provider 2. (which is not more than a simple box taking
internet from provider 1 and that internet sharing enabled, restricted
to the box' internal network and my IP which is on the external
interface).
I also control the Linux GW.

                                                                 
                                          +------------+        
                                          |            |       |
                                      ----+ Provider 1 +-------
        __                            |   |            |     /
  PC1__/  \_         +------+-------+ |   +------------+    |
  _/        \__      |              | |                    /
 /             \     |              | |                    |
| Local network -----+Linux GW  eth0|-                     |Internet
 \_           __/    |              | |                    |
   \__     __/       |              | |                    \
  PC2 \___/          +------+-------+ |   +------------+    |
                                      |   |            |     \
                                      ----+ Provider 2 +-------
                                          |            |       |
                                          +------------+        

In order to the connect to the internet, on my GW, i set the Provider
1's IP. and then PC1 and PC2 can access the internet after SNAT or
MASQUERADE on the GW. Since Provider 1 limits the speed on IPs, PC1 and
PC2 used to split and share the connection speed, so lets say Provider 1
gives me 40K, PC1 and PC2 have to share that speed.

What i want to do is let PC2 have as Gateway Provider 2, so that each PC
can have its own 40K.

What are the procedures to be taken?

Thanks,



