From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Problem with conntrackd: TCP RST sent on NAT connections
Date: Fri, 20 Feb 2009 17:49:23 +0100
Message-ID: <499EDF13.5000302@netfilter.org>
References: <200902201334.34830.misch@multinet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200902201334.34830.misch@multinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwartzkopff <misch@multinet.de>
Cc: netfilter@vger.kernel.org

Michael Schwartzkopff wrote:
> Hi,
> 
> I have a strange problem here. I set up a testbed like in the on on the 
> website, except that I have NAT im my scenario.
> 
> When I test a SSH connection everything goes fine.
> 
> When I download a file via HTTP the first failover works, but the failback 
> breaks the connection and the download stops. Tracing the connection show that 
> during the failback the HTTP Server sends a package to the virtual NAT address 
> of my firewall and the firewall send a TCP RST back and thus stops the 
> connection.
> 
> Of course I tried first to sync the connection table and after that set up my 
> virtual addresses, but it seems that it does not help.
> 
> A similar problem was described from Abhijit Menon-Sen on Oct, 30th 2007 on 
> the nf-failover mailing list. But I did not find any solution there.
> 
> My system:
> debian lenny.
> Kernel 2.6.26-1-686

I remember that this kernel version has some problems if your setup has
any helper, if so, I suggest you to upgrade to latest linux kernel.

> conntrackd version 0.9.6-4

This is rather old conntrack-tools version. Could you try latest
conntrack-tools version from www.netfilter.org?

Using the latest primary-backup.sh script from git.netfilter.org instead
of the old ones that you are using would be also a good idea:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=conntrack-tools.git;a=tree;f=doc/sync;h=d0e3afe1bca3a581d246fa0b07b67bb8175295f6;hb=HEAD

> Mode: FTFW, heartbeat as HA solution.
> 
> My firewall does allow everything. The only rule is the NAT rule that translats 
> all packets comming from internal to the virtual external address.

Your firewall has to drop invalid packets at least, see the example
rule-set in the website. The firewall sends a TCP RST to the client if
it didn't find the NAT information, this happens when the conntrack
entry does not exist.

> Any idea what could be wrong? How could I trace the problem further?

After the first failover, check the primary's internal cache and
backup's external cache with the commands:

show internal cache (do this in the primary):
# conntrackd -i

show external cache (do this in the backup):
# conntrackd -e

They should show the same entries.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
