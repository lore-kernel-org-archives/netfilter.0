From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Traffic Mirroring for Debugging
Date: Fri, 22 Aug 2008 22:03:26 -0500
Message-ID: <48AF7DFE.1020306@riverviewtech.net>
References: <87vdxtwkh2.fsf@alamut.mobiliz.com.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87vdxtwkh2.fsf@alamut.mobiliz.com.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/22/2008 2:57 AM, Volkan YAZICI wrote:
> Gosh! Even couldn't manage to make DNAT for a single address work 
> properly. Any helps will be really really appreciated.

It won't help with the packet duplication, but I think it is related.  I 
think you will need to SNAT the traffic as it leaves 1.10 so that 1.2 / 
1.20 will reply back to 1.10 rather than directly back to the client.  I 
think that 1.2 / 1.20 is replying directly back to the client and the 
client is going WTF???  Why is 1.2 / 1.20 replying to me?  I have not 
started a connection with them.

As far as packet duplication, I'd start with ulogd or something like 
that.  I'm betting you are going to have to pass the packets to user 
space for the duplication.



Grant. . . .
