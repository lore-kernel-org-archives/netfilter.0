From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: how to change the tos
Date: Tue, 08 Feb 2005 08:10:03 -0500
Message-ID: <1107868209.5144.3.camel@jasiiitosh.nexusmgmt.com.nexusmgmt.com>
References: <20050208124623.60439.qmail@web54701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050208124623.60439.qmail@web54701.mail.yahoo.com>
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
To: Alaios <alaios@yahoo.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2005-02-08 at 04:46 -0800, Alaios wrote:
> Hi i want to apply the patch ftos in order to change
> the tos field in ip packets...
> The problem is that i don't know how to do that
> One guy suggest me the
> http://www.paksecured.com/patches/
> but the patch is for the 2.4 kernel  but i use the
> 2.6.10 kernel.
> In addition to this i have noticed that the 2.6 kernel
> has the following option
> CONFIG_IP_NF_MATCH_TOS
> I don't know if i need to compile it as module or i
> should insert them directly to the kernel...
> Afte recompiling the kernel i have run the make
> KERNEL_DIR=/usr/src/linux-2.6.10 but still the command
> 
> iptables -t mangle -A PREROUTING -i eth0 -p tcp
> --dport 22 -j TOS --set-tos 15
> iptables v1.2.11: Bad TOS Value
> Any suggestion?
<snip>
I do not believe 15 is a valid value in iptables.  Try
iptables -t mangle -A PREROUTING -i eth0 -p tcp --dport 22 -j TOS -h to
see the valid values - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


