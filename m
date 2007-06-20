From: switcher <switcher@linuxwall.info>
Subject: Re: Check connection state in libipq hook
Date: Wed, 20 Jun 2007 18:29:08 +0200
Message-ID: <20070620182908.i7yr5rr7ei8sggcc@webmail.microgate.fr>
References: <20070618161548.120li24u9dcsok0k@webmail.microgate.fr>
	<4676CBB7.4080808@netfilter.org>
	<20070618202242.wa8gjjs892ysg0w8@webmail.microgate.fr>
	<4676DAED.1050003@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4676DAED.1050003@netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Pablo Neira Ayuso <pablo@netfilter.org> a =E9crit :

> switcher wrote:
>> Pablo Neira Ayuso <pablo@netfilter.org> a =E9crit :
>>> Misconception: The connection tracking is a kernel module. libipq 
>>> is a userspace library. You can't invoke such functions from 
>>> userspace.
>>
>> Errr...
>> So, do you know another technique that I can use to do so in userspace ?
>> I could maintain a connection state table in userspace but I think 
>> it's a waste of time to redo netfilter's job...
>
> Well, it depends on what you want to do. Anyway, you may also use 
> libnetfilter_conntrack to listen to conntrack events. BTW, libipq has 
> been superseded by libnetfilter_queue and the NFQUEUE target.
>

Alright, I'm reading libnetfilter_conntrack utils right now, but it 
sounds like
you forgot to add some comments :p
I want to check if an incoming packet is part of an active (tcp & udp)
connection. With util should I follow ?

Thanks,
julien



