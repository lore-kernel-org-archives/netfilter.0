From: Esteban <esteban@alstec.fr>
Subject: Nat problem with GRE
Date: Tue, 3 Jun 2003 13:35:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030603133523.132155b9.esteban@alstec.fr>
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

Hi there,

I have some troubles to NAT GRE traffic.
On my LAN, some users have to connect to an external PPTP server.
The connection success for the first user who connect the PPTP server.
But it fails for the others, when there is already a user connected to
the server.
I looked with tcpdump, and it seem that the GRE traffic of the second
client is droped (TCP 1723 connection is OK)

Actualy, I accept all the traffic destinated to the PPTP server (so tcp
1723 and gre traffic may be accepted).  

Does anybody know what I am doing wrong ?

Thank you very much.


-- 
Esteban
esteban@epita.fr


