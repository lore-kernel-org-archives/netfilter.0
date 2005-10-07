From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 20:36:33 +0300
Message-ID: <4346B221.8010205@gmail.com>
References: <20051007162420.D0AB269B0D@smtp.sterenborg.info>	<4346A625.6020002@aesgi.com>
	<1128705132.5537.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1128705132.5537.10.camel@localhost>
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

Hi John!

John A. Sullivan III wrote:
> Unless one has contracted with a private network, one is not likely to
> find QoS/CoS.  However, your bottleneck is likely to be the last mile.
> Although the ISP router may not be regulating the QoS on the last mile,
> you can control the ingress and egress through your gateway . . . well,
> at least the egress and the processing of the ingress - John
> 
> On Fri, 2005-10-07 at 11:45 -0500, Gregory G Carter wrote:
> 
I think TOS is for admins who want to priorize _THEIR_ traffic in
_THEIR_ controlled networks. ISP don't do any sahping. They only have
large txqueues and with them they demonstrate how fast the download is.
If I show them that when i download with the maximum speed and I cannot
browse the internet or chat, they say to stop downloading so fast.
When a tiny little http response packet waits in a 2 MBytes queue to
leave their server to my computer with a link speed of 128 kbit/s, I
have to wait a very long time for it to arrive and meanwhile the browser
times out...
So LARTC people developed ingress policing, to drop the bulk packets and
to sinal this loss to the isp's router, who discards a lot of the
traffic in his queue so my tiny little packet gets in front of other
packets and arrives to me in time...
Wouldn't it be better if ISPs would do some traffic shaping? (No more
packet loss, less internet traffic (discarded packets are resent at some
point), and better browsing... and... happy costomers.
>>Upstream providers such as my ISP here (Time Warner Cable) hardly 
>>support ECN, I would be surprised if they did.
>>
>>For example, the crappy Zyxel cable modems they put out here don't 
>>support ECN notification, so the first thing they do when they overflow 
>>due to high amounts of traffic is simple shut down, most of them just crash.
>>
>>I have to put rate limiting policies on all my routers connected to 
>>these modems otherwise they simply die when you try and push too much 
>>data through them.
>>
>>I remember when Time Warner was using ubr9xx routers from Cisco, which 
>>were excellent, but much more expensive of course than the Zyxel.
>>
>>If somone like Time Warner can't do ECN, I would hardly expect them to 
>>do traffic prioritization....Oooo....complicated.
>>
>>:-)
>>
>>-gc
>>
>>Rob Sterenborg wrote:
>>
>>
>>>>>I just came across one of the threads on the LARTC.
>>>>>In the thread it had this.
>>>>>
>>>>>So my question is, for the following rules, would these increase my
>>>>>browsing / traffic, and if so, how.
>>>>>
>>>>>     
>>>>>
>>>>
>>>>Small packets and control pachets should have priority
>>>>because they carry intrractive traffic.
>>>>   
>>>>
>>>
>>>Is it true that the upstream (ISP) routers have to support TOS for this
>>>to work ?
>>>
>>>
>>>Gr,
>>>Rob
>>>
>>>
>>> 
>>>
>>
> 

