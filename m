From: Jan Humme <jan.humme@xs4all.nl>
Subject: Re: how to delete *some* netfilter rules?
Date: Fri, 5 Jul 2002 13:49:22 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <02070513492203.14428@Lms>
References: <20020614161800.GA6137@kostra.uh.cz>
Reply-To: jan.humme@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020614161800.GA6137@kostra.uh.cz>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Pavel Mores <pvl@uh.cz>, netfilter@lists.samba.org

On Friday 14 June 2002 18:18, Pavel Mores wrote:
> Hello,
>
> the problem I'm facing now might well be already solved by someone else
> so I thought I'd better ask.
>
> My filter table is filled by several separate independent scripts, each
> serving a distinct purpose.  Say that I use one script to generate
> firewalling rules and another to enter a couple of packet accounting
> rules needed by a monitoring subsystem.  Now, what if I want to flush
> the firewalling rules *without* disturbing the traffic monitoring rules?
>
> It certainly is possible to add to the firewall script a "delete_rules"
> function that would basically mimic my "insert_rules" function, only
> with -D instead of -A or -I.  But this tends to be ugly and avoiding the
> need to edit 2 places for every single change is not easy in bash (can't
> use perl there).

Your bash script could look like this:

#!/bin/bash

ADD=3D-A
INS=3D-I

if [ -n "$1" ]; then
	if [  "$1" !=3D "delete" ]; then
		echo usage: $0 [delete]
		exit 1
	fi
	ADD=3D-D
	INS=3D-D
fi

#examples:
iptables $ADD INPUT -i eth0 10.0.0.0/8 -j DROP
iptables $INS OUTPUT -i eth0 192.168.0.0/16 -j DROP

# etc etc etc

Now:
1) If you run your script w/o any parameter, it works like today.
2) If your provide the text "delete" as the second parameter, it deletes al=
l=20
the rules.
3) In all other cases, it prints an error message.

>P.S. =A0Please Cc: your replies to me since I'm not subscribed to this
list.

Please do.

Jan Humme.

