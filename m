From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Url not found ....
Date: Sun, 7 Jul 2002 00:09:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020706230959.IUOX16050.mta01-svc.ntlworld.com@there>
References: <EPEHIDPIPEBFNAHLCHPGAEMJCEAA.dennis@core-enterprises.com> <20020706220349.HAZV16050.mta01-svc.ntlworld.com@there> <200207070049.56748.captain.nuke@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207070049.56748.captain.nuke@gmx.at>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

On Saturday 06 July 2002 11:49 pm, Patrick Petermair wrote:

> Am Sonntag, 7. Juli 2002 00:03 schrieb Antony Stone:
> > What are the logging rules on your firewall ?

[ ....... ]

> #FWD: Allow all connections OUT and only existing and related ones IN
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG

Hmmm.   Not so different from mine, really, and I don't get any log entries 
when I visit that site.

Can you run ethereal and capture the complete session to see whether, for 
example, there are multiple FIN packets at the end of the session ?

The log entry you posted has both FIN and ACK set, so I presume it's the very 
last packet at the end of the connection...?

 

Antony.

