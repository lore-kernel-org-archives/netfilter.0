From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Someone is using too much bandwidth???
Date: Tue, 21 Nov 2006 13:13:12 -0500
Message-ID: <003f01c70d98$b4f1bd00$0419a8c0@fly>
References: <380-2200611221172226406@zamnet.zm>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <380-2200611221172226406@zamnet.zm>
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

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of lubasi
> Sent: Tuesday, November 21, 2006 12:22 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: Someone is using too much bandwidth???
> 
> Hello,
> 
> Indeed its true, and i dont know what machine it is. 

You could setup an iptables rule to log all traffic or do what I believe may
be simpler:  use tcpdump

Let's say you have two NIC's on your machine:


	// Internet // - [eth0] - [gateway] - [eth1] - // Internal Network
//

You can run tcpdump on your Internet Network:

	tcpdump -i eth1

If you've ssh'd to your gateway machine from your Internal Network, your
host and ssh information will also be spewed.  Probably not what you want.

A simple tweak will handle it:

	tcpdump -i eth1 not host your.IP.address.here

The above should give you some quick answers.

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)


