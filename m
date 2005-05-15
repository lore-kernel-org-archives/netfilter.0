From: Patrick Nelson <pnelson@neatech.com>
Subject: Re: SSH Brute force attacks
Date: Sun, 15 May 2005 13:12:36 -0700
Message-ID: <4287AD34.8010908@neatech.com>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<42825732.8010206@verisignlabs.com>	<428259CE.3080708@riverviewtech.net>	<42825D48.2060003@verisignlabs.com>	<20050511203452.GA13902@bender.817west.com>
	<4285A29C.1020200@hotpop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4285A29C.1020200@hotpop.com>
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
To: Georgi Alexandrov <tehlists@hotpop.com>
Cc: netfilter@lists.netfilter.org

Georgi Alexandrov wrote:

> Jason Opperisano wrote:
>
>> On Wed, May 11, 2005 at 03:30:16PM -0400, Pete Toscano wrote:
>>  
>>
>>> Freaky.  My output is the same as yours with the exception of the 
>>> 1.2.11
>>> string.
>>>
>>> recent v1.2.11 options:
>>> <snip same stuff that you have>
>>> ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.
>>> http://snowman.net/projects/ipt_recent/
>>>
>>> I'm a little confused about the difference between "recent v1.2.11" and
>>> "ipt_recent v0.3.1"  Is one a kernel component and the other the
>>> userspace part?
>>>   
>>
>>
>> yes, ipt_recent == kernel module.  the 1.2.11 is the version of the
>> iptables userspace utility.
>>
>>  
>>
>>> I'm also a little confused about p-o-m.  Is this something I can apply
>>> without recompiling my (modular) kernel?   
>>
>>
>> no.
>>  
>>
> I don't agree Jason. You can compile only the needed modules.
> Here's a tutorial (in bulgarian sorry, but you can get the idea from 
> the comments/commands) how to do that with fedora core 3:
> http://hardtrance.blogspot.com/2005/04/fedora-core-3-patch-o-matic-ipttimeko.html 
>
>
>>  
>>
>>> Are there any good docs on how
>>> to use p-o-m?  I didn't see any immediately obvious on the netfilter
>>> site and the p-o-m section seems to end mid-
>>>   
>>
>>
>> basic recipe:
>>
>> - download/extract kernel src
>> - download/extract iptables src
>> - download/extract p-o-m
>> - apply patches from p-o-m
>> - recompile kernel
>> - recompile iptables
>> - reboot, rinse, repeat.
>>
>> -j
>>
>> -- 
>> "Stewie: Soooo Broccoli, mother says you're very good for me. But I'm
>> afraid I'm no good for you."
>>        --Family Guy
>>
>>
>>  
>>
> regards,
> Georgi Alexandrov
>
As I read through the link of hardtrance.blogspot.com and I was 
wondering if anyone has rebuilt the RPM so I can try this.  I am getting 
inundated with SSH hits and I would love to try Grant's Method.  But we 
do not do Kernel building.  Is there anyway Grant's method can be tried 
without rebuilding the Kernel and IPTables.  It seems that:

iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 
-m recent --hitcount 4 --set --name SSH -j RETURN

is a integral part of his method.  I have the same output to the command 
iptables -m recent -h as others here:
<snip>
recent v1.2.11 options:
[!] --set                       Add source address to list, always matches.
[!] --rcheck                    Match if source address in list.
[!] --update                    Match if source address in list, also 
update last-seen time.
[!] --remove                    Match if source address in list, also 
removes that address from list.
    --seconds seconds      For check and update commands above.
                                      Specifies that the match will only 
occur if source address last seen within the last 'seconds' seconds.
    --hitcount hits             For check and update commands above.
                                     Specifies that the match will only 
occur if source address seen hits times.
<snip>

And I get the same output from Grant's recent command of:

iptables v1.2.11: Unknown arg `4'
Try `iptables -h' or 'iptables --help' for more information.

Is there a way to do this without doing Grant's "-m recent" step and the 
recompiling thing?  Or some work around?  I really want to do tar 
pitting of these SSH brute force losers.

Thank!

