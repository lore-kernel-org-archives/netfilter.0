From: "M. A. Imam" <maimam@wichita.edu>
Subject: sending packet in round robin...
Date: Sat, 12 Mar 2005 12:38:42 -0600
Message-ID: <4232A052@webmail.wichita.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello list,

Can anyone tell me if i can route packets from two interfaces in Round Robin 
fashion.

here is the scenario. i have two linux machines with two ethernet cards each. 
i do an ftp from machine1(client) to request a file from machine2(server). i 
can do this on either links separately. what i want is to that machine2 when 
sends an ftp packet, it send it in around robin fashion. that is it sends one 
packet from one interface and the second packet from the second interface.How 
can i achieve this.

Can i use two default routes... or may some kind of iptables...

appreciate an early response

Muhammad A Imam


