From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: one to one NAT
Date: Tue, 10 Sep 2002 09:03:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020910080346.NJTL292.mta01-svc.ntlworld.com@there>
References: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com> <200209100119.g8A1J0r9027893@ns2.is.bizsystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209100119.g8A1J0r9027893@ns2.is.bizsystems.com>
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

On Tuesday 10 September 2002 3:19 am, Michael wrote:

> > iptables -A PREROUTING -t nat -d 1.2.3.5 -j DNAT --to 192.168.1.19
> > iptables -A FORWARD -d 192.168.1.19 -j ACCEPT
> >
> > You might want to restrict that last rule a bit with -p tcp --dport
> > 80 or whatever, depending on what that machine is running and what
> > you're trying to make accessible to the Internet.
>
> gggrrrrr.... this is where I was stuck before. I'm using the "msg"
> port for testing. The linux box has no message but the inside machine
> has a couple of lines of poetry. My rules say:
>
> MERLIN_OS="1.2.3.5"
> MERLIN_IS="192.168.1.19"
>
> $IPTABLES -t nat -A PREROUTING -d $MERLIN_OS \
>   -j DNAT --to-destination $MERLIN_IS
> $IPTABLES -A FORWARD -d $MERLIN_IS -j ACCEPT
>
> no workeeee
> using netcat, the connection just hangs
> nc 1.2.3.5 17
> (stuck, no response)
> sigh.....

Where are you testing this from ?   Hopefully a machine completely outside 
your network ?

Bear in mind it *will not work* if you try to connect to 1.2.3.5 from a 
machine on the same subnet as 192.168.1.19.

Antony.

-- 

Having been asked to provide a reference for this man,
I can confidently state that you will be very lucky indeed
if you can get him to work for you.

