From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: Mangle
Date: 19 Jul 2004 18:24:12 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090241651.3769.3.camel@joel.d2visp.com>
References: <a05ad8750407190342530d09c2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a05ad8750407190342530d09c2@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Post yur iptables ruleset...
and y using mangle instead of nat 
anything special ????

Regards,
Joel n.solanki
Systems Administrator
D2V ISP PVT LTD

On Mon, 2004-07-19 at 16:12, Murugavel Thiruvengadam wrote:
> we have few clients connected in LInux  firewall
> 
>          switch ---- firewall--------internet
>            |          |              |
> 200pcs |       pvtip           pubip
> 
>  all  --  *      *       0.0.0.0/0            0.0.0.0/0          
> SMANG --to-ip  <PUBLIC IP>
> 
> -A FORDNS -j SMANG --to-ip PUBLIC Ip
> 
> while sending a request to DNS we are using (mangle.) client's source 
> port  . the same port we are using to send a request to dns. while
> coming back.  assume that 3 person used the same port. DNS return
> traffice not going to respective client. can anyone please advise.
> 
> it was working fine with nat. we are right now using mangle
> 
> Regards
> TM
> 



