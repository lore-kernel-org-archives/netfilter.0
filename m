From: "Shubho Biswas" <shubhobiswas@hotmail.com>
Subject: Re: iptables masquerading
Date: Wed, 14 Apr 2004 13:04:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F89IlxnZnvjgDL00039ee6@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I've rebuilt iptables as a static binary and this seems to work for me.  I 
guess I must have screwed up something in the linking in the dynamic 
version.

In the static version, the library files get installed too and the doc seems 
to say that they're required for some reason.  So I get bigger /sbin files 
and all the library files.  Maybe I can safely get rid of the 
usr/lib/iptables files?

Shubho

----------------------------------------------------------
Hi there,

I've cross-compiled iptables for my x86 (486) embedded device and installed
it successfully.  I did NOT use the static binary option so I have all the
iptables lib installed too.  I'm using linux kernel 2.4.25 with no patches
and almost all netfilter options enabled (iptables support is enabled) .
When on my embedded device I do:

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

I get this error:

iptables v1.2.9: Couldn't load target `MASQUERADE':File not found
Try `iptables -h' or 'iptables --help' for more information.

So I tried:
# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.1.160

and got:
iptables v1.2.9: Unknown arg `--to'
Try `iptables -h' or 'iptables --help' for more information.

Did I miss something when installing?

Shubho

_________________________________________________________________
http://join.msn.com/?pgmarket=en-ca&page=byoa/prem&xAPID=1994&DI=1034&SU=http://hotmail.com/enca&HL=Market_MSNIS_Taglines


