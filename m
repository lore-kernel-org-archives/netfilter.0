From: "security" <security@lea-linux.com>
Subject: Re: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 17:32:40 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <001101c48f6f$c080e0f0$0a00a8c0@aziz>
References: <000801c48f65$58d3c940$0a00a8c0@aziz>
	<200408311605.31805.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Gavin Hamill <gdh@acentral.co.uk>, netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Gavin Hamill" <gdh@acentral.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, August 31, 2004 5:05 PM
Subject: Re: list delete bug: kernel crash


> On Tuesday 31 August 2004 15:18, security wrote:
>
>> Ok still have  crash after re-compil my kernel and re-install iptable
>> userspace package.
>> Allways the same error:
>>
>> Aug 31 16:01:39 gateway kernel: LIST_DELETE:
>> net/ipv4/netfilter/ip_conntrack_core.c:300
>> `&ct->tuplehash[IP_CT_DIR_REPLY]'(d3ac9224) not in
>> &ip_conntrack_hash[hr].
>
> That's a shame. Unless your netfilter support came via modules rather than
> from the kernel itself, then I'm afraid I have no more suggestions :( My 
> last
> thinking was that you may not have replaced any modules - only the main
> kernel file...
>

I have re-compil / install kernel and modules.
But, i will wait because when the last crash occur, i had re install iptable 
userspace BUT didn't have reboot.
And i have notice too that the iptable userspace i used was 1.2.11 compiled 
by me, and now i have re-install offciel slackware 10.0 package: 1.2.10
So i will wait to see if i have other crash since i have reboot with this 
iptable userspace version. 


