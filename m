From: Bourne Without <blackhole@airpost.net>
Subject: [announce] - Bash programmable completion for ip[6]tables
Date: Thu, 21 Mar 2013 11:23:34 +0100
Message-ID: <514ADFA6.8090400@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=E2UemTl+qd
	FXkj/0f3ZnchXxHGE=; b=prGXN+MFw9cq2n4OmUIKQV38zbNjbPSB6nAZs19woV
	+sQl/Wq8jPaZckDxcF0Y1UXm0el778IZtgmUi+IES00e5Fj99LIOpuPPeiUMPf3z
	nqewjUriCdkQDYuU+wQPeb0PGhvAmg8ZhFD6l9FMyByZaiFBuOgypttfAUwxS5zK
	I=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:content-type
	:content-transfer-encoding; s=smtpout; bh=E2UemTl+qdFXkj/0f3Znch
	XxHGE=; b=u2PL6laXWMxkXiKtCIs7gNAfWFtGitTagIbYzlp/SwGgjxssLkBn1Q
	RXnc5jiX1f8hUhl1baaKMVwqfjDMknT6qaH3uqPKH4N9dCqcwxGlOLB/ZcL1l4nX
	kkWTOUHbQonnwTIsv57jShxQAcFNcTTDtLFQxo9b78KJDl41oPNew=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter-devel@vger.kernel.org
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,

I've written bash programmable completion (compspec) for ip[6]tables.
There is already completion code for iptables in the bash_completion 
package, but it is far less feature rich (just knows about the basic 
options).
My version supports all options (except -4, -6), matches and targets by 
iptables v1.4.18. Plus some data is retrieved dynamically from the 
system (i.e. interface names) and IP and MAC addresses can be feed by file.

This is an alpha release and is available here:

http://sourceforge.net/projects/ipt-bashcompl/?source=navbar

mirror:
https://github.com/AllKind/iptables-bash_completion

Readme:
https://github.com/AllKind/iptables-bash_completion/blob/master/README.md

or:
http://sourceforge.net/p/ipt-bashcompl/code/ci/541c6a8b26b1acd1fb228b0a24e94256507451ab/tree/README.md


As by myself I only use and know about a subset of the features 
available, I extracted all information from the man page. Some things I 
could not resolve by that. I was hoping for the community and people 
from devel to help me fill the gaps. As I'm trying to make things as 
accurate as possible, showing only what is needed, when it is needed...

* AUDIT target - is it valid to audit 'drop' in the nat table? Doesn't 
the nat table forbid DROP?

* MASQUERADE/REDIRECT targets - the man page says --to-ports and 
--random are only valid for tcp/udp. What about dccp, sctp, udplite?

* MIRROR target - Is it valid in all or just the mangle table?

* TEE target - is it valid in all tables, commandline does not complain?

* connlimit match - is it valid in all tables? raw, nat?

* devgroup match - Can I retrieve a list of the device groups from the 
system? The only thing I found was a site at sf.net, not updated for 
years. I did not yet try to compile/install that piece of software.

* helper match - is there a way to retrieve all available helper names 
from the system? If not, maybe I should just list the ones available by 
now? And which are they, is there a doc somewhere listing them?

* mh match - list of named mh-types? `ip6tables -p ipv6-mh -h' does not 
display them, as the man page promises.

* osf match - What are the actual valid genre strings? Anybody knows or 
already did it, retrieve the valid genre strings dynamically, as they 
might change?

If somebody notices a match or target displayed for the wrong table, 
please inform me, so I can correct it.

I wasn't able to compile conntrack-tools yet, so CT targets timeout 
policies cannot be dynamically retrieved by now. If someone already 
coded that piece, let me know :)

Another feature of this completion is, that in many cases it does 
validation of users input (i.e. when an integer value is expected) and 
refuses completion after invalid input.
I hope I made the checks correctly.
If somebody notices an error or has an idea what I've left out, let me know.
This input validation might interfere with variable/command 
substitution/glob completion. This issue is not resolved yet. I'm 
thinking of implementing an environment variable to turn input 
validation on/off.
Variable/command substitution makes things very unpredictable (from the 
programs view), so I'm not sure if I should keep that feature at all.
Community feedback wanted...

I hope you like that piece of software and the design desicions i took.
Help, ideas, bug-reports, etc... are very much welcome.

Have a nice day!
