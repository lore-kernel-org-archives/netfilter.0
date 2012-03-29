From: Firstname Lastname <forbiddentransition@gmail.com>
Subject: Re: iptables and the owner module
Date: Thu, 29 Mar 2012 13:52:45 -0400
Message-ID: <20120329135245.50938cdf@gmail.com>
References: <20120327194521.00a33d86@gmail.com>
	<alpine.LNX.2.01.1203280325160.14701@frira.zrqbmnf.qr>
	<20120328124332.66e7ad79@gmail.com>
	<alpine.LNX.2.01.1203282242140.22987@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
         :mime-version:content-type:content-transfer-encoding;
        bh=aWTbBNMyDl/U8ziRat1NGBjvL08DvHFSQUQ2KnPQJM0=;
        b=SaybA1HGYrGNUQL5HXPHSjK0yFH3wvFLLbNqVDXeINykOcYDBXm4s1fKio2KaeVLYb
         Sz0F4CZr7/7t+Xvq1t2bn2XyhEjQI6SNZlvUC4dU6xgXiLv5MvQ26Zr6kAIwEtGLZizo
         nOBIjH+w/6+hsdvV6HpUxkFwpqeUHPQ+ftAOOsVX4Vm5dC5xX/k5yof19sF4T4Y5yekn
         Vc4Qy2ulYKih3fs7b3+77lZHGW8B3PDkG7fLfmq/EOxpqFQe1HRboI56DkbHz3U6RDYq
         OQcz5k/qZr49XJEIYiUGzKC9WQjChMPMQJ9DrTxFB76eUH6Krds6MRYRkd4nS57gEODb
         m0DA==
In-Reply-To: <alpine.LNX.2.01.1203282242140.22987@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

On Wed, 28 Mar 2012 22:48:23 +0200 (CEST)
Jan Engelhardt <jengelh@medozas.de> wrote:

> On Wednesday 2012-03-28 18:43, Firstname Lastname wrote:
> >
> >>>-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --uid-owner 1000 -j ACCEPT
> >>
> >> ct state is [perhaps] not NEW nor EST.  
> >
> >If the ct state is not NEW nor EST, then its my understanding that none of the rules should match.
> >
> >The order through the chain is as stated previously: 
> >
> >  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --uid-owner 1000 -j ACCEPT
> >  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j LOG --log-tcp-options --log-ip-options --log-uid --log-level 7
> >  -A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j DROP
> 
> But are these really all the rules? It has happened too often that users only ever appended rules, such that the trailing ones were never executed, since some old rules occurring before them already rendered a final verdict.

Of course those 3 lines are not all the rules, they are the relevant ones.

The match occurs with the respective 2 rules I mentioned, not before and not after.
The actual logging rule I use is the following and might help to clarify why I'm certain of this.

-A OUTPUT -o eth0 -p tcp -m tcp --sport 32768:61000 -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -m owner --socket-exists -j ULOG --ulog-prefix "<!>SocketExists "

It is essentially the same logging rule I posted but defined with the prefix option to elucidate exactly where in the chain the drop occurs.
Every rule in my test configuration with a DROP or ACCEPT target has a matching rule with a target of ULOG --ulog-prefix "foo" for this very purpose.

> Never post iptables -L -- always post iptables-save, unabridged.

The format of the listed rules are equivalent to the output generated with "iptables -S" or iptables-save, and are unabridged.

> N.B.: Unrelated to the observed packet, as for rule content goes, 
> 32768:61000 looks highly suspicious of "I know better than the RFC"[sic] 
> and is a recipe for some program to stumble and fall on.

This appears to be a common range used in many configurations and I believe it may be a Debian default.
It has never resulted in any 'noticeable' problems, but I take your point.

> >The 3 rules are nearly equivalent, the difference being the owner module option, --uid-owner vs. --socket-exists (and, of course, the target).
> >The initial SYN packet to google.com is not matched in the first rule, and thus passed to the second rule where the packet is matched and logged.
> >The packet is then passed to the third rule and dropped.
> >
> >Oddly, though, if I add "173.194.73.103 www.google.com" to the hosts file, the intial SYN packet is matched in the first rule and thus accepted.
> 
> So perhaps you have a specific (not shown) -d 173.194.73.103 match 
> somewhere and ran afoul of google.com having multiple addresses.

I'm certain this is not the case.

The issue appears to be specific to connections to google.com when a DNS query is made prior to the initial SYN packet being sent to google.
It is the SYN packet to google.com that is being dropped.
The issue is transient and started about 2 weeks ago.
Yesterday evening connections to google.com proceeded as expected, i.e. no drops.
This morning the connections are being dropped as a result of the aforementioned rule.
The host was not rebooted and the iptables configuration was not modified in the interim.
Adding an entry for google.com to the hosts file, thus bypassing a DNS query, resolves the issue.
In any case, this issue appears to be beyond iptables.
And, again, I appreciate the response. 

Bill
