From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables management problem
Date: Wed, 4 Dec 2002 12:16:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212041216.34729.netfilter@newkirk.us>
References: <F139OSnJTycBI0c0deU0002173e@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F139OSnJTycBI0c0deU0002173e@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Wednesday 04 December 2002 11:35 am, Afshin Lamei wrote:
> I have installed the Iptables 1.2.6a according to the netfilter's docum=
ent,
> but It doesn't act as a service.
> Do I need to manually setup my firewall after each system boot up?
> --afshin

In the default setup, yes.  One solution is to create a script (name it=20
firewall for convenience) in /etc/rc.d/init.d (well, at least with some=20
distros, such as RedHat) and links to it as /etc/rc.d/rc5.d/Sxxfirewall a=
nd=20
/etc/rc.d/rc3.d/Sxxfirewall (where xx is a number to start it at your cho=
sen=20
point in the starting sequence, relative to the other Sxx script links fo=
r=20
each of those runlevels, again RedHat - your distro may differ).  As long=
 as=20
you have a valid script named (ie) /etc/rc.d/init.d/firewall then "servic=
e=20
firewall start" will start it.  The links in rc5.d and rc3.d will cause i=
t to=20
be automatically started in each of those runlevels.  If you want, you ca=
n=20
write your script to support start, stop, and restart, the standard=20
parameters most such scripts support, but that isn't necessary to buildin=
g=20
the firewall at system boot.  If there are no parameters supported, then =
when=20
it is invoked during boot with the 'start' parameter the script will simp=
ly=20
ignore the parameter and execute anyway.

j


