From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Port forwarding question
Date: Thu, 21 Sep 2006 22:23:17 +0200
Message-ID: <4512F4B5.6050206@rtij.nl>
References: <200609211555.39634.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609211555.39634.dyioulos@firstbhph.com>
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
To: Dimitri Yioulos <dyioulos@firstbhph.com>
Cc: netfilter@lists.netfilter.org

Dimitri Yioulos wrote:

>Hi, folks.
>
>Noob, question:
>
>I want to allow a vendor to access a piece of equipment on our LAN  
>(192.168.100.46) through port 4000 from outside via a server in our 
>DMZ (www.xxx.yyy.zzz).  While I should know how to do this, I'm not 
>100% sure.  Can someone help?
>  
>

In PREROUTING do a DNAT rule, in FORWARD allow traffic to 192.168.100.46.

>Oh, and separately, how would I allow that access only through the 
>vendor's ip address, if that were the way I decided to go?
>  
>

Add -s $VENDOR_IP to both rules.

HTH,
M4


