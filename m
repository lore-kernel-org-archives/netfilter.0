From: Marc Cuypers <mozilla@mgvd.be>
Subject: Re: iptables version unknown
Date: Mon, 29 Nov 2004 14:46:06 +0100
Message-ID: <41AB281E.9090407@mgvd.be>
References: <41A732E0.9000305@mgvd.be> <41A74994.9020101@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A74994.9020101@lopsch.com>
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
To: Lopsch <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

Lopsch wrote:
> Marc Cuypers schrieb:
> 
>> Hi,
>>
>> I'm new to patch-o-matic.
>>
>> I downloaded the 2.4.28 kernel from ftp.kernel.org
>> I downloaded iptables 1.2.6a via apt-get source iptables
>> I downloaded path-o-matic-20041125.tar.bz2.
>>
>> I unpacked all those archives in /usr/src.
>> when running ./runme in patch-o-matic I get the following error:
>>     Your iptables version  is unknown for patch-o-matic at ./runme 
>> line 214
>>
>> What can I do about it? which version should I use?
>>
> The command is KERNEL_DIR=/dir/to/your/kernel/source 
> IPTABLES_DIR=/dir/to/your/iptables/source ./runme <option>
> 
> where <option> is can be one of these: base, pending, extra or the 
> patchname you want to apply for example CONNMARK for the CONNMARK patch.
> 
> Some links:
> the latest stable version is 
> http://www.netfilter.org/files/iptables-1.2.11.tar.bz2
> 
> the latest snapshot matching the latest pom-ng snapshot is 
> ftp://ftp.netfilter.org/pub/iptables/snapshot/iptables-1.3.0-20041125.tar.bz2 
> 
> 
Hi,

I downloaded kernel 2.4.28 and iptables 1.2.11 and now it works.

I thank you all for helping me out.

-- 
Marc

