From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: Fairly complex multi-ISP firewall/router problem
Date: Fri, 02 Apr 2004 22:31:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <406E301D.5050400@tmr.com>
References: <7C9884991ADAE0479C14F10C858BCDF5122F3B@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F3B@alderaan.smgtec.com>
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
To: netfilter@lists.netfilter.org

Daniel Chemko wrote:
> Antony Stone wrote:
> 
>>On Friday 02 April 2004 10:36 pm, John A. Sullivan III wrote:
>>
>>
>>>On Fri, 2004-04-02 at 15:57, Bill Davidsen wrote:
>>>
>>>>All I want to do is send packets out the interface which matches the
>>>>source IP, and I don't think there's any reasonable way to get there
>>>>without patches or BSD.
>>>
>>>Hmmm . . . I admit to not having tried this and only giving it five
>>>minute's thought but I'm not sure I see the problem.  Well, I see why
>>>one can't be guaranteed to send the packet out the same interface but
>>>I'm not sure why that is a problem.
>>
>>Some ISPs block packets with source addresses not matching their own
>>network range, as a contribution to blocking spoofed packets.
> 
> 
> This is a very real issue, especially when they're only consumer grade.
> 
> What I've used to fix the problem is to use the CONNMARK extension on
> the PREROUTING step of mangle. Here, I can set the appropriate routes
> and everything that uses CONNMARK will work fine.

Awesome! I have to read this for a bit and refresh my understanding of 
CONNMARK before I try it, but this may solve the whole problem.

Totally impressive technical part snipped for brevity but saved and printed!

-- 
bill davidsen <davidsen@tmr.com>
   CTO TMR Associates, Inc
   Doing interesting things with small computers since 1979

