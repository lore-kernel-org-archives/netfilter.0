From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iprange
Date: Tue, 11 Nov 2003 16:54:30 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311111654.30916.Alistair@nerdnet.ca>
References: <Pine.LNX.4.33.0311110937110.24817-100000@blackhole.kfki.hu> <Pine.LNX.4.58.0311111558160.8003@fhynpb.envafyvqr.arg>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0311111558160.8003@fhynpb.envafyvqr.arg>
Content-Disposition: inline
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
To: Vigil <nvnwdfuq02@sneakemail.com>, Netfilter Mailing List <netfilter@lists.netfilter.org>

On November 11, 2003 11:01 am, Vigil wrote:
> Oh, ngh. Excuse me, I read it being built into iptables as I wouldn't have
> to build it into the kernel. As I say, ngh.
>
> On Tue, 11 Nov 2003, Jozsef Kadlecsik kadlec-at-blackhole.kfki.hu |Netfilter 
Mailing List| wrote:
> >I still suspect you have got two iptables binaries on your system and you
> > start the previous one instead what you installed from source.


	Vigil the problem likely is that you have an OLD rpm installation at /usr/
 	and the new built iptables at /usr/local/ 

	This usually causes the sort of problem you are experiencing......
	
	try :
	
	find /usr -name iptables

	if you get more than one result you have this problem.... 
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

