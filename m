From: Daniel Rycaj <daniel.rycaj@fuchs.pl>
Subject: splitting one network physically using linux box.
Date: Tue, 7 May 2002 11:07:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020507110703.2ef33390.daniel.rycaj@fuchs.pl>
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

hi,

I have a *very* standard situation:

network: 10.1.1.97/27

	   small router			10 PCs
	---[ 10.1.1.97 / 27 ] --------- [ 10.1.1.98-108 ]

Now I want to create a firewall between the "small router" and "10 PCs".
The only problem is: nobody should change configuration of PC. 
So the default gw still should be set to 10.1.1.97 on each PC.

I did such configuration:

	
	--[ 10.1.1.97 / 27 ] ----- eth0 [ linux box ] eth1 ------ [ 10.1.1.98-108 ]

eth1 must have assigned IP: 10.1.1.97 because I don`t want to change configuration of PCs.
eth0 can be set to one of unused addresses from 10.1.1.96 network (in my example 10.1.1.110)

I have to set up the default gw for my linux box to 10.1.1.97.
How to tell linux that he has to route packet through the external 10.1.1.97 rather the local one ? :)

I tried to do it by several ways:

1) ip ro add 10.1.1.97/32 dev eth0	- doesn`t work because 10.1.1.97 exists in table local

2) ip ro del 10.1.1.97/32 table local	- works fine for 1-2 minutes. After this short time
the local table contains .97 again !

Any ideas how to solve this ?

regards,
Daniel Rycaj

