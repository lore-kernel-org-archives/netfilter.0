From: srg <srgqwerty@telefonica.net>
Subject: copying conntrack state tables between two machines
Date: Mon, 07 Feb 2005 21:32:50 +0100
Message-ID: <4207D072.6040600@telefonica.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello:

I am thinking about writing a small program in order to "copy" the 
connections table from one machine to another machine.
The final purpose is configure the second machine as a "backup" machine 
with linux-ha and if the primary fails then the backup will assume the 
traffic WITHOUT LOOSING CONNECTIONS (the purpose is that from the point 
of view of the clients and servers before/after the linux machines do 
NOT need to reestablish the connections they have established before the 
failure).

What do you think that is the best way to do this?

In the other hand... It is possible to do the same with IKE SA & IPSEC 
SA (using pluto + kernel 2.6 built in ipsec) ?

Thanks and best regards

