From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables permission problem in perl scripts
Date: Mon, 15 Aug 2005 08:12:37 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0508150811160.24339@yvahk01.tjqt.qr>
References: <3115d56e05081400344964ebcd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e05081400344964ebcd@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: afshin lamei <afshinlamei@gmail.com>
Cc: netfilter@lists.netfilter.org


>the cgi file is owned by root/root and is run by user nobody.
>myfile.pl is owned by root/root, and I've it setuid (chmod u+s
>myfile.pl ; chown root:nobody myfile.pl) to be able to run iptable
>commands, but it returns this error:

To run suid perl scripts, you must
- chmod u+s the script AND
- use "suidperl" AND
- have suidperl being u+s

And it's the biggest security hole as everyone says - does not [yet] reflect 
my opinion, though. So use some sudo magic (as recommended) if possible.


Jan Engelhardt
-- 

