From: Alistair Tonner <Alistair@alistairt.ath.cx>
Subject: Re: INVALID packets.   K 2.4.19  IPT 1.2.7a, POM 20020825
Date: Thu, 5 Sep 2002 12:59:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020905165922.GA1031@Ajftl1.ajfthome.on.ca>
References: <20020829234210.GC16965@Ajftl1.ajfthome.on.ca> <20020830001959.GE16965@Ajftl1.ajfthome.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20020830001959.GE16965@Ajftl1.ajfthome.on.ca>; from Alistair@alistairt.ath.cx on Thu, Aug 29, 2002 at 20:19:59 -0400
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org



	Okay list/Josef
	 
	I sat down with a different box, and completely blew in a
	plain jane slackware install, and was able to get it upgraded
	to 2.4.19/iptables 1.2.7a.  I took a snapshot of the install
	of 1.2.7a and generated a file list ... and ran that list as a
	wide open find on the original box....


	*THUNK* THUNK THUNK (head bouncing off desk)
	 
	*always hunt down and remove all old libraries and header files*

	I apologise to everyone ... I missed the original install of 
iptables in
	/usr/lib/iptables. ... which apparently had a few header files 
in there
	too... *sigh* ...
	 
	After blowing all that away, everything builds fine and 
installs fine.

On 2002.08.29 20:19 Alistair Tonner wrote:
> 
>   		I'm curious about this thread -> Help me understand  
> SNAT?
>   	Just out of curiosity ... I zipped through my logs.
>  	Imagine my surprise ... I have a mitful of these packets,

<<<<<Snipped for brevity>>>>>>>>>>>
>  	 	I'm running Slackware (Started as 7.1) and several  
> dozen upgrades .. .modutils, binutils,
>  	gcc 2.95.3 and several other things ..
>   	Anyone have any comments/ideas?
>   	Further .. why can't I compile iptables (userspace  code) once  
> I've patched the kernel
>  	source tree from POM?  This strikes me as very odd.
>   	If anyone has ideas for me to chase, I'm more than willing to  
> help out here ... I've just
>  	hit the limit of my experience and knowledge in the field.
>   	Alistair Tonner	 	 	 	 


