From: Paul Caritj <pcaritj@riovia.net>
Subject: Re: Maximum Number of Chains
Date: Wed, 03 Sep 2003 11:42:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F560BCC.4020907@riovia.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C21A@wardrive.citadelcomputer.com.au> <20030903120302.M95330@tkevans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030903120302.M95330@tkevans.com>
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
To: tkevans@tkevans.com, netfilter@lists.netfilter.org

Agreed,
Heres my situatuation: I need to create rules on the fly for 
(potentially) up to 4000 users. What I need is a way to delete *all* the 
rules for a given ip address without knowing the full contents of the 
rule (only the ip); as you might have guessed, I'm doing this 
programatically.

My current solution is to have one chain for each associated IP. Is 
there a better solution to this problem?

As for memory...I can have as much as I need, if anyone knows how much 
that would be. :)

Tim Evans wrote:

>On Wed, 3 Sep 2003 09:25:51 +1000, George Vieira wrote
>  
>
>>How much memory do you have???
>>
>>I've added at once stage around 500+ rules in once chain alone, if 
>>that helps you in anyway..
>>    
>>
>
>Seems to me if you have to ask about the maximum number of rules, you already
>have too many. There are ways to create general rules that apply to many
>cases--i.e., address ranges, port ranges, etc.
>--
>Tim Evans                       |    5 Chestnut Court
>tkevans@tkevans.com             |    Owings Mills, MD 21117
>http://www.tkevans.com/         |    443-394-3864
>http://www.come-here.com/News/  |    
>
>
>
>.
>
>  
>


