From: MKS <rekordmeister@gmail.com>
Subject: packets to local addresses
Date: Fri, 6 Apr 2007 12:22:37 +0000
Message-ID: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=D6VQeFtjuBtQ84mmPqjtdjU//tDFTME3IL687aEO1/6UMqsv3UO0zuBdLXxqlyx5wNWcB3vxyw2LqqjRTPUkMcvqgeszc8/3tFuPAyMaWgkIp/EAdZNLeVhTFjPkfY2ZJSoqoImGldkrnPDbJtNcUK9OATGqVFegT8Eyz7CmzwM=
Content-Disposition: inline
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

Hello list

I have a scenario the a computer has 2 PPP connections, where the
computer is the ppp client.

$ifconfig

ppp0   inet  10.0.0.1 p-t-p  192.168.1.1 mask 255.255.255.255

ppp1 inet  10.0.1.1 p-t-p 192.168.1.1 mask  255.255.255.255

for testing purpuses I want packets from ppp0 to ppp1 to actually go
over the physical connection

e.g.

ping  10.0.0.1 -I ppp1 should send the packet over the ppp1 (and out
underlyging physical interface eth0) and it should arrive on the ppp0
interface. (routing is taken care of at the ppp server)

This proably isn't a netfilter issue(?) but I was hoping that some
networking guru would have a solution for me;)

route
Destionation     Gateway      Genmask       iface
  192.168.1.1              *            255.255.255.255  ppp0
 192.168.1.1              *            255.255.255.255   ppp1
0.0.0.0                      *             0.0.0.0                  ppp0
0.0.0.0                      *              0.0.0.0                  ppp1

regards

Mks

