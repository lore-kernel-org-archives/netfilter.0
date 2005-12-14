From: Edwin Kapauni <edwinkapauni@arcor.de>
Subject: Re: opening port for SSH
Date: Wed, 14 Dec 2005 17:02:19 +0100
Message-ID: <dnpfmc$5ee$1@sea.gmane.org>
References: <dn9dag$je3$1@sea.gmane.org>
	<43999370.8010504@gmail.com>	<000f01c5fcce$c2e3aad0$6501a8c0@ludi>
	<4399A4CC.90909@gmail.com>
Reply-To: edwinkapauni@arcor.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4399A4CC.90909@gmail.com>
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
To: netfilter@lists.netfilter.org

Georgi Alexandrov wrote:
> myhapwcforever wrote:
> 
>> And use the public-key ;)
>>  
>>
> And disable version 1 of the protocol.
> And disable root logins.
> And use AllowGroups and/or AllowUsers in sshd_config.
> And use RSA for generating the keys.

Thanks Georgi, myhapwcforever and /dev/rob0 for your support.
I need to find some time to read and think about the SSH stuff before 
opening a port for it.

But some questions I have here:

What's the benefif of preferring
    either "--dport ssh"
    or     "--dport 22"?

And, what's the means for "bindind the ssh server to a higher port"?


