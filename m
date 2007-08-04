From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: SYN/ACK and NEW packets
Date: Sat, 04 Aug 2007 14:26:12 -0600
Message-ID: <web-22036612@bk3.webmaillogin.com>
References: <20070804192109.GB4205@sid.toystory.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070804192109.GB4205@sid.toystory.lan>
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
To: Franck Joncourt <franck.joncourt@wanadoo.fr>, netfilter@lists.netfilter.org

Well, in the three-way handshake the flags in the packets are:

1) syn packet sent by the client
2) syn,ack sent by the server
3) ack sent by the client

The packets in the NEW state for a statefull firewall (as iptables) are 
packets that belongs to a new "data stream", marked with the syn flag.

The packets in the INVALID state are packets, in your case specifically, 
 that implies a new "data stream" (or more properly, packets that does not 
belongs to a connection previously ESTABLISHED or to a connection RELATED to 
a connection previously ESTABLISHED) but this new "data stream" is not 
negotiating for open a new socket, is just sending "data".

To extend the analogy of the three-way handshake, someone is trying to shake 
your hand but you see the persone until you have the sense of the other hand 
in your hand, then you are surprised, retire your hand and face the other 
person trying to recognize who is, does not shake his hand and does not 
speak to him.

In fact, there are 0 packets with the state NEW with the flags 
FIN,SYN,RST,ACK/SYN,ACK because the packets that you sent does not have the 
right flags to be considered a valid packets to open a new connection.

Jorge.

On Sat, 4 Aug 2007 21:21:09 +0200
  Franck Joncourt <franck.joncourt@wanadoo.fr> wrote:
> Hi,
> 
> Looking at this :
> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SYNACKANDNEW
> 
> I understand that in order to prevent my ip address from being spoofed,
> I should reject NEW packets with the SYN/ACK flags set and the others
> cleared.
> 
> However, with the following nmap command I have tried to check it out :
> 
> nmap --scanflags SYNACK 192.168.0.1
> 
> all packets are known to be in the INVALID state rather than in the NEW
> state.
> 
> state NEW tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 0 packet
> state INVALID tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 170 packets
> 
> They talk about sequence number, as well, in the document, but I can't
> figure out what difference it makes.
> 
> Did I miss anything ?
> 
> -- 
>Franck Joncourt
> http://www.debian.org - http://smhteam.info/wiki/
> GPG server : pgpkeys.mit.edu
>Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

