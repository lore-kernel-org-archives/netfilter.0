From: Jason Opperisano <opie@817west.com>
Subject: Re: Possible problem with FTP ALG
Date: Mon, 29 Nov 2004 09:36:08 -0500
Message-ID: <1101738967.10064.43.camel@hubcap.ljm.dom>
References: <1101732359.12476.3077.camel@ashutosh.teneoris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101732359.12476.3077.camel@ashutosh.teneoris.com>
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

On Mon, 2004-11-29 at 07:46, Ashutosh wrote:
> Hi folks,
> 
> I am running Linux 2.4.20 on my router with LAN IP FILTER rules as -
> 
> Allow from LAN to WAN on port 21
> Deny all from LAN to WAN
> 
> Now, when I ftp to a machine on the WAN Only the control connection
> opens ( Login is fine), but the data connection does not open. The
> machine freezes when I do an "ls".. I am using passive ftp here.
> 
> When I put printk's in the code, the expected is added, the CT is formed
> and NF_DROP does get called at any stage
> 
> Kindly Help!!!
> 
> Regards

sounds like you don't have ftp conntrack/nat (you don't actually say
whether you're using NAT or not) modules loaded.

  modprobe ip_conntrack_ftp
  modprobe ip_nat_ftp

-j

--
"You must be the man who didn't know whether it was a blister or
 a boil.
 It was a gummi bear."
	--The Simpsons


