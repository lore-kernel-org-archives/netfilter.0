From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: IPTables State Tracking
Date: Fri, 29 Aug 2003 20:41:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DKEDJAAMDCDBHFKPBEMPCEPBCHAA.markee@bandwidthco.com>
References: <0C7C6E1720E8D74FB52EBEF93649730A0116BF07@2k099exm01.compucom.local>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0C7C6E1720E8D74FB52EBEF93649730A0116BF07@2k099exm01.compucom.local>
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
To: Josh.Berry@compucom.com, netfilter@lists.netfilter.org

Yes . . . the following is excerpted from the IPTables Tutorial:

"All of the connection tracking is done by special framework within the
kernel called conntrack. Most of the time, we need and want more specific
connection tracking than the default conntrack engine can maintain. Because
of this, there are also more specific parts of conntrack that handles the
TCP, UDP or ICMP protocols among others. These modules grabs specific,
unique, information from the packets, so that they may keep track of each
stream of data. The information that conntrack gathers is then used to tell
conntrack in which state the stream is currently in. For example, UDP
streams are, generally, uniquely identified by their destination IP address,
source IP address, destination port and source port."


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of
Josh.Berry@compucom.com
Sent: Friday, August 29, 2003 7:39 AM
To: netfilter@lists.netfilter.org
Subject: IPTables State Tracking


Does IPTables track virtual state of ICMP and UDP packets?  I know that
UDP and ICMP are not stateful connections, but does IPTables perform
pseudo-stateful tracking of these connections such as some other
firewalls that basically timeout UDP/ICMP connections after a specific
time?

Thanks,
Josh Berry
Information Security Group
972-856-5402




