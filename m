From: tonton19 <tonton19@voila.fr>
Subject: Re: Re: ROUTE + SNAT Problem
Date: Thu,  5 Feb 2004 11:12:40 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16887300.1075975960758.JavaMail.www@wwinf4006>
Reply-To: tonton19@voila.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: blancher@cartel-securite.fr, netfilter@lists.netfilter.org

> As far as I can remember, use of ROUTE target stops NF_IP_POST_ROUTING
> crossing to send packet directly. For mangle table is prior to nat one,
> then SNAT rules are not evaluated.
> You should have a look to very last patch-o-matic (maybe still CVS)
> where ROUTE target include a special option for continue hook traversal.
> See :
> 
> http://cvs.netfilter.org/netfilter/patch-o-matic/extra/ROUTE.patch
> 
> 	"Updated version with new option to continue rule-traversal
> 	 (Cedric de Launois)"
> 
> 

I made a little test and I think you're right : it seems to be ok with --continue option in the ROUTE target :
# iptables -t mangle -A POSTROUTING -d 173.20.0.210 -p tcp --dport 80 -j ROUTE --oif eth0 --continue
Merci beaucoup de ton aide !
gwen
------------------------------------------

Faites un voeu et puis Voila ! www.voila.fr 



