From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP delay, solved
Date: Thu, 13 Jun 2002 13:05:11 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131205.NAA07068@slate.rockstone.co.uk>
References: <0fbe01c2122e$f0783300$2901a8c0@amos> <200206122002.g5CK2nA02787@Networker.rockstone.co.uk> <news2mail-ae9qee$vvr$1@babel.spoiled.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <news2mail-ae9qee$vvr$1@babel.spoiled.org>
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

On Thursday 13 June 2002 10:59 am, Juri Haberland wrote:

> >> This is annoying, is there a way you can turn
> >> this off inside inetd?
> >
> > Yes, it's the bit on each line of /etc/inetd.conf which says
> > "/usr/sbin/tcpd" - it does an ident lookup and logs the access to syslog
> > before handing the connection over to the real daemon.
> >
> > If you don't want this to happen them remove the "/usr/sbin/tcpd" from
> > inetd.conf and just have the standard daemon listed there on its own.
>
> This is a very bad advice as the tcpwrappers are a standard security
> tool which shouldn't be disabled!

I wasn't advocating this as good advice - I was simply answering the question 
"how do I do it".

I don't regard eliminating tcpwrappers as a good idea, just for the record.

Mind you, I do also think that ident lookups are a bit of an anachronism 
which we could well do without in many situations these days, however I don't 
like having a firewall which automatically responds on port 113 to anyone who 
cares to probe it...

There's no satisfactory answer to this problem at present, I think.

 

Antony.

