From: Mike Ely <netfilter-listalias@phoenix.k12.or.us>
Subject: Nmap shows all ports open when -m psd -j TARPIT
Date: Wed, 16 Apr 2003 16:19:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CE0D4A64-7061-11D7-A99D-00039354EBD6@phoenix.k12.or.us>
Mime-Version: 1.0 (Apple Message framework v552)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

This is with kernelversion 2.4.18-27.7.x (redhat updated rpm sources 
with patches compiled in) and iptables 1.2.8.  I got the patches from 
patch-o-matic, and everything compiled smoothly.

When I do
iptables -I INPUT -m psd -j DROP
it works - the psd module handily shuts down portscan connections.  
Also, when I do
iptables -I INPUT -p tcp --dport 25 -j TARPIT
any incoming connection to port 25 gets totally gooey - much fun for me.

However, when I do
iptables -I INPUT -p tcp -m psd -j TARPIT
and then run
nmap -vv -P0 iptables.box
against the machine, it reports all but about twelve ports as open!  I 
know that the machine isn't running all those services, but this most 
certainly isn't the response I want.

Is this a logic error on my part, or a bug in the code, or what?

Specs:
Generic P II box
RedHat 7.2 with everything up2date and custom patched kernel listed 
above
nmap version 3.0

Thanks in advance,
Mike

PS: Posted the above to netfilter bugzilla, but it seems pretty quiet 
there.

---
[This E-mail scanned for viruses by Declude Virus]


