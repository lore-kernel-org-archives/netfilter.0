From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ipsec/l2tp
Date: Sat, 3 Jul 2004 12:13:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407031213.33996.Antony@Soft-Solutions.co.uk>
References: <4FE82EE778704E4D9D31E9CE0BEC1465032312@caf02.caf.local>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4FE82EE778704E4D9D31E9CE0BEC1465032312@caf02.caf.local>
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

On Saturday 03 July 2004 11:25 am, Eray Aslan wrote:

> >> Haven't worked much with IPSec (at least not over firewall).  Are you
> >> sure that IPSec packets will go through Netfilter twice (once encrypted,
> >> and than once again unencrypted)?
> >
> >They do.   This makes it easy to filter the packet types you want to allow
> >through the tunnel, rather than having a VPN which passes just everything.
> >
> >Regards,
> >
> >Antony.
>
> Hi,
>
> I am having problems in setting up the following (setup is similar to what
> is described at http://koeppe-net.de/l2tp-howto.txt )
>
> WinXP (VPN Client)
>   |  (ipsec/l2tp)
> Firewall (linux 2.6.6 iptables 1.2.9)
>   |  (l2tp)
> Win2K3 (VPN Server)
>
> Basically, the client should connect to the firewall with ipsec/l2tp.  At
> the firewall, the incoming encrypted packets from the VPN clients should be
> unencrypted and sent to the VPN Server.  However, I am confused about which
> tables the packets go through both in their first and second rounds.
>
> What is meant by "IPSec packets will go through Netfilter twice (once
> encrypted, and than once again unencrypted)" ?

I wrote the above comment, and I was specifically referring to FreeS/WAN / 
OpenS/WAN and the Linux 2.4 kernel series at the time.   Things are different 
in the 2.6 kernel because of the inbuilt IPsec implementation.

I'll explain how things work in the 2.4 kernel for completeness, however 
you'll have to ask someone else about what happens with 2.6, since I haven't 
played with the IPsec system in that yet.   I do know that it's much more 
difficult to get to filter the unencrypted packets.

Firstly, encrypted packets coming in to the Security Gateway for forwarding:
1. Encrypted packet arrives at SG and enters PREROUTING, then INPUT chain 
(because it's addressed to the SG itself)
2. Encrypted packet traverses INPUT and goes to local klips process for 
decryption
3. Decrypted packet appears on ipsec0 pseudo-interface and enters PREROUTING, 
then FORWARD chain (because the decrypted contents are now addressed to the 
end client machine)
4. FORWARDing rules can filter on normal TCP/UDP etc protocols and port 
numbers, and the input interface is ipsec0, so these packets can be 
distinguished from any coming in on eth0 etc.
5. Decrypted packet traverses POSTROUTING and leaves SG for the client.

Secondly, plaintext packets coming in to the Security Gateway for encryption:
1. Unencrypted packet enters PREROUTING and FORWARD (because it's addressed to 
the remote client on the other end of the VPN)
2. FORWARDing rules can filter on normal TCP/UDP etc protocols and port 
numbers; the output interface is ipsec0.
3. Unencrypted packet traverses POSTROUTING and goes to ipsec0 
pseudo-interface.
4. Klips process picks up packet from ipsec0, encrypts it, and generates new 
encrypted packet from a local process.
5. Encrypted packet goes through OUTPUT chain (because it's been generated on 
the local machine), then POSTROUTING and leaves through eth0, addressed to 
the remote SG.

> Any comments / suggestions on the setup are also welcome.  I'd rather not
> use pptp if I can help it.

Good man :)

I hope someone else here can now fill in some useful details for you, given 
that you're using 2.6.6

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


