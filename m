From: Scott Hall <halls@aros.net>
Subject: Re: icmp: 10.1.4.50 unreachable - need to frag (mtu 500) [tos 0xc0]
Date: Tue, 13 Jan 2004 09:12:11 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400418DB.209@aros.net>
References: <3FFA5EBD.1000701@aros.net> <1073388187.2047.250.camel@grendel>	 <4003A62B.7020108@aros.net> <1074009062.5742.222.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074009062.5742.222.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter@lists.netfilter.org

Thank for the response Chris,

The problem that I see with that solution is that most of the sites, 
which are many by this point, that I have had problems with aren't under 
my control.  Including aol.com, I can just see me trying to convince AOL 
to reconfigure their servers to not set the DF :).  Are there anyother 
work arounds that you can propose? 

thnx,
  --scott

Chris Brenton wrote:

>On Tue, 2004-01-13 at 03:02, Scott Hall wrote:
>  
>
>>So the one question that this whole issue raises in my mind is, Isn't 
>>there anyway to handle the (DF) packets differently?
>>    
>>
>
>Absolutely. Config the stacks on both ends of the connection to _not_
>set DF. This will cause the router at the MTU border to frag the packets
>and will not require an ICMP error packet.
>
>  
>
>>I ask 
>>becuase we have two cisco routers and 6 Adtran routers that handle this 
>>same scenario quietly. 
>>    
>>
>
>I'm guessing if you check the decodes from those packets you will see
>the public rather than the private IP embedded in the payload. I think
>this is what is killing you. This is an old Netfilter bug that I
>*thought* was fixed ages ago.
>
>HTH,
>C
>
>
>
>  
>


