From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: What is the difference between modprobe and insmod?
Date: 20 Dec 2002 17:20:00 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040385008.2860.1.camel@india>
References: <20021220070647.BA0B01C959464@sm181.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021220070647.BA0B01C959464@sm181.163.com>
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
To: bobo <boboaq@163.com>
Cc: netfilter@lists.netfilter.org, bobowd@sohu.com

The difference is that lsmod won't insert the dependent modules whereas
the modprobe does.
Dharmendra.T
Linux Security Expert


On Fri, 2002-12-20 at 12:41, bobo wrote:
>   
> 
>          While writing IPtables scripts,there are two command:  modprobe and insmod.
> 
>          In some example,some use : modprobe ip_tables,but others use: insmod  ip_tables.
> 
>          Why?  Is there difference between them?
> 
>           
>          Thanks
> 
> 



