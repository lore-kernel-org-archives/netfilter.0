From: Lopsch <lopsch@lopsch.com>
Subject: Re: iptables version unknown
Date: Fri, 26 Nov 2004 16:19:48 +0100
Message-ID: <41A74994.9020101@lopsch.com>
References: <41A732E0.9000305@mgvd.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A732E0.9000305@mgvd.be>
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
Cc: netfilter@lists.netfilter.org

Marc Cuypers schrieb:
> Hi,
> 
> I'm new to patch-o-matic.
> 
> I downloaded the 2.4.28 kernel from ftp.kernel.org
> I downloaded iptables 1.2.6a via apt-get source iptables
> I downloaded path-o-matic-20041125.tar.bz2.
> 
> I unpacked all those archives in /usr/src.
> when running ./runme in patch-o-matic I get the following error:
>     Your iptables version  is unknown for patch-o-matic at ./runme line 214
> 
> What can I do about it? which version should I use?
> 
The command is KERNEL_DIR=/dir/to/your/kernel/source 
IPTABLES_DIR=/dir/to/your/iptables/source ./runme <option>

where <option> is can be one of these: base, pending, extra or the 
patchname you want to apply for example CONNMARK for the CONNMARK patch.

Some links:
the latest stable version is 
http://www.netfilter.org/files/iptables-1.2.11.tar.bz2

the latest snapshot matching the latest pom-ng snapshot is 
ftp://ftp.netfilter.org/pub/iptables/snapshot/iptables-1.3.0-20041125.tar.bz2

I hope this will help you :).


