From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: nftables
Date: Thu, 30 Apr 2020 13:52:56 +1000
Message-ID: <87imhhvdd3.fsf@goll.lan>
References: <c8a517b2-3e1e-f7f5-53d6-b3e4daf638bc@gmx.de>
        <16ac0a06-b73e-dd66-c858-ae9ea26034d6@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Fatih USTA <fatihusta86@gmail.com> writes:

> You can use sets in nftables like iptables ipset.
> http://wiki.nftables.org/wiki-nftables/index.php/Sets

See also sshguard[1] or fail2ban, for turnkey Intrusion Prevention Systems
(i.e. "block attackers by IP address").

Their nft-specific code is not very interesting:

https://bitbucket.org/sshguard/sshguard/src/master/src/fw/sshg-fw-nft-sets.sh
https://github.com/fail2ban/fail2ban/blob/bb0f732ae69894b22306dd7efa213513e3acd8a2/config/action.d/nftables.conf


[1] don't be fooled by the name; sshguard also handles postfix, dovecot, and NCSA (nginx/apache).

