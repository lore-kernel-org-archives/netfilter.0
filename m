From: Unknown <unknown@unknown.invalid>
Subject: Re: Problems with Transparent Proxy using IPTables, Squid and 2.6 kernel
Date: Sat, 10 Jan 2004 00:26:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <37726.7711716287$1073712562@news.gmane.org>
References: <F41C404D-4311-11D8-AFEE-000393677A36@porchlight.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <F41C404D-4311-11D8-AFEE-000393677A36@porchlight.ca>
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
To: Peter Schobel <pschobel@porchlight.ca>, netfilter@lists.netfilter.org

On January 9, 2004 09:08 pm, Peter Schobel wrote:
> ok, I removed the error line and the cat autoconf line from the
> config.h and got iptables 1.2.9 to compile against my kernel source and
> headers and reinstalled
>
> if i turn on ip_forward and try to access external sites, i get
> forwarded through to the external page without problem
>
> if i enable the iptables rule
>
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT
> --to-port 3128
>
> my pages just time out when i try to access external sites
>
> but if i try to access the proxyhost directly using http, it redirects
> me to the proxy site without problem
>
> i get exactly the same results using this rule
>
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT
> --to-destination $LOCALHOST:3128
>
> does anyone have any idea why traffic destined for external sites will
> not transparently redirect to squid for me?
>
> does anyone have any idea as to what further steps I can take to
> troubleshoot this problem?
>

	Have you tried LOGging the INPUT chain for both 80 and 3128?
	Or, perhaps more thorough, put a LOG rule in PREROUTING
	before the REDIRECT/DNAT rule to log what you will change,
	and since your destination is local, a LOG rule at the top of INPUT
	to catch *everything* for the interim? -- then see at what point 
	the packets are actually disappearing.
	
	I'm not sure I understand why this should be a problem... 
	FWIW -- when I rebuilt iptables (1.2.9) against kernel 2.6.0 my 
	/usr/include/linux contained the headers from a 2.4.19 kernel .. .and
	this is what my gcc was built against.  I believe that you need to have 
	the /usr/include/linux that existed when gcc was built in there ... but 
	someone who knows more about compilers than I might thump me on the
	skull for that ... I'm *NOT* 100% sure about the interdependencies... 


	Alistair Tonner ... 


	

