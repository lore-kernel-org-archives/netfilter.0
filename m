From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Output Chain Problem... (nfcan: addressed to exclusive sender for this address)
Date: Fri, 18 Jun 2004 11:49:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040618154948.GC1243@salty>
References: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca> <200406181402.51862.Antony@Soft-Solutions.co.uk> <009b01c45538$1ab69780$800101df@lvl.digidyne.ca> <200406181549.50911.Antony@Soft-Solutions.co.uk>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406181549.50911.Antony@Soft-Solutions.co.uk> (from +nfcan+jimlaur+0fd5a9955d.Antony#Soft-Solutions.co.uk@spamgourmet.com on Fri, Jun 18, 2004 at 10:49:50 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.06.18 10:49, Antony Stone  - Antony@Soft-Solutions. 
co.uk wrote:
....

> 
> Yes, I understand your point, and no, you're not wrong  
> (at least, not wrong
> to be puzzled by what's going on, anyway).   I similarly  
> cannot understand
> why
> you have 19 packets hitting the default policy, which do
> not get logged by a LOG rule put at the end of the chain.
> 
> Can anyone else here see something we're both obviously
> missing?
>

One thing I notice in the log line is that the log level
is set to 4. Is it possible that his syslogd or klogd  
logging rules do not log messages of that high a level?

>        0        0 LOG        all  --  *      *        
> 0.0.0.0/0
> 0.0.0.0/0          LOG flags 0 level 4 prefix `Output:'

Jim


