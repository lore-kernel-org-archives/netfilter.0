From: "Michael Lawford" <mike@plenty.co.za>
Subject: Iptables and RaQ550 problems....
Date: Tue, 18 Feb 2003 18:42:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HAEDIOFCFBKACBFKGGJEEEJKCIAA.mike@plenty.co.za>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi There,

I have a RaQ550 server that runs iptables.  The other day i logged in and
got 1000+ of the following message from my server.

This alert notification is to inform you of network activity occurring on
your host.

           Timestamp:  Tue 18 Feb 2003 12:05:54 PM SAST
          Alert Type:  Port Scan Detected
           Interface:  eth0
            Protocol:  3/3/icmp
 Packet Size (bytes):  99

      Source Address:  (my IP here)
         Source port:
           Direction:  outbound
 Destination Address:  196.7.0.138 (UUNet's main DNS server)
    Destination Port:

           Log Entry:  eth0:portscan: 3/3/icmp (my IP here) -> 196.7.0.138
99 (22)


And I keep getting these little error messages every 2 or 3 minutes...  Now
my network and UUNet guys tell me that it is IPTables that is trying to
resolve to their main DNS server.  They have checked the settings and all
appears to be well so they think that it is a bug.  If their is a fix /
patch please let me know about it.  I am tearing my hair out trying to fix
it.  Any advice would be appreciated.

I look forward to hearing from you.

Regards,

Michael


