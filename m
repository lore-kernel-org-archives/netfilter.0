From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: ..prevention, was: syn DDoS attack solution
Date: Tue, 05 Jun 2007 11:40:36 -0400
Message-ID: <030f37e8000023b8@intmail01.analysts.com>
References: <5C9E8CCEEB81ED498AC0C3B0054704F3029B6DE0@webmail.latis.com>	<46651F04.9020709@bgs.hu>
	<46657048.4040600@SCampbell.net>
	<20070605172248.5a156549.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <466583F4.8080107@SCampbell.net>
In-Reply-To: <20070605172248.5a156549.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

Arnt Karlsen wrote:
> On Tue, 05 Jun 2007 10:16:40 -0400, Steven wrote in message 
> <46657048.4040600@SCampbell.net>:
>
>   
>> And, most important for folks here, do egress filtering on your 
>> firewall!    Help prevent zombie machines on your own networks from 
>> being a problem, you can't stop your end users from bringing infections 
>> into your network but you can control their spread.
>>     
>
> ..what tricks _are_ out there?  Set up some kinda p0f deamon and 
> cut 'n tarpit any and all Wintendo network traffic attempts?  
> Or even feed them LROS thru ActiveX if they need firm hints?
>
>   

Not really very tricky, limit outbound traffic to what is needed.   Do 
all of your workstations need UDP ports outbound?  Smtp?    For a lot of 
sites the average workstations internet requirements are very small, 
especially if proxys are used for SMTP,HTTP,FTP, etc.  Just by blocking 
most of the end users from direct internet access (or at least to a 
small set of outbound protocol/ports) we render those machines pretty 
useless to the bad guys. 

It does, however, become very tricky if it's not done up front.  It's 
really really tough to figure out what the requirements are if anyone 
could historically do anything they wanted.    It's far better to 
seriously restrict things up front and put in the exceptions as you find 
them.   Sites that have historically allowed all outbound traffic are a 
two fold problem, it's hard to fix and they are exactly the sorts of 
sites the bad guys like to use.


