From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [OT] Was: ESP does not hit the nat table
Date: Wed, 4 Aug 2004 09:49:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408040949.39972.Antony@Soft-Solutions.co.uk>
References: <D5C9032B2B09C64EA2409D6214E91AC9051228@asimail2.alphanumeric.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC9051228@asimail2.alphanumeric.com>
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

On Tuesday 03 August 2004 1:42 pm, Jason Opperisano wrote:

> > My main problem however was that ESP packets do not hit the nat table,
> > but it does traverse mangle/filter table. Is this normal? I am mainly
> > looking at SNAT/MASQUERADING ipsec traffic and I am not able to find any
> > documentation on doing this, especially since there is no point in
> > putting a "iptables -t nat -A PREROUTING -p 50 -j SNAT --to-source <me>".
> > -p 50 means ESP as you can already guess. Am I missing something here?
> > How do I masquerade ipsec traffic? (assuming my ipsec-VPN client/server
> > is fine with it...)
>
> if i had to take a stab in the dark as to why you're having trouble--i
> would say that it's related to the fact that the outbound interface of your
> IPSec traffic needs to be specified as "-o ipsec0" (or whatever number your
> actual ipsec interface is), not ethX...

Actually, I thought the ipsecX interface was used for the plaintext traffic, 
and ethX was used for the encrypted stream?

My model of frees/wan and netfilter is:
 - encrypted packet arrives on ethX, passes through INPUT to local klips 
process
 - decrypted packet appears on ipsecX pseudo-interface, passes through 
FORWARD, and goes to local client

 - plaintext reply data comes in on standard ethernet from local network, gets 
FORWARDed to ipsecX
 - ipsecX has local process listening, captures plaintext and encrypts it
 - encrypted packet getnerated by local process, passes through OUTPUT and 
exists via ethX

Therefore I believe the TCP/UDP/ICMP traffic etc would be going in/out via 
ipsecX, whereas the ESP traffic will be going in/out via ethX.

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


