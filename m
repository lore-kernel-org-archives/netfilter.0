From: Ami Ganguli <ami.ganguli@gmail.com>
Subject: "No chain/target/match by that name" when using -m state
Date: Wed, 22 Jun 2005 18:05:21 +0300
Message-ID: <87eeecff050622080541743401@mail.gmail.com>
Reply-To: Ami Ganguli <ami.ganguli@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I've been searching around for the answer to this and I've finally
given up trying to solve it on my own.  Any hints would be much
appreciated.

I'm entering the following command (cut and paste from the command line):

     iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCE=
PT

which appears in various docs.  It looks pretty straightforward, but I
get this error:

    iptables: No chain/target/match by that name

If I enter the same command without  "-m state --state
ESTABLISHED,RELATED" it's accepted, so I figure my problem is there
somewhere.

I thought that maybe my kernel (2.6.11.10, ARCH=3Dxen) was compiled
without connection tracking, but dmesg includes the following:

    ip_tables: (C) 2000-2002 Netfilter core team
    ip_conntrack version 2.1 (1024 buckets, 8192 max) - 244 bytes per connt=
rack

also, if I enter "iptables -m state --help" I get the normal help with
this at the end:

     state v1.2.11 options:
          [!] --state [INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED][,...]
                                State(s) to match

so I figure I must have the necessary bits installed.

Any ideas or hints on what I should do next to debug this?

Regards,
Ami.

