From: George Georgalis <georgw@galis.org>
Subject: Re: Help NEEDED--sos !!
Date: Wed, 5 Jun 2002 06:58:15 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605065815.B26774@trot.haven.dom>
References: <Pine.LNX.4.33.0206041007010.6390-100000@blackhole.kfki.hu> <3CFD97CD.7010306@inbox.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CFD97CD.7010306@inbox.lv>; from arindamhaldar@inbox.lv on Wed, Jun 05, 2002 at 10:17:09AM +0530
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arindam Haldar <arindamhaldar@inbox.lv>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@lists.samba.org

May I see the command you use to load the module, (and to satisfy my
curisoty the output of 'uname -a')

// George

On Wed, Jun 05, 2002 at 10:17:09AM +0530, Arindam Haldar wrote:
>no this is not htb or imq specific problem !!...  i have tried 
>with/without imq/htb/ vanila iptables... at this point of time thereis 
>no htb or imq ie not complied in kernel or with iptables... but i still 
>get the messages !....:(
>friends do any of u faced this problem or is it the first time ?
>Plsssssssssssssssssssssssssss i NEEEEEEEEEEED help !!!!
>
>Jozsef Kadlecsik wrote:
>> On Tue, 4 Jun 2002, Arindam Haldar wrote:
>> 
>>>>yes..:)... sorry for being a little cryptic ;)... but u guessed it right
>>>>!..so i will summarize my 2 Question in this listing-->
>>>>1)i am getting these messages in my /var/log/messages..
>>>>
>>>> iptables v1.2.7-20020423 with  kernel 2.4.18 & patched htb3.3-020512 &
>>>>imq-2.4.18...
>>>>May 30 05:09:58 cab1 kernel: ASSERT: ip_nat_core.c:840
>>>>&ip_conntrack_lock not readlocked
> >>>May 30 05:09:58 cab1 kernel: ASSERT: ip_conntrack_core.c:91
> >>>&ip_conntrack_lock_R71150de5 readlocked
>>>can someone tell me whats wrong ?..how can i solve this problem??
>
>> I'd suggest to start with a new 2.4.18 kernel, without the htb3 and imq
>> patches applied. Check out that it works, without emitting such messages.
>> 
>> If the problem persists, then it might be a netfilter related problem
>> (there still can be bad hardvare...). If the problem disappears then
>> it is related to the two additional extra patches.
>> 
>> Regards,
>> Jozsef
>
>
>

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


