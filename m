From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: (no subject)
Date: Wed, 26 Jan 2005 11:26:56 -0500
Message-ID: <876ef97a0501260826514b150d@mail.gmail.com>
References: <20050126155823.97452.qmail@web52304.mail.yahoo.com>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050126155823.97452.qmail@web52304.mail.yahoo.com>
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
To: mohammad Mahbubur rahman <mahbub71@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Wed, 26 Jan 2005 07:58:23 -0800 (PST), mohammad Mahbubur rahman
<mahbub71@yahoo.com> wrote:
> Hi,
> I am working on an Adhoc network running kernel AODV
> version 2.1 (on Redhat linux kernel 2.4.20). The AODV
> is running fine. Now I am trying to queue some packets
> onto the user space for modification using libipq
> library. But incase of running the libipq example
> program, i have to load the ip_queue module by
> modprobe ip_queue first. When i load this module and
> running the example program, the machines are hanged.
> Can anyone please tell me why??
> 
> Can anyone pls suggest me how i can get some packets
> onto the user space for modification incase of ad hoc
> network???

AFAIK, the current Linux implementation of AODV uses ip_queue.
Therefore, due to the limitations of ip_queue, you can't then use
anything else that would use ip_queue while you're running that. Where
did you get your implementation? Is it this one:

http://user.it.uu.se/~henrikl/aodv/

or this one?:

http://w3.antd.nist.gov/wctg/aodv_kernel/

If its the latter, disregard all of the above.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

