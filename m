From: Torsten Puls <lists@pumpum.de>
Subject: Fw: Re: What is the difference between modprobe and insmod?
Date: Fri, 20 Dec 2002 09:27:02 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021220082702.290C51B7B18@webbox10.server-home.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: IP <netfilter@lists.netfilter.org>

Hello

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
modprobe make "insmod with dependencies"
insmod make "insmod without dependencies"


Greetz Torsten

