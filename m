From: Andy Furniss <lists@andyfurniss.entadsl.com>
Subject: Re: Simulating a "bad" connection.
Date: Sat, 05 May 2007 20:07:28 +0100
Message-ID: <463CD5F0.8090904@andyfurniss.entadsl.com>
References: <200705042201.21985.tommy@svearike.sytes.net>
Reply-To: lists@andyfurniss.entadsl.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200705042201.21985.tommy@svearike.sytes.net>
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
To: Tommy W <tommy@svearike.sytes.net>
Cc: netfilter@lists.netfilter.org

Tommy W wrote:
> Hi,
> I was just wondering if someone knows of a good way to simulate a "bad" 
> network?.
> I want high latency AND/OR high packet loss.
> 
> I was thinking along the lines  
> iptables -I INPUT -m random --average 90 -j DROP
> 
> but then I get libipt_random.so doesn't exist.
> I see that it is not included, how do you get it ?
> 
> kernel: 2.6.16-rc5
> iptables: 1.3.4
> 
> or is there some other more simple solution?
> 
> Thanks in advance
> /Tommy
> 
> 

http://linux-net.osdl.org/index.php/Netem

Is in kernel.

Andy.


