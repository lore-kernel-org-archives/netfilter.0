From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Newbie Question
Date: Mon, 24 Feb 2003 11:50:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003601c2dc24$c9d55550$3864a8c0@discmail.com>
References: <NGBBJEDAELGDCOJBKMHKEEAOCHAA.jcorbit@cox-internet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBJEDAELGDCOJBKMHKEEAOCHAA.jcorbit@cox-internet.com>
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
To: 'Jeffrey Corbit' <jcorbit@cox-internet.com>, netfilter@lists.netfilter.org

last time I installed PopTop, I had to install pptp support in netfilter
through the Patch-o-Matic (not sure it's still valid).  But I only
needed that to allow multiple outbound PPTP connections from inside a
NAT'd LAN (that is, I was NATing PPTP connections)

To simply connect to PoPToP, you need to make sure your rules are
correct in netfilter for allowing the protocol 47, port 1723, etc. to be
forwarded. Remember if you're running poptop on a netfilter server, the
INPUT and OUTPUT chains are important as is the FORWARD chain (all in
the Filter table)



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Jeffrey Corbit
> Sent: Monday, February 24, 2003 11:23 AM
> To: netfilter@lists.netfilter.org
> Subject: Newbie Question
> 
> 
> I'm running POPTOP on a linux 2.4.18 kernel.  Have been 
> having some connection problems and questions to the poptop 
> mailing list have suggested that I need to install the 
> Netfilter Helper PPTP files.  I have successfully downloaded 
> these files to my linux server and they now reside in 
> /root/netfilter-extensions... folder.  My question is what do 
> I do with them now.  I can't find any documentation a to how 
> to apply these files to my current configuration.
> 
> Thanks for any help you can give!
> 
> Jeff
> 
> 


