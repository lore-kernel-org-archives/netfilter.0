From: "Jack Baker" <jbaker@neustyle.com>
Subject: ip address routing setup
Date: Tue, 4 Jun 2002 19:32:11 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <002101c20c20$0cfbcab0$1e00a8c0@neox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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

Hi there, I currently have a set of global ip addresses from my isp (/29
block) lets say 192.168.0.5/29 for example.

My gateway set currently on my set of ip addresses is 192.168.0.5

I recently got another block (/29) ip addresses say on 192.168.1.64/29.

One of my original ip addresses the isp has set for routing the new
block. Lets say 192.168.0.7. Network ip would be 192.168.1.64, and
broadcast ip at 192.168.1.71.

Now since they have different subnets, anyone know how I get one to
route to another. Do I need a get a hardware router or is there a way to
do it on redhat 7.2/7.3? 

I'm not sure what they've done up to get this to work.

Thanks,
Jack.
jbaker@neustyle.com



