From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Transparent Proxy server
Date: Wed, 5 Jun 2002 11:33:58 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605153358.GH29214@cannon.eng.us.uu.net>
References: <3A5DC36EC1506C40825C05BE65E62AEF0E79EB@neptuno.idea.com.mx>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3A5DC36EC1506C40825C05BE65E62AEF0E79EB@neptuno.idea.com.mx>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Omar Castaneda Acosta <omar@idea.com.mx>
Cc: Eugene Joubert <eugenej@centratel.co.za>, netfilter@lists.samba.org

On Wed, Jun 05, 2002 at 09:25:23AM -0600, Omar Castaneda Acosta wrote:

> The Transparent Proxy HOW-TO explains the setup properly
>  
> http://www.tldp.org/HOWTO/mini/TransparentProxy.html
>  
> the only rule you need is a REDIRECT and access from the local interface
> to the outside world on port 80.

And, as opposed to what Eugene had said "with proxy setting enabled
on my browser", do not enable the proxy setting on your browser,
otherwise it cannot be called _transparent_ proxy ;-)

Ramin

>  
> -----Original Message-----
> From: Eugene Joubert [mailto:eugenej@centratel.co.za]
> Sent: Wednesday, June 05, 2002 7:26 AM
> To: 'netfilter@lists.samba.org'
> Subject: Transparent Proxy server
>  
> Hi, 
> I have the following scenario: My default policy for INPUT and FORWARD
> is drop. My default policy for OUTPUT is ACCEPT. 
> I am using transparent proxy server in my firewall rules. 
> When I try and access the Internet with proxy setting enabled on my
> browser I can't get anywhere. When I make the default policy for INPUT
> ACCEPT my proxy server settings work....
> If I disable my proxy server on my browser, add the necessary rule in my
> FORWARD chain I can access the Internet just fine...
> My question is this, do you need to allow anything in the INPUT chain if
> your default policy is DROP for squid to work? 
> Thanks in advance.... 
> PS : If you need any other info please let me know 
>  

