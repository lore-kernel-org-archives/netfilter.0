From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT does not work
Date: Thu, 6 Jun 2002 15:55:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206061455.g56EttA31457@vulcan.rissington.net>
References: <3CFF6327.5020306@globit.com> <200206061357.g56DvOA31162@vulcan.rissington.net> <3CFF7596.4090300@globit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFF7596.4090300@globit.com>
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
To: netfilter@lists.samba.org

On Thursday 06 June 2002 3:45 pm, Uwe Eisner wrote:

> >Surely that means that your address translation *is* working ?
>
> But why is the external ip-address from the firewall showen at the www?
> I specifyed the IP-address 141.12.218.99 not 141.12.129.9 (ext.
> Router-IP-Address)

Sorry - I did not realise from your original email that 141.12.218.99 was not 
the external address of your firewall.

> > I do not understand what you mean by this.   Surely you do not mean that
> > if you remove the POSTROUTING rule, you can still connect to a remote web
> > server and have a Perl script tell you your source address ???
>
> Yes, that is it! I removed every POSTROUTING rule, but I could still
> connect to the web.

In that case you must have Network Address Translation in operation on your 
external router ?   If not, then there is no way that:

a) privately-addressed machines 10.x.y.z, 172.16.s.t, 192.168.a.b could 
contact external servers

b) your router address would show up on an external machine.

> Afterwards I typed the flash command 'iptables -F'. Now ALL rules should
> be removed, souldn't it?

No.   Not unless you also typed
iptables -F -t nat

"iptables -F" on its own will *only* clear the filtering table, not the nat 
table or the mangle table.

Try iptables -L -t nat to see what rules you really have in place.

> I started my configuration script with the new rule (see above), but
> nothing has changed.
>
> First I tought, that iptables -F does not delete the POSTROUTING rules,

Correct :-)


Antony.

