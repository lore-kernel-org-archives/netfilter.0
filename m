From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Group on Iptables
Date: Thu, 28 Aug 2003 09:37:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308280937.27909.gdh@acentral.co.uk>
References: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E9C5F057A783F94E9868010ACFDB3AA454A2E6@srvpadovaad.cerved.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Wednesday 27 August 2003 3:44 pm, Masiero Giorgio, PD wrote:
> 	Is it possible to use objects like Checkpoint Groups (that is a set of
> host and/or networks) into an Iptables rule.

You can achieve a 'groups' functionality by defining new tables, e.g.

$IPTABLES -N UNIXSERVERS
$IPTABLES -N WINSERVERS

$IPTABLES -A FORWARD -p tcp -d 11.22.33.44 -j UNIXSERVERS
$IPTABLES -A FORWARD -p tcp -d 11.22.33.45 -j UNIXSERVERS
$IPTABLES -A FORWARD -p tcp -d 11.22.33.46 -j UNIXSERVERS

$IPTABLES -A FORWARD -p tcp -d 11.22.33.54 -j WINSERVERS
$IPTABLES -A FORWARD -p tcp -d 11.22.33.55 -j WINSERVERS
$IPTABLES -A FORWARD -p tcp -d 11.22.33.56 -j WINSERVERS

Now any traffic for the UNIX servers with IP addresses 44, 45, 46 will go to 
the UNIXSERVERS table, and likewise any traffic for the Windows servers with 
IPs 54. 55, 56 will go to the WINSERVERS table.

You can now apply 'group policy' by doing

$IPTABLES -A WINSERVERS -p tcp --dport 135:139 -j DROP
$IPTABLES -A WINSERVERS -p tcp --dport 445 -j DROP

$IPTABLES -A UNIXSERVERS -p tcp --dport 5900 -j DROP

etc.

Cheers,
Gavin.


