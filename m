From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ESTABILISHED connections are not that estabilished
Date: Sun, 31 Jul 2005 13:20:22 -0500
Message-ID: <42ED1666.70602@gmx.co.uk>
References: <dc8blc$p5s$1@sea.gmane.org>
	<dca9si$kis$1@sea.gmane.org>	<42E8B668.3030201@gmx.co.uk>
	<dcd52v$tom$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dcd52v$tom$1@sea.gmane.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Gioele Barabucci wrote:
>>Suggestion: OUTPUT filtering is a bad idea.
>>
>>Why are you doing it? What is the benefit you think you are getting?
>>This sounds like a single user machine, from the fact that there's no
>>routing. Who are you limiting with OUTPUT rules? Yourself?
> 
> This is a public server and I fear that some of its daemons could be used to
> gain user access to the machine. None of my daemon runs as root, so if
> someone get in, it will get only user privs.
> I think that DROPping OUTPUT ensures that nobody will ever open the server
> to the outside or use the server to connect somewhere. Am I wrong? I'm

Not entirely. I did say (in text you snipped) this: "Carefully crafted 
rules to limit what your daemons can do with -m owner might slightly 
enhance security."

And yes, you're going to slow down an attacker with that if he's gotten 
shell access. Will it stop him from getting out? I doubt it. You allow 
ICMP out, and RELATED,ESTABLISHED in and out. I'm not sure how RELATED 
is figured (I hope someone will fill us in on the details) but I bet a 
"ping -q host.fqdn &> /dev/null" would allow outbound access to any 
services on host.fqdn. And anything they might need from the host they 
rode in on is accessible: if not RELATED, through ssh.

Furthermore, having a hostile user with shell access doesn't prevent 
privilege escalation exploits. Twice I've been asked by machine owners 
(with shell access) to restore their lost root access. Each time it was 
simple and straightforward. Once, I guessed the root password. The other 
time, I dropped to a shell from a SUID binary.

That said, your garden variety script kiddie isn't going to work that 
hard at it, and attack slowdowns often equate to security. I once left a 
guessable password on a guessable account name on a small virtual host 
(user-mode Linux.) Sure enough, the ssh bots got in. The lastlog caused 
the limited disk space to fill up and the kernel process crashed. I 
examined the system from the host and determined that no privilege 
escalation had occurred. They logged in and didn't know what to do 
because there was no apache, PHP, sendmail: the commonly used tools.

Sure, go ahead and work on it. Eventually I might try experimenting with 
some OUTPUT rules too. It won't hurt if you can allow your daemons to do 
only what they need -- but allow them *everything* they need. You might 
want to use a -m owner rule to allow your own user account out, at least 
while you're logged in.

But a better approach overall ... and this is what I do ... is to 
restrict services which might conceivably (or directly) provide a shell. 
SSH should only allow in secret keys, no password authentication. IMAP 
and POP3 should use virtual accounts and not provide access to the $HOME 
of the system user for the virtual accounts. (And do require secure 
authentication ... TLS, or force the use of IMAPS/POP3S.) It might not 
hurt to disable your apache userdir_module. (There might be other ways 
to harden apache too ... I don't specialise in that.)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

