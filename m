From: Benjamin Schieder <blindcoder@scavenger.homeip.net>
Subject: Re: ipt_owner on SMP
Date: Fri, 07 Oct 2005 20:36:49 +0200
Message-ID: <4346C041.4010108@scavenger.homeip.net>
References: <20051007124243.GM16309@scavenger.homeip.net>
	<Pine.LNX.4.61.0510072016480.17798@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510072016480.17798@filer.marasystems.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Henrik Nordstrom wrote:
> On Fri, 7 Oct 2005, Benjamin Schieder wrote:
>> I'm currently writing an application that makes heavy use of the
>> ipt_owner
>> module and the owner-socketlookup patch from patch-o-matic.
>> Now I'm at a point where using --pid-owner becomes necessary.
>> My machine is a dual P3 800 SMP machine, which results in:
>>
>> ipt_owner: pid, sid and command matching is broken on SMP.
> 
> 
> Yes. The owner match need to violate too many layers of the Linux
> networking, making assumptions which is not true in an SMP system.
> 
>> Is there any way to fix this so I can use this feature or do I have
>> to work around this brokenness somehow with ipt_comment?
> 
> 
> No good approach on how to even attempt to fix the owner match for SMP
> is known at this date. The networking stack is simply not designed with
> this in mind.


I see.
Well, I've found another way to achieve the desired effect, maybe someone else
can also make good use from it:
I use -m comment --comment 'inode:$inode' to add an easily parseable information
to the rule.
$inode is the inode part read from /proc/net/tcp, tcp6, udp or udp6. This is
also available in /proc/<pid>/fd/<one of this> in the form:
socket:[inode]. This information is checked against each other and so I get the
PID of the process.

Greetings,
	Benjamin

- --
  ____  _        _    ____  _   _ _ _____ __  __
 / ___|| |      / \  / ___|| | | ( ) ____|  \/  |
 \___ \| |     / _ \ \___ \| |_| |/|  _| | |\/| |
  ___) | |___ / ___ \ ___) |  _  | | |___| |  | |
 |____/|_____/_/   \_\____/|_| |_| |_____|_|  |_|
 play online: telnet://slashem.crash-override.net
 view scores: http://slashem.crash-override.net
 watch deaths: irc://irc.freenode.net#slashem
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDRsBA7Wabow2Um2YRAjZ2AKCQzoiYiNc6C7uLzdaCCsRO2NxaQwCgo7Bh
6LLK9xK4yIsmdcjeqw2p3Os=
=9wwy
-----END PGP SIGNATURE-----

