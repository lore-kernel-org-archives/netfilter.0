From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables counters
Date: Tue, 9 Jul 2002 15:03:38 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207091403.g69E3h809398@vulcan.rissington.net>
References: <DEFBF1A79446684593DB6374EA131C2D6BDC16@titan.ecitele.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <DEFBF1A79446684593DB6374EA131C2D6BDC16@titan.ecitele.com>
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Tuesday 09 July 2002 2:41 pm, Dotan Lior wrote:

> Hello,
>
> So far it works well, However when I inspect the NAT table with "iptables
> -L -t nat -v -n -x", the bytes counter shows extremely low values. I've
> transfer a 200Kb file via FTP on the windows client, but the counter was
> less than 100 bytes. It seems as if only the first packet of a connection
> is listed.

That is correct.   Only the first packet goes through the listed NAT rules - 
the others go directly via the connection tracking table and not through the 
rules (for efficiency).

> Is there a way to see the real bytes count? Also I would to know the number
> of bytes that traveled on both ways (from the client and to the client), is
> that also possible using iptables?

Yes, simply look at the filter table (ie the default one) instead of the NAT 
table.

*All* packets pass through your filtering rules (that's why you need the 
rules for ESTABLISHED and RELATED packets), so just use

iptables -L -n -v -x without the -t nat option.

Remember you can create rules without targets if you want to see the 
packet/byte counters for them without doing anything else:

eg iptables -A FORWARD -i eth0
iptables -A FORWARD -i eth1

 

Antony.

