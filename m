From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT loopback
Date: Thu, 20 Jun 2002 15:02:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206201402.g5KE2vU32695@vulcan.rissington.net>
References: <F58UIHNkjgJKVApwOLZ00003810@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F58UIHNkjgJKVApwOLZ00003810@hotmail.com>
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

On Thursday 20 June 2002 2:56 pm, Scott Ware wrote:

> With the iptables is it possible to allow NAT clients to talk to each other
> through the External IP address?
>
> External IP 64.118.165.23
>   PC#1 192.168.1.10
>   PC#2 192.168.1.11
>
> NAT port forwarding setup
>   Port 3405 udp/tcp -> 192.168.1.10
>   Port 3406 udp/tcp -> 192.168.1.11
>
> 192.168.1.10 connects to an external server and all the peers are told
> about each other and begin to talk, port 3405 is used for this client
>
> 192.168.1.11 connects to the same server and all the peers are told about
> each other and begin to talk, except 192.168.1.11 wants to talk to
> 64.118.165.23 on port 3405 and 192.168.1.10 wants to talk to 64.118.165.23
> on port 3406. This traffic just seems to get lost...

It gets lost because 192.168.1.10 is trying to reply to 192.168.1.11, which 
is on the local LAN, therefore it doesn't get reverse NATted through the 
firewall (and 192.168.1.11 can't understand why it sent a packet to 
64.118.165.23 and got a response from 192.168.1.10....)

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

(Once Harald has got the website working again properly...)

 

Antony.

