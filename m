From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Tue, 20 Apr 2004 22:51:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040420205144.GC2997@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404201947.39774.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony,

first thanks for your reply and your hint concerning vtun.
I have some remarks to your reply and put them inside your message.

On 2004-04-20 19:47:39 +0100, Antony Stone wrote:
> On Tuesday 20 April 2004 7:22 pm, Christian Riechmann wrote:
> 
> > Hello,
> >
> > is it possible to read - via ipq_read/ipq_get_packet - a UDP packetr
> > and after some changes to accept - via ipq_set_verdict with NF_ACCEPT and
> > shorter length - it as a TCP packet?
> 
> My immediate response to this is "no, of course not, because UDP and TCP 
> packet headers are completely different".
> 
> I mean, UDP packets just get sent - who knows whether the receiver gets them 
> or not?   TCP involves a three-way handshake to set up a connection, and then 
> sequence & acknowledgement numbers to maintain the reliability.   Creating 
> that out of nowhere would be difficult.

Maybe I am a little bit lazy when describing my method as "tunnelling". 
Therefore I will go a little bit deeper. 
I know that UDP and TCP protocols are completely different, especially
the 3-way handshake. But all its steps are TCP packets. Therefore my idea
is to encapsulate on each side each TCP packet into a UDP packet, send
this one to the other side, decapsulate the original TCP paket from the UDP
packet and inject the TCP packet to the kernel. This way the total TCP
dialog shall be exchanged as payload of separate UDP packets. UDP
is necessary, because only UDP can use broadcast addresses. 
(I use this type of address to emulate LAN-broadcast within a mobile
adhoc network. Therefore I doubt that vtun would help me.)

> 
> > Here is what I wish to do:
> > For the transmission of IP packets (UDP, ICMP, TCP) between two hosts
> > I want to send these packets through a UDP tunnel.
> 
> Tunnelling is a very different matter from converting UDP packets into TCP 
> packets, and should be eminently feasible.

As I tried to explain, I do NOT want to convert UDP to TCP, I only want to
transport TCP packets as UDP payload.

I would be glad if you can comment the method described above.

Regards
Christian

-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany

