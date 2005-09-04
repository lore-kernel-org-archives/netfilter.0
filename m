From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: FW: NEW "SSH Brute Force " ruleset (20050628.0)
Date: Sun, 4 Sep 2005 07:17:05 +0200
Message-ID: <17627.8010280386$1125811086@news.gmane.org>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

has anyone used "expire" module to append a new rule that will last for
hour/day/week depending on number of new connection to sshd in one minute?

I am not an expert here but I saw that module and this ruleset was first
that came to my mind... suggestions??

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
Sent: Sonntag, 04. September 2005 07:01
To: netfilter@lists.netfilter.org
Subject: Re: NEW "SSH Brute Force " ruleset (20050628.0)

I'm glad this came up again, because I have my own, simpler solution 
working. Mine only depends on the -m limit and -m state match 
extensions, both fairly standard and widely used.

My firewalls generally have a "State" chain called first from both 
FORWARD and INPUT, with these rules:
-A State -m state --state INVALID -j DROP
-A State -m state --state RELATED,ESTABLISHED -j ACCEPT

"--state RELATED" lets in the ssh attack bots, so I've diverted SSH 
packets in the State chain:
-A State -m state --state INVALID -j DROP
-A State -p tcp --dport 22 -j Ssh
-A State -m state --state RELATED,ESTABLISHED -j ACCEPT

The new "Ssh" chain does this:
-A Ssh -m state --state ESTABLISHED -j ACCEPT
# [ a rule to allow from internal hosts here, optional ]
-A Ssh -m limit --limit 3/m -j ACCEPT
-A Ssh -m limit --limit 1/m j LOG --log-prefix "SSH attack: "
-A Ssh -j REJECT
# or DROP if you prefer

It does seem to work to repel the attacks. IME of watching a couple 
attacks hit, they quit and move on after the rejections start. Script 
kiddie phishers don't deal well with rejection. :)

However, this might not be practical for a public shell server with a 
lot of users. (I guess. I don't know exactly how the --limit is 
applied. Is that 3/m from the whole Internet, or 3/m from any given 
host?)

Another curious thing about the --limit is that when I stress test it:
for X in `seq 99` ; do
    echo $X | nc target.hostname ssh & echo -n $X
done
with 3/m I get 5 connections through, and usually about 5 logged with 
the 1/m limit. That test just now got 8 connections through (not all 
made it in the first minute.)

I don't think the limit will cause me any problems; even if I had to 
retype a password I get 3 chances before sshd cuts me off, and those 
retries are in "--state ESTABLISHED".
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header



