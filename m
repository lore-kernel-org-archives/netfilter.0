From: bdameron@tscnet.net
Subject: Re: Packet forwarding.
Date: Wed,  7 Apr 2004 10:25:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081358721.40743981919b2@mail.tscnet.net>
References: <1081357206.4074339639b86@mail.tscnet.net> <200404071814.34654.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404071814.34654.Antony@Soft-Solutions.co.uk>
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

Quoting Antony Stone <Antony@Soft-Solutions.co.uk>:

> On Wednesday 07 April 2004 6:00 pm, bdameron@tscnet.net wrote:
> 
> >  I have 2 linux machines. One is accessable via the outside world
> (Internet
> > machine) the other has no outside connectivity (LAN Machine). I need to
> > redirect port 443 traffic to and from the LAN server via the Internet
> > machine. Is this possible with Iptables?
> 
> Yes.   Have you read any of the tutorials or HOWTOs available from 
> http://www.netfilter.org to find out what it can do and how to make it do
> it?
> 
> > I have setup packet forwarding but then the LAN server tries to connect
> > directly to the client machine instead of to the Internet machine. Any
> > direction appreciated.
> 
> If you tell us what your rules are and give us some more detail about your 
> network setup, we might be able to help, however a better solution for you is
> 
> to look at some of the excellent documentation available to learn how to do 
> it yourself.   This is not a hard problem, and you will be able to manage 
> your system much better in future if you understand more about how it works.
> 
> One very important detail which is not clear from your description above is:
> 
> where is the "client machine" located?
> 
> Regards,
> 
> Antony.
> 

  Client machine being anyone from the outside world. And I have looked over
some of the documentation. Basically there is no current firewall policies. Just
want anything coming in on xxx.xxx.xxx.xxx:443 (Internet Machine) to be routed
to 10.10.1.110:443 (Internal Lan Machine). Looks like I need to mangle the
packet header so that the Lan machine thinks that the Internet machine is
sending the packet and then have the Internet machine redirect the packet to the
client. Client again being someone on the Internet. Not sure if this can be done
or not. Correct me if I am wrong.

-- 
Thank you,
Brad Dameron

