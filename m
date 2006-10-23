From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Blocking MSN
Date: Mon, 23 Oct 2006 11:52:20 -0400
Message-ID: <008401c6f6bb$39ad1700$0419a8c0@fly>
References: <c544f7190610230845uf32bd1fka58f02f9b39cd533@mail.gmail.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c544f7190610230845uf32bd1fka58f02f9b39cd533@mail.gmail.com>
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
To: 'Facundo Barrera' <facubarrera@gmail.com>, netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Facundo Barrera
> Sent: Monday, October 23, 2006 11:46 AM
> To: netfilter@lists.netfilter.org
> Subject: Blocking MSN
> 
> Hi list:
>          I need to block MSN to certain IP's of my LAN, i'm using
> iptables on Slackware linux, please can u help me, or send me any link
> to read about it.

Hi,

MSN is devious as it'll use different ports if you block the port it
typically uses.

What you'll want to do is use L7 (layer 7) filtering in order to identify
MSN and block it.

This will require you have the kernel sources for your kernel and to patch
it as well as iptables.  It sounds difficult but it's not.

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)


