From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP delay, solved
Date: Wed, 12 Jun 2002 21:02:48 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206122002.g5CK2nA02787@Networker.rockstone.co.uk>
References: <0fbe01c2122e$f0783300$2901a8c0@amos>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0fbe01c2122e$f0783300$2901a8c0@amos>
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

On Wednesday 12 June 2002 5:33 pm, Nathan Cassano wrote:

> Well you learn something new every day. Today I learned inetd does ident
> checks on it's clients.

Yes, it's called tcpwrappers, and has been pretty standard on systems for I'd 
say about four years now :-)

> This is annoying, is there a way you can turn
> this off inside inetd?

Yes, it's the bit on each line of /etc/inetd.conf which says "/usr/sbin/tcpd" 
- it does an ident lookup and logs the access to syslog before handing the 
connection over to the real daemon.

If you don't want this to happen them remove the "/usr/sbin/tcpd" from 
inetd.conf and just have the standard daemon listed there on its own.

 

Antony.

