From: Anoop S <anoop@it-om.com>
Subject: Re: help..... pleeaseeee
Date: 31 Jan 2003 14:01:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044001893.1361.8.camel@brahmos>
References: <010b01c2c8f1$0c023520$210aa8c0@sabirin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <010b01c2c8f1$0c023520$210aa8c0@sabirin>
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


On Fri, 2003-01-31 at 11:51, inghau@perkom.co.id wrote:
> hello everybody

Hi

> 
> i ''m having problem accessing FTP sites on the net through my linux firewall
> 
> 

try loading (modprobe) ip_nat_ftp and ip_conntrack_ftp modules
this may solve your problem

> some of my friend told me that because WS-FTP support "passive transfer mode" 
so the program can connect through the firewall. Which is not supported if i'm using 
FTP ftom command or windows explorer

correct, windows ftp client doesnt support passive transfers.

regards
anoop


