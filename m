From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 08:28:46 +0100
Message-ID: <4E55F9AE.3010506@tolaris.com>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com> <4E55E602.6040905@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E55E602.6040905@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2011-08-25 07:04, Grant Taylor wrote:
> I'd sit down and think about how frequently this ""problem (such as it is)
> happens and if it has enough impact to cause me to want to re-design
> firewall rules to take it in to account.

Indeed. A better solution:

-A INPUT -p tcp ! --syn -m state --state NEW -j DROP
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

If your firewall script clears the connection states (conntrack -F) or
unloads and reloads the kernel modules (thus doing the same thing), you
will always have this problem, and no different iptables design will fix it.

Regards,
Tyler

-- 
"The Congress shall have Power . . . To promote the Progress of Science
and useful Arts, by securing for limited Times to Authors and Inventors
the exclusive Right to their respective Writings and Discoveries."
   -- Article I, Section 8, U.S. Constitution
