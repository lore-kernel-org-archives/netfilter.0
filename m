From: veera kumar <veera_kumar2983@yahoo.co.in>
Subject: RE: l7-layer
Date: Tue, 23 May 2006 10:12:23 +0100 (BST)
Message-ID: <20060523091223.31816.qmail@web8514.mail.in.yahoo.com>
References: <02BB8A4AC86C564C89C7F14CF98CE0C401276C@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C401276C@knowledge.wizdom.nu>
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
To: Sietse van Zanen <sietse@wizdom.nu>
Cc: netfilter <netfilter@lists.netfilter.org>

Hi zanen,
    Its good to see your reply.The Layer7-filter
feature works as a firewall and classifies packets
based on L7 information instead of port numbers(e.g
Suppose client use 1110 is a http port number).
You can find the L7 feature Documentation here.
http://l7-filter.sourceforge.net/

I dont need  generate traffic from real time(e.g ftp
ftp.some.where).I have to generate traffic fron nfsim
using the command gen_ip.

Thanks
veera
--- Sietse van Zanen <sietse@wizdom.nu> wrote:

> Hi Veera,
>  
> I would say, that doing an ftp ftp.some.where would
> generate traffic based upon the ftp appliaction.
> All the L7 information is included in the TCP/UDP
> packet which you are inspecting with your module.
>  
> Maybe you need to be a bit more specific about what
> you want to inspect/filter with your module and how.
>  
> Sietse
> 
> ________________________________
> 
> From: netfilter-bounces@lists.netfilter.org on
> behalf of veera kumar
> Sent: Tue 23-May-06 9:30
> To: netfilter@lists.netfilter.org
> Subject: l7-layer
> 
> 
> 
> Hi,
>   I have done a netfilter module Which is support to
> Layer 7.I can able to compile our module with nfsim
> and tested the other functionalities.I have to test
> the Layer7 feature with nfsim.How can i generate the
> traffic
> based on application (e.g.ftp,ssh) rather than port
> numbers.
> 
> I really appreciate your inputs here.;)
> 
> Thanks
> veera
> 
> Send instant messages to your online friends
> http://in.messenger.yahoo.com
> <http://in.messenger.yahoo.com/> 
> 
> 
> 
> 


Send instant messages to your online friends http://in.messenger.yahoo.com 

