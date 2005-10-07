From: Gregory G Carter <gcarter@aesgi.com>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 11:45:25 -0500
Message-ID: <4346A625.6020002@aesgi.com>
References: <20051007162420.D0AB269B0D@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051007162420.D0AB269B0D@smtp.sterenborg.info>
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

Upstream providers such as my ISP here (Time Warner Cable) hardly 
support ECN, I would be surprised if they did.

For example, the crappy Zyxel cable modems they put out here don't 
support ECN notification, so the first thing they do when they overflow 
due to high amounts of traffic is simple shut down, most of them just crash.

I have to put rate limiting policies on all my routers connected to 
these modems otherwise they simply die when you try and push too much 
data through them.

I remember when Time Warner was using ubr9xx routers from Cisco, which 
were excellent, but much more expensive of course than the Zyxel.

If somone like Time Warner can't do ECN, I would hardly expect them to 
do traffic prioritization....Oooo....complicated.

:-)

-gc

Rob Sterenborg wrote:

>>>I just came across one of the threads on the LARTC.
>>>In the thread it had this.
>>>
>>>So my question is, for the following rules, would these increase my
>>>browsing / traffic, and if so, how.
>>>
>>>      
>>>
>>Small packets and control pachets should have priority
>>because they carry intrractive traffic.
>>    
>>
>
>Is it true that the upstream (ISP) routers have to support TOS for this
>to work ?
>
>
>Gr,
>Rob
>
>
>  
>


