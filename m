From: "Narendra Prabhu. B" <naren@deeproot.co.in>
Subject: Re: How to find nvl table?
Date: Tue, 15 Apr 2003 12:51:13 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0304151248240.1543-100000@abodh.pesit.deeproot.co.in>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


try iptables -nvL INPUT ....

INPUT not input

Narendra

-------------------------
Narendra Prabhu. B
DeepRoot Linux
http://www.deeproot.co.in

On Tue, 15 Apr 2003, Bobo wrote:

> HI
>
>      Some days ago ,a member of here reply me the followings about traffic account:
> >try this one:
> >
> >iptables -nvL INPUT
> >
> >in Perl:
> >
> >open(CHAINS, "iptables -nvL INPUT|") or die "Error reading chains\n";
> >
> >while(<CHAINS>)
> >{
> ># read the lines one by one, matching on the text you want
> >}
> >
> >close(CHAINS);
>
>    My platform is Redhat 7.2 in  default congiguration.
>
>   While I execute "iptables  -nvL input"
>
>   I got the following message on screen:
>
>
>    [root@myfirewall account]# iptables -nvL  input
> iptables: Table does not exist (do you need to insmod?)
>
>     why?  how to find the talbe? does  it need a special patch?
>
>  Thanks.
>
>
>


