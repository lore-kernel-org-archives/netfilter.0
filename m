From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: Re: Getting Closer But Still Having Problems
Date: Tue, 3 Dec 2002 10:32:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212031032.50936.dharmu@nsecure.net>
References: <Pine.LNX.4.33.0211291153170.1440-100000@ts1.alberni.net>
Reply-To: dharmu@nsecure.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0211291153170.1440-100000@ts1.alberni.net>
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
To: Aaron Clausen <maureen-taocow@alberni.net>, netfilter@lists.netfilter.org

Hi,
 If you compiled the module into the kernel just check with 

#dmesg | grep module 

If you get the output then you should not worry about it.

Regards,
Dharmendra.T
Linux Security Expert
www.nsecure.net
dharmu@nsecure.net

On Saturday 30 November 2002 01:25, Aaron Clausen wrote:
> On Fri, 29 Nov 2002, Aaron Clausen wrote:
> > Alright, I managed to get the patched 2.4.19 kernel *and* iptables 1.2.7a
> > binaries and libraries to compile cleanly.  Now I've got one last problem
> > (I hope).  When I run "make install all", everything compiles fine, but
> > it won't overwrite the old iptables binaries and libraries.  I suppose I
> > have to remove these manually, so can somebody tell me where to look?
>
> Never mind.  I did it the hard way, and everything is working A-okay. 
> Sorry for being so belligerant, I was just getting frustrated with the
> whole darn thing.
>
> Now, another question.  Is there anything particular I have to do to get
> H.323 connection tracking working?  I've compiled the code into the kernel,
> so I don't need to load the modules, so is that it?
>
> Another quick question, will the H.323 tracking permit more than one
> machine to go through NAT with Netmeeting or whatever?

-- 


