From: Faruk Grozdanic <faruk@frontierdev.com>
Subject: Blocking broadcasts
Date: Wed, 10 Jul 2002 13:36:04 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D2C8CA4.2040607@frontierdev.com>
Reply-To: faruk@frontierdev.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,

I am trying to block broadcast IP traffic, that is IP traffic that has 
255.255.255.255 in the destination feild. I pushed a rule:

iptables -I FORWARD -i eth4 -d 255.255.255.255 -j DROP

and it did not filter these out.

Am I doing something wrong here, or is there a different way of 
accomplishing this.

Thanks

Faruk


