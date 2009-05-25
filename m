From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 15:04:22 +0200
Message-ID: <4A1A9756.6040401@netfilter.org>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eduardo Sachs <edu.sachs@gmail.com>
Cc: netfilter@vger.kernel.org

Eduardo Sachs wrote:
> Hi Friends!
> 
> I'm looking for firewall solution for active/active, the clients use
> the firewalls randomly.
> 
> The conntrackd help me to replicate the state of the connection.
> 
> What help to "load balance" the firewalls?

Have a look at the "cluster match" in the git tree:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=iptables.git;a=commit;h=cd958a6c92c84095a439780b53832bb3aae2d512

It will be available in 2.6.30. I'm still finishing some user-level
documentation about it. The integration with conntrackd is also on the way.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
