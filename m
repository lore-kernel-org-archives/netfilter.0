From: Olivier <olivierk@club-internet.fr>
Subject: Re: --match recent
Date: Mon, 11 Jun 2007 20:51:48 +0200
Message-ID: <20070611185148.GB12937@vvma.net>
References: <mnet1.1181553816.24811.olivierk@club-internet.fr>
	<466D5578.8070905@riverviewtech.net>
	<20070611181213.GA12937@vvma.net>
	<466D9445.5080101@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <466D9445.5080101@riverviewtech.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Heelo Grant,

> What is your FORWARD chain's default policy?

That would be DROP:

   Chain FORWARD (policy DROP)

> What does netstat have to say about the connection(s)?

On the targeted ssh server (behind the firewall), while being outside
ssh'ing in, nothing gets there:

   tcp6       0      0 *:ssh                   *:*                     LISTEN     root       5858       2462/sshd           
   tcp6       0      0 placard:ssh             ::ffff:192.168.1.1:3280 ESTABLISHEDroot       82534      13605/sshd: olivier 

Of course, if I disable those 2 new rules, everything's fine, just
like it has always been: I sure can connect from the outiside, Port
forwarding and all is up and running.

   tcp6       0      0 *:ssh                   *:*                     LISTEN     root       5858       2462/sshd           
   tcp6       0      0 placard:ssh             -----outside-----:32923 ESTABLISHEDroot       96601      16381/sshd: olivier 
   tcp6       0      0 placard:ssh             ::ffff:192.168.1.1:3280 ESTABLISHEDroot       82534      13605/sshd: olivier 

Thanks for your time,

-- 
Olivier K

