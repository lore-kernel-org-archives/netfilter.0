From: "Johannes Walch" <j.walch@nwe.de>
Subject: AW: How to find nvl table?
Date: Tue, 15 Apr 2003 09:49:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c30323$841170a0$5863a8c0@note>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: 'Bobo' <boboaq@163.com>, 'Stephane Ouellette' <ouellettes@videotron.ca>
Cc: netfilter@lists.netfilter.org


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

Try iptables -nvL INPUT
Default chains are in capital letters.
By the way : Reading the man page would have answered this.

johannes walch

