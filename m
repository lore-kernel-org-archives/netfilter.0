From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Please ... how can i log all packets dropped ?
Date: Sat, 19 Jul 2003 18:05:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030719220531.GA3868@cannon.eng.us.uu.net>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAyh7iEzTuckqggWRQr9qR0AEAAAAA@sicredi.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAAyh7iEzTuckqggWRQr9qR0AEAAAAA@sicredi.com.br>
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
Content-Transfer-Encoding: 7bit
To: Juliano Murlick <jmurlick@sicredi.com.br>
Cc: netfilter@lists.netfilter.org

On Sat, Jul 19, 2003 at 02:38:01PM -0300, Juliano Murlick wrote:

> Hello ALL,
> I need log all packet dropped on my firewall, how can i get it ? I know how
> log all that i accept, like this:

If I understand your question correctly:
If you want to log the dropped packets only then you must allow the ones
you want in the beginning of your rule set and the very last rule (right
before the default DROP policy) must be LOG.

Ramin

>  
> iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
> --sport 22 -j LOG
> iptables -A FORWARD -p tcp -s $REDELOCAL --sport 1024:65535 -d $SSHSRV
> --sport 22 -j ACCEPT
>  
> i will LOG all packet from ssh connection, but i don't  to log all packet
> dropped, my default policy is DROP:
>  
> iptables -P FORWARD DROP
>  
> please, if anyone knows it ? tell me ....
>  
>  
> Thanks in advance!
> 
> Att,
> Juliano Murlick
> 
> 
>  
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.500 / Virus Database: 298 - Release Date: 10/7/2003
>  

