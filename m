From: Georgi Alexandrov <georgi.alexandrov@gmail.com>
Subject: Re: running commands when packet matched
Date: Mon, 05 Dec 2005 19:26:36 +0200
Message-ID: <4394784C.8030800@gmail.com>
References: <43921EA4.7060905@cise.ufl.edu> <1133655073.17460.4.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1133655073.17460.4.camel@porky>
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

Eric Leblond wrote:

>On Sat, 2005-12-03 at 17:39 -0500, James Rhett Aultman wrote:
>  
>
>>Dear Netfilter users,
>>
>> Again, to explain the mechanism I need: when the
>>machine encounters a packet matching a rule, I want the machine to run a
>>specific program and drop the packet.
>>
>>Is something like this possible using iptables or another netfilter project?
>>    
>>
>
>Yes, just use the QUEUE or NFQUEUE target. This send packet to userspace
>and there you can do what you want. In your case, match and accept the
>packets and then a match is done, do your job ....
>
>If you need some code example, you can have a look at NuFW :
>	http://www.nufw.org/
>
>By the way, you could also have a look at ulogd2 which brings some
>features that may interest you :
>	http://svn.gnumonks.org/branches/ulog/ulogd2/
>
>
>BR,
>  
>
But actually the truth is that this a job for a IDS/IPS such as 
Snort(.org), not netfilter.
A cite from: http://www.snort.org/docs/faq/1Q05/node91.html

" But one caveat... running external binaries can also be a performance 
limiter and your should read the caution below...

CHRISTOPHER CRAMER wrote:

    I'm sure this has been mentioned before in similar discussions, but
    this feels like a _really_ bad idea. What if the bad guys realize
    what is going on and make use of your blocking method as a DoS
    attack. All one would have to do start sending a series of
    triggering packets with spoofed IP addresses. 

    Since I am no longer interested in breaking into your site, but
    rather making your life hell, I don't worry about the resulting data
    getting back to me. All I have to do is start proceeding up a list
    of IP addresses that I think you should no longer be able to talk
    to. When you come in the next morning, you find that you can no
    longer access the world. 

    Just my $0.02. 

Danger Will Robinson: Conventional wisdom says that auto-blocking is 
inherently dangerous."

Enjoy! :-)

Georgi Alexandrov


