From: stderr <stderr@swissinfo.org>
Subject: Re: iptables pom installation, help!
Date: Fri, 02 Jul 2004 22:54:48 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088779915.13892.175.camel@darkstar>
References: <20040702042722.12185.84804.Mailman@vishnu.netfilter.org>
	 <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
Reply-To: stderr@swissinfo.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.3.0.1.20040702173337.5a864b90@mail.axisglobal.com>
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
To: netfilter@lists.netfilter.org

On Fri, 2004-07-02 at 17:37, Ryan Pagquil wrote:
> hello,
> 	i just want to ask the proper way to install the patch-o-matic for 
> iptables. because i need the libipt_ipv4options.so for my firewall rules. 
> i'm using iptables-1.2.7a. what are the things do i need for me to install 
> it properly?

Just extract the pom tarball and cd into it,
then do a # ./runme.pl, 
<Hey! KERNEL_DIR is not set> type in your
kernel source path
<Hey! IPTABLES_DIR is not set> enter the
source path of your iptables ver.
cd to your kernel source dir then do a 
make modules && make modules_install

but I'd rather opt with compiling a
new kernel to make it cleaner (and safer)

hth
--
-stderr(Cagayan de Oro)



