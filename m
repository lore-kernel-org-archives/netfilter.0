From: leolistas@solucoesip.net
Subject: Re: Problems with LOGS in iptables (Help Please)
Date: Fri, 25 Jul 2003 17:33:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059165222.3f219426e5e1f@www.solucoesip.net>
References: <OFF4AC81DF.42A2B9F1-ONC1256D6C.00400FCC@carm.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFF4AC81DF.42A2B9F1-ONC1256D6C.00400FCC@carm.es>
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
To: Francisco Garcia Guillen <Paco.Garcia@carm.es>
Cc: netfilter@lists.netfilter.org



   Try to take off the spaces from your log-prefix string. I've had 
problems with this. Try replacing:

--log-prefix "RULE 0 --ACCEPT "
by
--log-prefix "RULE0_ACCEPT" 

   It should work.


   Sincerily,
   Leonardo Rodrigues

Citando Francisco Garcia Guillen <Paco.Garcia@carm.es>:

> Hi all,
> 
> The rules of iptables work fine but I can't obtain log messages from
> iptables.
> 
> With fwbuilder I mark all rules with LOG option.
> 
> The generated script has this flag: "-j LOG --log-level 6 --log-prefix
> "RULE 0 --ACCEPT " --log-tcp-sequence --log-tcp-options
> --log-ip-options"
> with each rule
> The klogd is running
> The syslogd is running
> The syslog.conf is correctly configured
>  ... but the logs not appear in /var/log/messages file



