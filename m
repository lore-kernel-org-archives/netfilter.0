From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: deleting specific rule ...
Date: Fri, 11 Jun 2004 18:15:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406111815.35432.Alistair@nerdnet.ca>
References: <20040611160047.73593.qmail@web50210.mail.yahoo.com> <001001c44ff0$8ec113a0$0300000a@serverxx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c44ff0$8ec113a0$0300000a@serverxx>
Content-Disposition: inline
Content-Description: 
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

On June 11, 2004 04:13 pm, Syed Faisal Gillani wrote:
> here is the list of rule in my iptables
>
> ---------------------------------------------------------------------------
>-----
>
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere           MAC
> 00:A0:C9:A0:B8:A5 DROP       all  --  anywhere             anywhere        
>   MAC 00:10:A4:9F:B5:27 DROP       all  --  anywhere             anywhere  
>         MAC 00:C0:26:78:04:D2
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
>
>
> ---------------------------------------------------------------------------
>-----
>
> now i want to delete this rule ..
>
> DROP       all  --  anywhere             anywhere           MAC
> 00:A0:C9:A0:B8:A5
>
> wat will be the command in doing so ?
>

	Hi -- relist the rules 

	iptables -L -n --line-numbers

	will number each line.

	iptables -D INPUT x
	
	
	Alistair Tonner

> thanks
> Faisal

