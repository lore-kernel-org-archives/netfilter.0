From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IP Spoofing
Date: Wed, 5 Nov 2003 20:39:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311052039.hA5KdYr13351@agate.rockstone.co.uk>
References: <60197.200.180.160.84.1068060676.squirrel@www.alcidesmaya.com.br> <200311051951.hA5Jpdr13332@agate.rockstone.co.uk> <60250.200.180.160.130.1068063541.squirrel@www.alcidesmaya.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <60250.200.180.160.130.1068063541.squirrel@www.alcidesmaya.com.br>
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
To: Lista de Mail netfilter <netfilter@lists.netfilter.org>

On Wednesday 05 November 2003 8:19 pm, Leandro Takashi Hirano wrote:

> Thanks Antony...
>
> Do you have a script or something where I can find protection rules?

You tell us what protection you want and we can suggest some rules to do it.

There's no single "magic ruleset" for netfilter / iptables which "protects 
your network", otherwise every distribution would include it as standard.

It depends what you want to do.

A good starting point is:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $intIF -o $extIF -j ACCEPT

That will allow nothing in or out of the firewall machine itself, and will 
allow all access from your internal network to the Internet, blocking 
everything except reply packets from the Internet to your network.

I do not recommend that you simply implement the above rules before you 
understand what they are designed to do.

Check Oskar Andreasson's excellent tutorial for more information about this 
sort of configuration, or any of the other documentation at 
http://www.netfilter.org

Antony.

-- 

What I don't know far exceeds what I know, but unfortunately, it is far 
easier to write about what I know than about what I don't know.

 - Kevin Kelly, Out of Control
                                                     Please reply to the list;
                                                           please don't CC me.

