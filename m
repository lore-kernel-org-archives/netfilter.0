From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: PLs HELP !
Date: Mon, 03 Jun 2002 17:09:20 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFB5568.8010907@inbox.lv>
References: <Pine.LNX.4.33.0206031029580.4553-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.samba.org

ys i complied kernel 2.4.18 on rh 7.2  & was downloaded from the site !

Jozsef Kadlecsik wrote:
> On Fri, 31 May 2002, Arindam Haldar wrote:
> 
>>i am getting these messages in my /var/log/messages..
>>can someone tell me whats hapenning here..
>>iptables v1.2.7-2--2-423 with  kernel 2.4.18 & patched htb3.3-020512 &
>>imq-2.4.18...
>>May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840
>>&ip_conntrack_lock not readlocked
> 
> The connection tracking part of netfilter does not fuction properly on
> your system. Is it a vanilla 2.4.18 or shipped by some vendor?
> 
> Regards,
> Jozsef


