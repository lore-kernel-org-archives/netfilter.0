From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ suggestion?
Date: Thu, 13 Jun 2002 20:36:44 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131936.g5DJajA17620@Networker.rockstone.co.uk>
References: <3086.172.16.10.1.1023994540.squirrel@mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3086.172.16.10.1.1023994540.squirrel@mail>
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

On Thursday 13 June 2002 7:55 pm, tbsky@greenware.com.tw wrote:

> hi:
>    i use snat for lan(192.168.10.0/24) to dmz(172.16.10.0/24),
>    but i found that way lan PC will become only one ip to dmz server.
>    so i think if i can bound another ip (eg: 192.168.10.2) to firewall,
>    and use dnat for lan to dmz. can anyone suggest which kind of DMZ is
>    better?

Why do NAT at all between internal LAN and DMZ ?

Why not just route packets with no NAT involved, and allow the ones you want, 
block the ones you don't... ?

 

Antony.

