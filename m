From: Tomasz Korycki <engine2@flow.mine.nu>
Subject: Re: Packet Inspecting Filter with IPTables
Date: Thu, 26 Aug 2004 01:11:55 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <5.2.0.9.0.20040826010850.00b14b60@198.52.32.246>
References: <200408260451.i7Q4p0XH029352@flow8.flow.north.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200408260451.i7Q4p0XH029352@flow8.flow.north.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Jeremy Andrew <corporate@superonline.com>
Cc: netfilter@lists.netfilter.org

At 01:50 2004-08-26, Jeremy Andrew wrote:
>I wish to implement a feature on a linux box which I explained with detail
>in the following text;
>
>I have read about many different articles on how to take actions based on
>the contains of a packet. I think netfilter/iptables has support of what I
>wish to deploy on a Linux machine (kernel 2.4.20) acting as a gateway
>network node. I have not found enough information about the exact steps to
>be taken in order to;
>
>- Inspect each and every incoming packet for a specific port (ftp as an
>example), and then if the data packet contains a specific set of bits (ascii
>characters "GLOB" e.g), take actions based on a predefined rule (send a
>message to syslog) and then "drop" this packet.

That sounds an awful lot like a job for snort (www.snort.org) to me - did 
You look? And with ACID You would be able to do reports and what-not, 
too... Oh, and modify Your rules. Or, You can roll-your-own...

 >>>>>>>>>>>>>>>>> snip! <<<<<<<<<<<<<< 


