From: Martijn Lievaart <m@rtij.nl>
Subject: Re: ip routing after changing mac address to a virtual one
Date: Sun, 03 Dec 2006 23:03:54 +0100
Message-ID: <457349CA.9060006@rtij.nl>
References: <20061130164505.99758.qmail@web50103.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061130164505.99758.qmail@web50103.mail.yahoo.com>
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
To: first last <doctor_konkord@yahoo.com>
Cc: netfilter@lists.netfilter.org

first last wrote:

>Hi Mike,
>
>Yes, eth1 gets its IP address from DHCP server. DHCP
>server always gives me the same IP address because it
>knows my MAC address. So I only can get a different IP
>address by changing my MAC address.
>  
>

[ Please don't toppost ]

Try to shutdown the interface, change the MAC, then bring the interface 
back up. Masquerading is a bit strange and I'm not completely sure what 
will work when. However, this way, it should definately work.

HTH,
M4


