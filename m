From: Juri Haberland <list-linux.netfilter.users@spoiled.org>
Subject: Re: TCP delay, solved
Date: Thu, 13 Jun 2002 09:59:42 +0000 (UTC)
Sender: netfilter-admin@lists.samba.org
Message-ID: <news2mail-ae9qee$vvr$1@babel.spoiled.org>
References: <0fbe01c2122e$f0783300$2901a8c0@amos> <200206122002.g5CK2nA02787@Networker.rockstone.co.uk>
Reply-To: Juri Haberland <juri@koschikode.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Antony Stone <Antony@soft-solutions.co.uk> wrote:
> On Wednesday 12 June 2002 5:33 pm, Nathan Cassano wrote:
> 
>> Well you learn something new every day. Today I learned inetd does ident
>> checks on it's clients.
> 
> Yes, it's called tcpwrappers, and has been pretty standard on systems for I'd 
> say about four years now :-)

That might not be true. Actually it depends on how the tcpwrappers are
compiled. AFAIK the tcpwrappers are compiled with ident lookup by
default but these are only done when you have a line like:

in.ftpd: user@192.168.0.

in your hosts.access file. So in general the tcpwrappers do not do ident
lookups.

>> This is annoying, is there a way you can turn
>> this off inside inetd?
> 
> Yes, it's the bit on each line of /etc/inetd.conf which says "/usr/sbin/tcpd" 
> - it does an ident lookup and logs the access to syslog before handing the 
> connection over to the real daemon.
> 
> If you don't want this to happen them remove the "/usr/sbin/tcpd" from 
> inetd.conf and just have the standard daemon listed there on its own.

This is a very bad advice as the tcpwrappers are a standard security
tool which shouldn't be disabled!
And it won't help in cases of telnet and ftp as they do their ident lookups
themselfs!

The only way to go is to use iptables to reject those lookups.

Cheers,
Juri

-- 
Juri Haberland  <juri@koschikode.com> 


