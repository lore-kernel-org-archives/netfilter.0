From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 22:50:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311262250.58417.Antony@Soft-Solutions.co.uk>
References: <1069853846.3fc4ac966be15@paris-hme1> <200311262048.49827.Antony@Soft-Solutions.co.uk> <1069886478.3fc52c0e61202@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069886478.3fc52c0e61202@paris-hme1>
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

On Wednesday 26 November 2003 10:41 pm, zynkx wrote:

> antony:
>
> the only reason why i am doing this is because i am
> blocking all incoming connectios to my box except
> portuguese connections. i manage to get all the
> portuguese ip ranges, put the forward chain to drop
> and a accepted all the sources i want to get
> connections from. this way i will only be accepting
> connetions from portugal, since that the ammount of
> users i administrate is not enough for that machine to
> be opened to the whole world.

Explain to me why you only want to allow connections from Portuguese IPs?

What is the problem with "that machine being opened to the world"?

1. What services are you providing anyway?

2. What is the limiting factor in not wanting just anyone from anywhere to be 
able to connect?   Is the machine severely under-powered, so it couldn't cope 
with the load, or do you have a very slow Internet link, and you don't want 
it saturated...?

Maybe you know what you're doing and blocking by country IP range is the right 
solution to your problem, but where email is concerned I would never choose 
that way of doing it.

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


