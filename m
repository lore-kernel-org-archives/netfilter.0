From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: Reg iptables Connection tracking
Date: 14 Jan 2003 15:09:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042553358.464.246.camel@xbox>
References: <4223A04BF7D1B941A25246ADD0462FF5683717@blr-m3-msg.wipro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4223A04BF7D1B941A25246ADD0462FF5683717@blr-m3-msg.wipro.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Amit Kumar Gupta <amitkumar.gupta@wipro.com>
Cc: netfilter@lists.netfilter.org

Amit,

This looks like a bug, so I guess you had better take this
report to netfilter-devel with as much info as possible.

Could you also cat a full ip_conntrack to a temp file
and put it somewhere online to accompany your bugreport.

Reporting this to netfilter-devel doesn't guarantee that
you will get a quick solution to your problem
(your setup is quite different from most people's...),
but at least it could be put in the KNOWN-BUGS section
so someone could eventually get around to fixing this...

Regards,
Filip

On Tue, 2003-01-14 at 13:56, Amit Kumar Gupta wrote:
> 
> Hi List,
> 
> Again Posting the same question ON the list As I have tried many ways
> and didn't get any clues.
> 
> As soon as I ping from inhome to the RG's internal, It just keep filling
> the ip_conntrack file and it goes beyond ip_conntrack_max entries. I
> don't know why Internal address is not replying. 
> 
> If Any clues, Please Help.
> 
> Thanks & Regards,
> Amit
> 
> -----Original Message-----
> From: Amit Kumar Gupta 
> Sent: Saturday, January 11, 2003 10:37 AM
> To: Athan
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Reg iptables Connection tracking
> 
> Hi,
> 
> I am using Embedix platform in which If I enable CONFIG_SYSCTL, the
> image doesn't come up on the H/w. So I have to disable this.( There has
> been some changes in the Kernel to suit this which works fine). Now in
> conntrack module I don't have this option so my conntrack ctl_table will
> not be registered woth ipv4 table. So I was hardcoding the value of
> ip_conntrack_max? Whether it will help?
> 
> Another issue is I don't have enough memory on the board to have sysctl
> command.
> 
> Can you suggest something which I can do?
> 
> Regards,
> Amit
> 
> 



