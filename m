From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: How I can do correct uninstall of IPTables?
Date: Fri, 20 Dec 2002 12:45:39 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212201237420.6419-100000@localhost.localdomain>
References: <001e01c2a809$c81d4a50$8d96e6c3@ukrpack.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2a809$c81d4a50$8d96e6c3@ukrpack.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anatoliy Borisov <borisov@ukrpack.net>
Cc: Netfilter general discussion and user questions <netfilter@lists.netfilter.org>


I don't know if there is any uninstall mechanism in userland iptables.
I'd re-run "make installl" again, take note of the files installed,
remove them and run

  apt-get remove iptables
  apt-get install iptables

As of this moment, I don't know how to produce a Debian package from
source code, but this would be off topic anyways.

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117

On Fri, 20 Dec 2002, Anatoliy Borisov wrote:

> Hello.
>
> I have installed from source (make install ....) iptables userland packet. How I can do correct uninstall of this so that the my system switch to previous (such before installation) state?
>
> environment:
> - OS Debian GNU/Linux 3.0
> - IPTables 1.2.7a
>
> Anatoliy Borisov  ( borisov@ukrpack.net )
> Engineer, "INFOCOM" JV


