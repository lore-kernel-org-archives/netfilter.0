From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: conntrackd
Date: Tue, 7 Aug 2007 17:00:05 +0200
Message-ID: <00eb01c7d903$a447d9d0$0b0ffe0a@NS006819>
References: <00d601c7d8f8$6d082d90$0b0ffe0a@NS006819>
	<46B881A6.4030508@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B881A6.4030508@netfilter.org>
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
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote:
> Rob Sterenborg wrote:
>> # conntrackd -C /usr/local/etc/conntrackd/conntrackd.conf
>> ERROR: conntrackd cannot start, please check the logfile for more
>> info 

[...]

> Extracted from conntrackd.conf:
> 
>         Multicast {
>                 IPv4_address 225.0.0.50
>                 IPv4_interface 192.168.100.100 # IP of dedicated link
>                                     ^^^
> Did you setup an interface with this IP? Otherwise the multicast
> sender won't work, i.e. your dedicated link (ethX) must use the IP
> 192.168.100.100.

Hmm. Of course.
Sorry, I missed the obvious..

> BTW, please use latest official releases.

Will do.


Thanks,
Rob



