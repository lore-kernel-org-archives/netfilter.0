From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Routing SMTP problem
Date: Fri, 14 Jun 2002 07:59:10 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020614115910.GA5563@cannon.eng.us.uu.net>
References: <1597F9D20963E347AC9E232F0F636DA8047BA2@server.skinners.highsun.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <1597F9D20963E347AC9E232F0F636DA8047BA2@server.skinners.highsun.com.au>
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
To: Ian Pollock <ianp@highsun.com.au>
Cc: netfilter@lists.samba.org

What you can do is to set up a dyn-dns for this dhcp interface and iclude that
in the set of the MX records... At any IP change you could encounter smtp
unreachability but it's not a big deal as the backup MX's would collect
the emails and send it to you at a later time...

Note that netfilter has nothing to do with your question and this solution.

Ramin

On Fri, Jun 14, 2002 at 01:19:24PM +1000, Ian Pollock wrote:

> Hi,
> Can anyone tell me if this is possible, we upgraded our internet access from isdn (small isp) to broadband (telstra). We had a static ip of eg:210.20.20.20 from our small isp on the isdn, with the new cable connection we get dhcp ip address which makes it hard for mail routing. Ok the big question can I alias the old static ip (small isp) we own of 210.20.20.20 to my external etho dhcp (from telstra) device (ip of 211.50.50.50) on my cable connection and route my mail through this way. I have included a few rules that I have in mind. Can anyone tell me if I am going down the wrong path with this and if they have any other way of doing it could they let me no (maybe I have to use pop3). Any help with this would be greatly appreciated, I tried to explain as best I could. Ian
> 
> iptables -t nat -A POSTROUTING -o eth0 -s my_mail_server -p tcp --dport 25 -j SNAT --to OLD_ISP_mail_server_ip:25    ## can this work??
> 
> iptables -t nat -A PREROUTING -I eth0 -p tcp --dport 25 -j DNAT --to my_mail_server:25          ## I no this works...
> 
> ps... any help with "how to alias" would be great too

