From: "Scott Ware" <wsware@hotmail.com>
Subject: NAT loopback
Date: Thu, 20 Jun 2002 09:56:10 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <F58UIHNkjgJKVApwOLZ00003810@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

With the iptables is it possible to allow NAT clients to talk to each other 
through the External IP address?

One example I and talking about is, say you have a web server on an internal 
machine and the port is forwarded so anyone browsing to your external IP 
address is directed to that machine. I would  like it to work when internal 
clients browse to the External IP that they also get  forwarded to that 
internal machine.

The issue is with peer-to-peer applications.  I need to be able to let 2 
internal PC talk to each other through the external IP address, this is the 
only way they can talk to each other and the internet at the same time.

External IP 64.118.165.23
  PC#1 192.168.1.10
  PC#2 192.168.1.11

NAT port forwarding setup
  Port 3405 udp/tcp -> 192.168.1.10
  Port 3406 udp/tcp -> 192.168.1.11

192.168.1.10 connects to an external server and all the peers are told about 
each other and begin to talk, port 3405 is used for this client

192.168.1.11 connects to the same server and all the peers are told about 
each other and begin to talk, except 192.168.1.11 wants to talk to 
64.118.165.23 on port 3405 and 192.168.1.10 wants to talk to 64.118.165.23 
on port 3406. This traffic just seems to get lost...

Any help with this?

-Scott


_________________________________________________________________
Send and receive Hotmail on your mobile device: http://mobile.msn.com


