From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables problem when booting up
Date: Thu, 13 Jun 2002 17:39:29 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206131639.RAA08432@slate.rockstone.co.uk>
References: <NFBBLDGPFEDEINHFAMPBIEONDDAA.juliog@patagoniaweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <NFBBLDGPFEDEINHFAMPBIEONDDAA.juliog@patagoniaweb.com>
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

On Thursday 16 May 2002 12:26 am, Julio Gruskin - PWeb ONline! wrote:

> I built the iptables ruleset (/etc/sysconfig/iptables) in my RH7.2. It
> seems to work okay when booting my system as it shows when 'iptables -L -n'
> but some rules are not okay, I can't connect to the internet from my
> internal network even though the rule '-A INPUT -s
> 192.168.1.0/255.255.255.0 -i eth0 -j ACCEPT' is placed. The weird thing is
> that when I run 'service iptables restart' it restarts the firewall rules
> and the problem is fixed.

I don't know what your ruleset is, but the fact that you mention the INPUT 
chain above in the same phrase as "can't connect to the Internet from my 
internal network" makes me worder whether you realise that INPUT is *only* 
for packets addressed *to* the firewall - FORWARD is for packets going from 
something on one side to somethin on the other side.....?

 

Antony.

