From: "Jerry M. Howell II" <jmhowell@jmhowell.com>
Subject: Re: Help with iptables
Date: Wed, 4 Jun 2003 22:41:31 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030604224131.D4450@jmhowell.com>
References: <sedc84e5.061@smtp.nu.ac.za>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <sedc84e5.061@smtp.nu.ac.za>; from quazit@nu.ac.za on Tue, Jun 03, 2003 at 11:22:08AM +0200
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jun 03, 2003 at 11:22:08AM +0200, Tahmid Quazi wrote:
> Hi
>  
> I am trying to use the iptables command on an iPaq running Familiar. The kernel version is 2.4.18-rmk3-hh6. 
> The kernel does not have netfilter configured so for any functionality I need, I have to install a module.
>  
> I have installed the following modules:
> iptable_filter
> ip_tables
>  
> successfully. ( i can see them when i type /proc/modules)
>  
> But when i try a simple iptables command (i got this from the "howto" document)
> / # iptables -A INPUT -s 127.0.0.1 -p icmp -j DROP
>  
> I get the following output:
> 
> iptables: No such file or directory
>  
> Please could someone tell me what i am doing wrong or missing.
>  
> Many thanks in advance for your help!
>  
Try something like

/sbin/iptables /usr/sbin/iptables or usr/local/sbin/iptables

it's probably not in your path
-- 
Jerry M. Howell II

