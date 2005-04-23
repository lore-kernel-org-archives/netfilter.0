From: Ed <netfilter@crazeecanuck.homelinux.net>
Subject: Re: blocking all trafic exapt selcter ports
Date: Sat, 23 Apr 2005 16:58:33 -0400
Message-ID: <426AB6F9.2030808@crazeecanuck.homelinux.net>
References: <a3f524e05042301477b3598d3@mail.gmail.com>	<426A13FB.2030507@crazeecanuck.homelinux.net>
	<20050423145444.GA8083@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050423145444.GA8083@bender.817west.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> On Sat, Apr 23, 2005 at 05:23:07AM -0400, Ed wrote:
> 
>>Kashif Ali Bukhari wrote:
>>
>>>i want to block all inbod access to my linux box and want to allow
>>>dns, http proxy,ssh,telnet,and ftp 
>>>how can i do this 
>>
>>First, please see
>>http://www.catb.org/~esr/faqs/smart-questions.html
> 
> 
> i love that link.
> 

Me too :)

> 
> 
> and:
>   iptables -A INPUT -p udp --dport 53 -j ACCEPT
> 

Ooops, shouldn't respond when really tired. =P

>  
> multiport doesn't support ranges, mport does (and it uses a ':' not a
> '-'):

Again, tiredness :S (glad you caught that).

>>A classic RTFM/STFW case, nonetheless...
> 
> 
> yes.  couldn't resist the nit-pick, though.  ;-)

...and for that I am grateful.  TY (really!) for the corrections. =)  I
shouldn't post when really tired (instead of drinking, that'll be my
excuse).


/me goes back to primarily lurking...


