From: Krystian <optimusprime@o2.pl>
Subject: Re: Conntrack full, but not really
Date: Thu, 25 Mar 2004 11:30:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4062B4D0.5080701@o2.pl>
References: <4061FA01.4050604@drzeus.cx>	 <1080169030.8520.122.camel@smoogen2.lanl.gov> <1080191858.12362.80.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080191858.12362.80.camel@raylinux.internal>
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
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Ray Leach wrote:

>On Thu, 2004-03-25 at 00:57, Stephen Smoogen wrote:
>  
>
>>On Wed, 2004-03-24 at 14:13, Pierre Ossman wrote:
>>    
>>
>>>Hi!
>>>
>>>I'm having the standard problem of the connection tracker running out of 
>>>space, but this time with a twist. If I check how many connections it is 
>>>currently tracking it is nowhere near the upper limit. I've searched 
>>>through the archives and haven't found anything like this.
>>>
>>>The machine is a P-2 333 MHz with 96 MB of RAM doing nothing but 
>>>routing. It's running Red Hat 9 with kernel 2.4.20-28.9 (although the 
>>>problem exists with other Red Hat kernels). The problem appears after 
>>>about a month of uptime. After that the machine needs to be rebooted to 
>>>recover (flushing out the connection tracker might work aswell but that 
>>>doesn't really make the problem less severe).
>>>
>>>      
>>>
>>The problem is with a conntrack patch that Red Hat is including from an
>>old Alan Cox tree. It seems to leak memory somewhere so that if you look
>>in /proc/net/ip_conntrack it is 'empty' but if you look at
>>/proc/slabinfo it is full. 
>>
>>The problem can show up pretty quickly if the ip_conntrack_ftp is loaded
>>on a heavy server. My fix has been to get a 2.4.25 kernel and compile it
>>as an RPM and use it. 
>>
>>Beyond that, maybe RH will offer a fixed kernel for RHL-9, but I am
>>doubting it.
>>    
>>
>
>Yeah, and if they don't just switch to SuSE ;-)
>
>  
>
Fedora :)

