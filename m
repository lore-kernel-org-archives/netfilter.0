From: "raman mittal" <rmittal_02@iiita.ac.in>
Subject: Problems regarding IPtables
Date: Thu, 8 Apr 2004 13:36:36 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <53720.172.31.1.1.1081411596.squirrel@mail.local>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



I am student graduating in Indian Institute of Technology, India.
I have a small  problem regarding IP tables.I am capturing DNS reply
packets (which are later to be forwarded to a client)at the firewall and
QUEUEing them using IPQ library for altering the DNS answer section in the
user space using the forward chain of filter table.
i have changed the answer section of the dns reply, which results in
change of checksum fields in IP and UDP header.I have also corrected the
checksum of both the headers but the problem is that after doing
this,reverse SNAT takes place automatically (because Of DNAT done
earlier)which again changes the checksum and the packets get dropped at
the client side.How should i approach so that the packet goes out of the
firewall with correct checksum field in it's IP and UDP headers.
Do i have to change the table in which i am capturing the DNS replies and
transferring  them to the user space.
should i QUEUE the packets from the forward chain of mangle table.
Can't the checksum fields(IP and UDP headers ) of the modified DNS packets
be computed by the kernel.
What should i do.

Thanking You

regards
raman mittal
Indian Institute of Information Technology


