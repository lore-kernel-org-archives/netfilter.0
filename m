From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need help with rate-limiting NTTP traffic
Date: Thu, 1 Apr 2004 17:38:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404011738.32254.Antony@Soft-Solutions.co.uk>
References: <20040331165409.0d498074@daneel.volumen.net> <200404010916.58286.Antony@Soft-Solutions.co.uk> <20040401092414.6b7b43f7@daneel.volumen.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401092414.6b7b43f7@daneel.volumen.net>
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

On Thursday 01 April 2004 5:24 pm, Shane Hickey wrote:

> Antony Stone said:
>:
> > What are you using as your NNTP server?   If it's INN, I'm pretty sure
> > that has its own rate-limiting mechanism as a configuration parameter,
> > and you'd be better off doing rate limiting in the application itself
> > if it's at all possible.
>
> 	I'm not serving NNTP, I'm just constantly connected to an NNTP server
> using Pan.

Ah, okay, yes - I had assumed you meant you were running a server, not a 
client.

> There aren't any bandwidth controls in Pan, that I could see

Doesn't surprise me - I wouldn't necessarily expect that in a client.

> and it will happily stomp over all my other traffic.  It was extremely easy
> to limit only my nntp traffic (that is, traffic coming into my network with
> a source port of 119) in Dummynet.  Can anyone offer ideas with tc and
> netfilter?

Maybe someone else here can tell you how to do it (I'm not sufficiently 
familiar with tc to tell you, although I expect it's possible), however one 
thing puzzles me about your requirement:

If you're using a client, and it's generating enough traffic to swamp your 
("fat") upstream connection, then surely that's because there's a lot of 
traffic in the newsgroups which you've subscribed to?   If you use a traffic 
control mechanism to throttle the available bandwidth, you will surely end up 
losing postings because you can't suck them down fast enough before they 
expire (if you could, then your current usage would not be consuming so much 
bandwidth)?

Therefore I don't see how you can maintain access to the newsgroups which are 
creating all this traffic, at the same time as throttling down your 
connection to consume less bandwidth....

Just my 2 units of currency....

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


