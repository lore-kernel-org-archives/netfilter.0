From: netfilter@tommi.org
Subject: Re: NAT+smtp+pop3
Date: Mon, 9 Sep 2002 11:28:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020909112820.A22704@hp.is>
References: <20020909110344.17667.qmail@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-Message-Id: <200209091138.g89BcdA23272@morpheus.hp.is>
Content-Disposition: inline
In-Reply-To: <20020909110344.17667.qmail@linuxmail.org>; from latouche@linuxmail.org on Mon, Sep 09, 2002 at 07:03:44PM +0800
Resent-To: netfilter@lists.netfilter.org
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
To: aurelien latouche <latouche@linuxmail.org>
Cc: netfilter@lists.netfilter.org

I believe that this might be related to ident requests from your
mail server to the internal server.

iptables -I FORWARD -p tcp --dport 113 -s 193.48.40.17 -j REJECT

This migth solve your problem.

- Tomas Edwardsson
- Unix/Linux Support
- Opin Kerfi Iceland

On Mon, Sep 09, 2002 at 07:03:44PM +0800, aurelien latouche wrote:
> X-Mailer: MIME-tools 5.41 (Entity 5.404)
> From: "aurelien latouche" <latouche@linuxmail.org>
> To: netfilter@lists.netfilter.org
> Subject: NAT+smtp+pop3
> Date: Mon, 09 Sep 2002 19:03:44 +0800
> 
> Hi,
> i'm using floppyfw 1.9 (netfilter)
> as a router for our lab (25 people)
> we're getting our mail with pop3  
> 
> 193.48.40.17 : mail server
> 193.48.40.211 : "NAT-box" outside eth0
> 10.x.x.1      : inside eth1     
> 
> when sending mail it takes 30 sec to contact the mail server
> any idea ?
> 
> 
> 
> -- 
> Get your free email from www.linuxmail.org 
> 
> 
> Powered by Outblaze

