From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: reply messages
Date: Sat, 9 Nov 2002 13:04:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021109130418.HWAH20191.mta03-svc.ntlworld.com@there>
References: <Pine.LNX.4.33.0211072133140.159-100000@laptop.sympatico.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0211072133140.159-100000@laptop.sympatico.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 08 November 2002 2:39 am, James Stickland wrote:

> A while ago, while simultaneously icmp pinging my isp's dns server and
> viewing the tcpdump of the interface to which the icmp requests/replies
> were going out/in from, i realised that my ISP's DNS server drops icmp
> ping requests, and instead replies with a message visible to tcpdump
> something along the lines like this: "This server does not allow ping
> replies."
>
> My question is, would there happen to be a jump i could do with netfilter
> that would enable me to send out such a message for certain types of
> packets coming in?

Probably.   What was the reply you saw ?   (Presumably you can recreate it by 
pinging your ISPs DNS again ?)

I just made a guess at your ISP from the headers of your email, looked up 
their DNS servers, and pinged them - I got nothing back (I was running 
tcpdump to check for anything that ping might not tell me).   Hopefully I 
guessed the ISP wrongly, or something....

I'm interested to know what message you saw meaning "this server does not 
allow ping replies"....

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

