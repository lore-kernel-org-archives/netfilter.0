From: Alistair Tonner <Alistair@alistairt.2y.net>
Subject: iptables-1.2.6a patch-o-matic patches to userspace iptables code.
Date: Tue, 11 Jun 2002 11:36:30 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611113630.A5302@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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



	Hi folks:

	I suspect this should be directed to a specific developer, but 
I felt that it should
	be tossed out there for general review.
	I've just been playing with 1.2.6a and kernel 2.4.18 and have 
been applying and poking at
	different patches ..
	I've got this box with quite a few partitions mounted for 
different elements of the
	filesystem tree .. and since it will be a firewall, I've got 
most of the basics set
	to be dismounted unless needed.  Thus, usr/src/ is a separate 
partition, as is /tmp and
	/var/log, etc etc etc... basic minimums will be in place in 
production.
	When I went to apply ipt_REJECT_fake_source, runme newnat died 
a nasty horrible ugly death
	complaining of illegal cross device links. It appeared that it 
tried to hard link from
	/usr/src/iptables-1.2.6a to /tmp ... not sure if it was the 
code or something I did, but
	thought that someone might want to look into it for future 
reference.  		 
	I am still pottering on this box (no intention of making it 
production until I'm happy
	with the results ....) so if I can test things for someone, I 
can be emailed at
	Alistair@alistairt.2y.net or Atonner@hotpop.com... Please note 
that I am in process of
	switching DSL providers over the next two days... so may be 
preoccupied with modems and
	whatnot.


	Alistair Tonner
	 

