From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Tue, 20 Apr 2004 22:36:39 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40853577.5080803@linuxmail.org>
References: <Pine.LNX.4.33.0404201608280.14290-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0404201608280.14290-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:
> On Mon, 19 Apr 2004, Feizhou wrote:
> 
> 
>>when will ipset be available in 2.6?
> 
> 
> It needs more, exhaustive testing. ippool was tested more widely than
> ipset.

Oh...those that mean both can actually be compiled in 2.6?
> 
> 
>>I presume ippool is going to become obsolete?
> 
> 
> Originally ipset was planned to be released as a new version of ippool.
> Unfortunately backward compatibility could not be preserved, so a new name
> had to be found. It extends ippool, yes, but that does not mean ippool is
> obsolete.
> 

Lovely. Does ippool/ipset take ips only or will they also take cidrs?

BTW...mail.so-net.com.hk is an ISP smarthost...could you block 
so-net.com.hk not coming from 203.99.142.22 instead of a domain rule 
block on rdns and sender addy?

And maybe all emails from 203.99.142.22 if sender addy not in 
so-net.com.hk...

