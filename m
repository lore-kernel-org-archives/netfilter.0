From: "Adam D. Barratt" <netfilter.list@adam-barratt.org.uk>
Subject: Re: Strange misunderstandings
Date: Fri, 31 May 2002 22:34:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <0bb301c208ea$eebdc9a0$3200a8c0@jungle.funkybadger.org>
References: <001301c208d6$f3a956a0$6301a8c0@JJONES1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

John Jones asked:

> [root] iptables -h
> ...
>   --check   -C chain            Test this packet on chain
> ...
>
> [root] iptables --check
> iptables v1.2.6a: Unknown arg `--check'
>
> What's up with that?  The help screen shows me it is a command, but
it
> doesn't exist?  Is this an optional kernel compilation thing that is
> missing, or has it been removed from the distro?

It's been removed. It has never been implemented, and never will be.
v1.27 (i.e. current CVS version) no longer contains references to this
option.

hth

Adam


