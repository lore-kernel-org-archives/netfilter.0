From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Cloning Traffic had having it processed by two different hosts
 - TEE
Date: Wed, 23 Apr 2008 14:40:15 -0500
Message-ID: <480F909F.1050100@riverviewtech.net>
References: <480F2A96.3020603@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <480F2A96.3020603@rz.uni-karlsruhe.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/23/08 07:24, Bjoern Weiland wrote:
> Now I am wondering, if my undertaking is realizable and how it can be 
> done most efficiently... I am open for any hints, maybe there are some 
> other solutions as well...

I'm not sure if it will work or not, but have you considered using the 
user space daemons to process the traffic?  I think you can use the 
NFQUEUE (?) target to redirect the packets as they are to user space 
which could then send one packet on as is and duplicate and modify the 
second packet before sending it on.



Grant. . . .
