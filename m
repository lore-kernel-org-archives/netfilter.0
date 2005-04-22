From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: NAT problem when coming from private network
Date: Thu, 21 Apr 2005 22:39:30 -0500
Message-ID: <426871F2.9010700@riverviewtech.net>
References: <49795.72.11.67.10.1114115075.squirrel@72.11.67.10>	<200504212216.15006.Alistair@nerdnet.ca>
	<6.0.1.1.2.20050421193231.01d01a20@insight.ip3.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.0.1.1.2.20050421193231.01d01a20@insight.ip3.com>
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
To: Royce Kemp <rkemp@ip3.com>
Cc: Alistair Tonner <Alistair@nerdnet.ca>, netfilter@lists.netfilter.org

> at first this is what I thought the solution would be, but Mark Wells 
> said that his mail server is on the same subnet as the client machine 
> (192.168.1.8 and 192.168.1.34)... so why can't the mail server 
> communicate directly with the client machine? so packet go from client 
> to firewall and are redirected to the mail server.. then the mail server 
> will arp for 192.168.1.34 and return packet directly to him). is this 
> not possible?

No, this is not possible because the client will think that it is talking to the firewall and is getting a response back from the mail server which it was not talking to (in the client's mind).



Grant. . . .

