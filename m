From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: more questions about kernel config options for iptables
Date: Mon, 7 Apr 2003 17:18:24 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304071706510.20955-100000@dell>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: iptables mailing list <netfilter@lists.netfilter.org>


  having poked around even more in the options, i must say
i'm a little puzzled.  mostly, i'm interested in understanding
what some of these options do all by themselves, so forgive me
if i end up repeating myself.

  first, the basic Connection tracking option claims to be
necessary for masq/NAT.  what value is that option if it is
the only one selected?  it may be *necesasry* for masq/NAT,
but it certainly doesn't seem to be *sufficient*.  what is
the value of selecting that single option to the exclusion
of all others.  what does it allow you to do?

  next, notice that "IP tables support" also claims to be
necessary for masq/NAT.  if that's the case, it would seem
that these two options should somehow be interdependent.

  another way of looking at it might be, why would anyone
select "Connection tracking in the first place"?  might it
not be more reasonable to have the user select the 
*functionality* they want, and have something like
that basic connection tracking option as an invislble
dependency?

  to that end, it would make more sense to have a restructured
menu with more obvious options like

  Basic filtering
  Simple NAT
  Masquerading

and so on.  the actual object files associated with these
*functions* are of no interest to the user.  he/she cares
only about what can be done afterwards.

  here's another question.  notice the options under 
"Connection tracking".  first, i'm aware that because of 
the way FTP works, you need some connection tracking ability
to filter it properly.  so this is just straight FTP
filtering.

  note, however, that the next three options -- IRC,
TFTP and Amanda -- refer to using those protocols
in conjunction with NAT or masquerading.  if this is
the case, i can see having FTP in one submenu associated
with filtering, with the others in a submenu associated
with NAT/masq.  it just seems to make more sense that way.

  anyway, comments?

rday


