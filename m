From: "Big Daddy" <bigdaddy@monster-solutions.net>
Subject: Re: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 15:51:58 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000d01c226b8$eb7b9ce0$6702a8c0@internal.monstersolutions.net>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net> <3D29EB93.9080109@shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@lists.samba.org

It worked when I was using a Linksys router. However maybe they have changed
it since then. Do my rules look fine?

----- Original Message -----
From: "Tom Eastep" <teastep@shorewall.net>
To: "Big Daddy" <bigdaddy@monster-solutions.net>
Cc: <netfilter@lists.samba.org>
Sent: Monday, July 08, 2002 3:44 PM
Subject: Re: HTTP Port forwarding issues


> Big Daddy wrote:
> > all,
> >      for some reason i can get my smtp and pop3 to route from
> > the  internet, but i cannot get http requests to forward correctly.
> >
> >  iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m
> > state --state NEW -j ACCEPT
> >  iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport smtp -m
> > state --state NEW -j ACCEPT (works)
> >  iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport pop3 -m
> > state --state NEW -j ACCEPT (works)
> >
> >  iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport smtp -j DNAT
> > --to-destination $int_smtp:25 (works)
> >  iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport pop3 -j DNAT
> > --to-destination $int_pop3:110 (works)
> >  iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j DNAT
> > --to-destination $int_http:80
> >
> >  web server is running IIS5.
> > any help would be great!
>
> More than likely your ISP is blocking incoming HTTP requests.
>
> -Tom
> --
> Tom Eastep    \ Shorewall - iptables made easy
> AIM: tmeastep  \ http://www.shorewall.net
> ICQ: #60745924  \ teastep@shorewall.net
>


