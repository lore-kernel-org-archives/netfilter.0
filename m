From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: FTP Connection problems.
Date: Tue, 24 Aug 2004 10:04:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512C2@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org
Cc: Vincent Blondel <vincent.blondel@chello.be>

> I compiled a kernel without any modules ( all these are in vmlinuz ) =
an
> I use the very basic ftp client from coreutils ( so normally this does
> not initiate passive connections ).
>
> So what do I have to do ???

go look in your config file that you used to compile your kernel.  did =
you set CONFIG_IP_NF_CONNTRACK (i assume you did) and CONFIG_IP_NF_FTP =
(this is connection tracking for FTP)?  if not...i see a make config && =
make dep clean bzImage install in your future...

use an FTP client that allows you to switch between active and passive =
mode on the fly so you can determine what is and is not working.  i use =
ncftp, which supports 'set passive on|off'...  the basic "ftp" command =
that ships with FC1 supports switching back and forth with the 'passive' =
command.  the way your rules are set up, *active* FTP should be working.

also--please rethink this:

> $nat --policy PREROUTING  DROP
> $nat --policy OUTPUT      DROP
> $nat --policy POSTROUTING DROP
>
> $mangle --policy PREROUTING  DROP
> $mangle --policy OUTPUT      DROP

you'll never get anything working with those set to DROP (relatively =
speaking)...

-j

