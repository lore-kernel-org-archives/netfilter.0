From: Patrick Schaaf <bof@bof.de>
Subject: Re: ip_conntrack question
Date: Mon, 8 Jul 2002 17:48:19 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708174819.T13116@oknodo.bof.de>
References: <86E43FEDC7E2D411B9610002A50900EB8819AF@ddsmttayz076.ref.whs.mil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <86E43FEDC7E2D411B9610002A50900EB8819AF@ddsmttayz076.ref.whs.mil>; from bvosburgh@whs.mil on Mon, Jul 08, 2002 at 11:31:41AM -0400
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
Content-Transfer-Encoding: 7bit
To: "Vosburgh, Brian P, CTR, WHS-BB" <bvosburgh@whs.mil>
Cc: netfilter@lists.samba.org

> What are the session timeout controls with ip_conntrack?  I'm load balancing
> two netfilter (2.4.18 kernel, 1.2.5  ipt) boxes infront of a web server farm
> and I'm seeing an avg of 362 connections (GET's) per second, slabinfo
> reports 26k on one and 34k on the other.  What is ip_conntrack's definition
> and criteria for a "connection"?  How do they expire?  How can I expire
> them? etc.

Don't worry. If the above rates are stable, they correspond to a memory
usage of a measly 13MB RAM. If you compare with /proc/net/tcp on the
real servers, you should see similar amounts of sockets. It's normal
to keep around information per TCP connection, for some time.

You can't expire the connections by hand, and you don't want to.

If you are curious about the timeout mechanisms used, look at the
source: in net/ipv4/ip_conntrack_proto_tcp.c, you can find the
full state engine which classifies TCP connections as packets
fly by, and selects suitable timeouts for the various states.

It's a good topic to learn about, if you are so inclined, but it's
no worry for you as a system administrator.

best regards
  Patrick

