From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT, ports and iptables
Date: Sun, 2 Jun 2002 09:21:06 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206020821.g528L8A27004@Networker.rockstone.co.uk>
References: <000101c209d8$5183e720$6401a8c0@GKXP>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000101c209d8$5183e720$6401a8c0@GKXP>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Sunday 02 June 2002 2:53 am, iptables@kilsgaard.dk wrote:

> 	I would like to open some ports (80,21,22.).
> 	And then i would like to translate a port to a local Ip
> address, so i can access a PC on my local LAN from the internet.
> Is the rules i have made okay, or is there an better way to do the
> trick.
>
> Is there a place where there is a description of iptables and its
> possibilities?

You want:

http://www.netfilter.org/documentation

specifically

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO.html

and maybe also

http://www.netfilter.org/documentation/HOWTO/packet-filtering-HOWTO.html
http://www.netfilter.org/documentation/HOWTO/networking-concepts-HOWTO.html


Antony.

