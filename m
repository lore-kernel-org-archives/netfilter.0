From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: [OT]Re: intrusion detection
Date: Mon, 19 Apr 2004 11:27:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082388473.19332.33.camel@localhost>
References: <web-288458957@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-288458957@mail01.infosat.net>
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
To: IT Clown <iptables@mailbox.co.za>, netfilter@lists.netfilter.org

On Sun, 2004-04-18 at 13:29, IT Clown wrote:
> Hi
> 
> What intrusion detection software would you guys
> recommend?Is psad or portsentry any good? 
<snip>
I wonder if I might permutate this question slightly.  I have spent a
fair amount of time recently looking at Intrusion Detection Systems and
came away with a conclusion I did not expect.  I would like to share
that conclusion not to start a flame war but to hold it up to scrutiny
to see if I am truly out of my mind or whether it makes sense.

I concluded that NIDS can be effective but that they required so much
upkeep, maintenance and ongoing expertise that I would rather invest my
time and money in other security measures.  There were two primary
reasons for this conclusion.

1) Those attempting to perpetrate an intensional, focused attack (as
opposed to the random "door-knob jiggling" antics of script-kiddies) are
as likely to attack from the inside as from the outside.  In other
words, if the front door firewall is secure, I would not waste my time
trying to break through it.  I would send forged e-mails that direct
internal users to a phished site where I would plant a malicious trojan
or I would find a vulnerable remote user, e.g., one with an insecure
home wireless access method and do a man-in-the-middle attack.  In our
brave new networked world, I would find a way to attack from the inside
rather than the outside.
That makes the placement of NIDS quite a challenge.  How many and where
do I place them? Do I use port mirroring or taps? What are the impacts
on network capacity and traffic patterns? Do I fail safe or open?
By the time of build a NIDS environment to protect against external and
internal attacks, I can have a very complex and very expensive
architecture - one that may have inflicted more impact on the business
bottom line that the attacks it may prevent.

2) As I studied the mechanisms used to evade NIDS and the
counter-measures use to defeat the evasion attempts, it seemed like a
constant "cat and mouse" game -- one that required constant vigilance
and maintenance.  I felt like my NIDS would be secure only until the
next major publication of a new evasion technique.

This does not mean that NIDS cannot work -- just that it takes a lot of
effort and expertise to make it work well.  I felt I would rather make
the following investment in time and money:

1) Create a multi-layered security environment with inter and intra
office access control and encryption and move away from the "hard and
crunchy outside - soft and chewy inside" perimeter security model.  Of
course, I am quite biased here as making this method affordable is one
of the driving factors behind the ISCS project I am working on
(http://iscs.sourceforge.net).  If an attacker breaches my outer
defenses or is attacking from the inside, I want to do my best to
contain them to a limited area.

2) Combine regular vulnerability assessments using something like the
automated features of the fabulous Nessus product
(http://www.nessus.org) with an automated software management tool to
close known vulnerabilities as quickly as possible.  If an attacker
manages to break through all my defenses, I want to render them impotent
and unable to use known exploits against my systems.

3) Implement even a simple HIDS or integrity checker like tripwire or
the fully open source Osiris (http://osiris.shmoo.com).  If an attacker
has penetrated all my defenses and succeeded in using some exploit, I
want to know about it.

This threefold solution is also not simple.  But given the return on
investment of my time an money maintaining NIDS in an ever changing
security world where an attack is as likely to come from the inside as
the outside versus maintaining these three combined strategies, I think
I get more from my investment in the latter.

However, as always, I am suspicious of putting too much faith in my own
conclusion without significant corroboration.  I would be interested in
other's thoughts, insights and insults -- well, maybe not too many
insults.  Thanks, all - John
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


