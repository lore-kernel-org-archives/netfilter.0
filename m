From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: IPTables articles links
Date: Fri, 1 Aug 2003 12:56:59 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDKEDBNFAA.georgev@citadelcomputer.com.au>
References: <3F29BBA1.4030405@davidcoulson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F29BBA1.4030405@davidcoulson.net>
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
To: David Coulson <david@davidcoulson.net>, webmaster@netfilter.org, netfilter@lists.netfilter.org

Great going David, I know what you mean by spelling.. my last name is spelt
in many ways even I couldn't pronounced the way they've spelt it in the
past..

One note about you March article which has an error in it..

<snip>
iptables -I INPUT 3 -s 10.0.0.0/8 -j ACCEPT
This would insert the rule into the third 'slot' of the chain. Of
course, if there is currently only one rule in the chain, it would
just be tacked on the end.
to the floor, as if our system was not even there. This type of
packet blocking is known as 'stealth' firewalling, as it the
firewall does not respond to the client when it blocks a
www.iptables.org/ contains all
the information on installing
the user space utilities
required to properly configure
</snip>

This is incorrect, at least in 1.2.7a from what I've tested.. if the max
ndex is lower than the insert, it'll error as below.


iptables -I MRTG 1000 -s 192.168.1.111
iptables: Index of insertion too big

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of David Coulson
Sent: Friday, August 01, 2003 11:00 AM
To: webmaster@netfilter.org; netfilter@lists.netfilter.org
Subject: IPTables articles links


http://www.iptables.org/documentation/index.html

# Part 1 of an introductory iptables tutorial by David Culson
# Part 2 of an introductory iptables tutorial by David Culson

Please do the following:

1) Spell my name correctly - It's right above the two which were spelled
wrong.
2) Link directly to my PDFs, so that the copyright information is easily
accessable for those who need to know about it.

I e-mailed webmaster@netfilter.org eariler this week, but had no response.

David

--
David Coulson                                    email: d@vidcoulson.com
Linux Developer /                          web: http://davidcoulson.net/
Network Engineer                                   phone: (216) 533-6967




