From: <netfilter@sbgit.com>
Subject: How to build an good and secure firewall script?
Date: 16 Mar 2004 12:52:20 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.0000011900002AC1@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi there,
after i postet some script idears (these are not my scripts) i want to
create my own and custom script for iptables.

So how to build my own and custom script?

I need the fallowing capatibilities:
VPN Redidirection to my Internal VPN Server (PPTP)
EDONKEY Redirection to my own Workstation
SMTP Accept on the Firewall Server
HTTP Redirection to my internal HTTP Server
Active FTP Transfer for internal Clients 
Ping from internal to outside nets but not from extern to intern

Maybe there exiting some tamplates where i can insert my custom rules?
And maybe there existing some rule tamplates, for vpn ... ?

I have installed the newest iptables version!

My Network Design looks like this:

internet <-> router <-> firewall <-> lokal net (192.168.1.0)
            |      |    |       |
         dyn IP    |    |       |
               10.0.0.1 |       |
                        |       |
                     10.0.0.2   |
                       (eth0)   |
                                |
                          192.168.1.221
                               (eth1)

Sorry, but i'm realy confused in building fw script, i tried some 
script from the internet, but all having errors in the syntax.

Thanx for any help and good idears.
Peter


