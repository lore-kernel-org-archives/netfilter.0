From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Thu, 13 May 2004 13:46:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405131346.12621.gdh@acentral.co.uk>
References: <20040429095949.GB22172@acentral.co.uk> <20040429133757.GK7147@samad.com.au> <20040429144757.GA6534@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040429144757.GA6534@zion.homelinux.com>
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

On Thursday 29 April 2004 15:47, Sven Schuster wrote:

>So you will additionally need a SNAT rule on
> your firewall, something like
>
> iptables -t nat -A POSTROUTING -p tcp -i eth1 -s 10.0.0.0/8 \
>    -d 10.0.0.253 --dport 25 -j SNAT --to 10.0.0.xx:25
>
> where xx would be the ip of your firewall. Now both the packets
> from the client to the server and the returning packets from the
> server to the client will travel through your firewall.

This is just a final followup to say thanks for the advice, and to report on 
the final solution.

eth0 is the 0utside, and eth1 is the 1nside (that's what I use to stop 
confusing myself...) and 10.0.0.254 is the firewall and default gateway for 
all LAN machines 

$ iptables -t nat -A PREROUTING -p tcp -i eth1 -s ! 10.0.0.253 --dport 25 -j 
DNAT --to 10.0.0.253:25
$ iptables -t nat -A POSTROUTING -p tcp -s 10.0.0.0/24 -d 10.0.0.253 --dport 
25 -j SNAT --to 10.0.0.254

This way, LAN users trying to connect directly to an external mail server get 
sent to the MTA on 10.0.0.253, and 10.0.0.253 itself still has full access to 
'real' port 25 in order that it can deliver mails! :)

Cheers,
Gavin.

