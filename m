From: <elesouef@nerim.net>
Subject: forwarding between lan and dmz
Date: Wed, 5 Mar 2003 17:17:05 CET
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305161704.273DA40F91@kraid.nerim.net>
Reply-To: <elesouef@nerim.net>
Content-Transfer-Encoding: 8bit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,

Here's a sample schema of what I want to build :



LAN (192.168.1.0) 
/
Firewall (debian linux) -> internet
\
DMZ (192.168.2.0)

I want to allow local users to browse our webservers  and ftp servers located on the DMZ.

In order to do this, I built a routing table that makes ping from 192.168.1.x to 192.168.2.x possible.

But I don't know what to allow on my firewall to make traffic on ports 80, ftp and ftp-data possible.

Ping is possible so I suppose that this is the furewall that blocks my connections.

Any help would be appreciated.

manu

___________________________________
Webmail Nerim, http://www.nerim.net/



