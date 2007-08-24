From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: Re: Traffic shaping questions and possible extensions
Date: Fri, 24 Aug 2007 13:20:40 +0200 (CEST)
Message-ID: <34457.195.55.244.106.1187954440.squirrel@www.arcoscom.com>
References: <46CDA7AC.40009@expertron.co.za>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46CDA7AC.40009@expertron.co.za>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I were experiencing the same problem and solvented adding more rules to
the marking packets.

For example (and taken from lartc and more web resources about this
questions):
   1) Usually, I use CONNMARK restore/save to mark the whole conexion. Add
after the save some MARK to allow subsets of traffic. For example,
consider a solution like this:
       a) If conection is market yet and is not bulk (for example) allow
"ack" packets to have more priority.
       b) If packet length is small, have it more priority.
       c) If packet length is big, have it less priority.
       d) and so on.
   2) Try to combine tc filters with mangle.

I resolved all these isues having a complicated QoS scripts with flexible
configuration files that allow me to put the traffic as I said.

Regards

El Jue, 23 de Agosto de 2007, 17:28, Justin Schoeman escribi=F3:
> Hi,
>
> It has been quite a while since I looked at what was happening in Linux
> traffic shaping, so I am not sure if this has been discussed / improved
> on since I last looked.
>
> We use a traffic shaper based on HTB.  The basic principals work fine,
> but we have a problem with 'intermittent trafic' like http and
> interactive ssh sessions.
>
> Each of these categories of traffic have their own class, and are
> allocated a certain 'guaranteed' rate. However, if other traffic is
> bursting into this bandwidth, we see that very often it takes so long
> for the other traffic to throttel back that the effective QoS is very bad.
>
> If we hard cap the other traffic to leave the guarantee open, then web
> and ssh access is very very good.
>
> So the problem seems to lie with getting other traffic to slow down
> quicker.
>
> Are there any current solutions/suggestions to working around this?
>
> If not, I have one possible solution, and I would appreciate any
> feedback on it:
>
> At the moment, if traffic cannot be sent immediately (there is no
> bandwidth available for it), then it is first queued, and if the queue
> gets too long, packets are dropped.
>
> This will slow down the sender, but relies on the expiry of TCP timers
> to acheive this.
>
> What I was thinking was that for bulk traffic that needs (and can
> tolerate aggresive throtling), instead of queueing the packet, keep a
> history of the last ACK packet sent, and resend it.
>
> The receiver will see this as a duplicate ack, and immediately enter a
> congestion avoidance algorithm, throtling the data.
>
> Is this feasible, or is it a Really Stupid Idea (TM)?
>
> Thanks!
> Justin
>
>



