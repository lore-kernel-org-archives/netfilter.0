From: "Nathan Littlepage" <nathan@iwantka.com>
Subject: RE: Proof Read
Date: Fri, 16 Apr 2004 12:12:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00fe01c423d6$20417230$6c45a8c0@ntbrt.bigrivertelephone.com>
References: <002701c423d4$7df36ac0$1400a8c0@DAVIDVAIO>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002701c423d4$7df36ac0$1400a8c0@DAVIDVAIO>
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
To: netfilter@lists.netfilter.org

Yes, I'm bringing up the interfaces prior to running the scripts. If you
haven't noticed this is a bridged firewall application. Using brctl I
bring up the bridge interface then add the ethernet interfaces to it.
Thinking that the interfaces needed more time to get active. I at one
time put a sleep in the rc.firewall script right after the modules where
loaded. Alas, same results.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> David Canni
> Sent: Friday, April 16, 2004 12:02 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Proof Read
> 
> 
> > Can anyone proof over the following rc.firewall script and 
> throw some
> > light as to why I get an 'Invalid Argument' on the two -m 
> physdev upon
> > bootup. Yet, once the system is active the modules are 
> loaded and I can
> > execute the script and, aside from the error that the modules are
> > already loaded, it will not error out on the -m physdev statements.
> 
> I assume you have already checked this but are you sure the 
> interfaces have
> been configured and brought up by the point the script is 
> run?  If you're
> running it in rcX.d, make sure the iptables script comes 
> after the one that
> configures network interfaces.
> 
> David
> 
> 


