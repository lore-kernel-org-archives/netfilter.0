From: Tony Earnshaw <tonye@billy.demon.nl>
Subject: Re: iptables: Problem in Kernel 2.6.4
Date: Fri, 19 Mar 2004 07:38:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079678313.5133.9.camel@localhost>
References: <HUT36K$CE1E161A9FBC75897443932B0D75698B@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HUT36K$CE1E161A9FBC75897443932B0D75698B@bol.com.br>
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
To: netfilter <netfilter@lists.netfilter.org>

fre, 19.03.2004 kl. 05.30 skrev hostingbr:

> I'm need install the KISS firewall on server with 
> kernel 2.6.4 but receive this error:
> 
> root@servidor7 [/usr/bin]# ./kiss start
> lsmod: QM_MODULES: Function not implemented

[...]

> The first error not found files 
> in /lib/modules/2.6.4/... I'm create a symbol link of 
> 2.6.4 to 2.4.21-4.0.1.ELsmp (the directory exist 
> in /lib/modules).

Looks like you did exactly what I did on RedHat RHEL3 - and then got
exactly the same as you. I compiled and installed kernel.org 2.6.4 ACPI,
it worked. I then installed up2date's modutils-2.4.25-11.EL.i386.rpm and
got what you report. I reinstalled modutils-2.4.25-10.EL.i386.rpm and
the problem went away.

It's a bad problem, since it means that insmod (modprobe et al) can't be
used anymore, for anything. Including iptables.

Best,

--Tonni

-- 

mail: billy - at - billy.demon.nl
http://www.billy.demon.nl


